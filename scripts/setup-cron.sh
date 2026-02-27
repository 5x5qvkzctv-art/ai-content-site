#!/bin/bash
# Setup automated content generation with cron
# Run this once to schedule daily content generation

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SCHEDULER="$SCRIPT_DIR/scheduler.sh"

echo "Setting up automated content generation..."
echo ""

# Make scripts executable
chmod +x "$SCRIPT_DIR/generate-content.sh"
chmod +x "$SCRIPT_DIR/scheduler.sh"

# Create cron job for daily content generation (runs at 8 AM)
CRON_JOB="0 8 * * * cd $(dirname "$SCRIPT_DIR") && bash $SCHEDULER >> $(dirname "$SCRIPT_DIR")/cron.log 2>&1"

# Check if cron job already exists
if crontab -l 2>/dev/null | grep -q "$SCHEDULER"; then
    echo "⚠️  Cron job already exists."
else
    # Add cron job
    (crontab -l 2>/dev/null; echo "$CRON_JOB") | crontab -
    echo "✅ Cron job added: Daily content generation at 8:00 AM"
fi

echo ""
echo "Current cron jobs:"
crontab -l 2>/dev/null | grep -E "(COMMAND|scheduler)" || echo "  No jobs found"

echo ""
echo "To manually run content generation:"
echo "  bash $SCRIPT_DIR/generate-content.sh"
echo ""
echo "To manually publish:"
echo "  bash $SCHEDULER"