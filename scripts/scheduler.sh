#!/bin/bash
# AI Content Site - Automated Publishing Scheduler
# Run this with cron to auto-generate and publish content

set -e

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SITE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
LOG_FILE="$SITE_DIR/publish.log"

# Configuration
GHPAGES_BRANCH="gh-pages"
GIT_REMOTE="origin"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

# Generate new content
generate_content() {
    log "Generating new content..."
    cd "$SITE_DIR"
    
    # Run content generation
    bash "$SCRIPT_DIR/generate-content.sh"
    
    log "Content generation complete"
}

# Build and deploy to GitHub Pages
deploy() {
    log "Building site..."
    cd "$SITE_DIR"
    
    # If using Jekyll locally
    if command -v jekyll &> /dev/null; then
        jekyll build
        log "Jekyll build complete"
    fi
    
    # Commit and push if git repo initialized
    if [ -d "$SITE_DIR/.git" ]; then
        log "Committing new content..."
        git add _posts/
        git commit -m "Auto-generated content: $(date +%Y-%m-%d)" || true
        git push origin main || true
        log "Content pushed to repository"
    else
        log "No git repository found. Skipping push."
    fi
}

# Main execution
main() {
    log "=== Starting automated publish cycle ==="
    
    generate_content
    deploy
    
    log "=== Publish cycle complete ==="
}

# Run if executed directly
if [ "${BASH_SOURCE[0]}" == "${0}" ]; then
    main "$@"
fi