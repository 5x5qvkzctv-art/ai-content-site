#!/bin/bash
# Deploy AI Content Site to GitHub Pages

set -e

SITE_DIR="$(cd "$(dirname "$0")/.." && pwd)"
cd "$SITE_DIR"

echo "🚀 Deploying AI Content Site to GitHub Pages..."

# Check if GitHub repo is configured
if ! git remote -v > /dev/null 2>&1; then
    echo "❌ No git remote configured. Please set up a GitHub repository first:"
    echo "   1. Create repo at github.com/new"
    echo "   2. Run: git remote add origin https://github.com/YOUR-USERNAME/ai-content-site.git"
    exit 1
fi

# Build Jekyll site if available
if command -v jekyll &> /dev/null; then
    echo "📦 Building Jekyll site..."
    jekyll build
    echo "✅ Build complete"
else
    echo "⚠️  Jekyll not installed. Using static files."
    echo "   To install: gem install jekyll bundler"
fi

# Commit and push
echo "📤 Pushing to GitHub..."
git add .
git commit -m "Initial site setup - $(date +%Y-%m-%d)" || echo "Nothing new to commit"
git push -u origin main

echo ""
echo "✅ Site pushed to GitHub!"
echo ""
echo "Next steps:"
echo "   1. Go to your GitHub repo settings"
echo "   2. Scroll to Pages section"
echo "   3. Set source to 'Deploy from a branch'"
echo "   4. Select 'main' branch and / (root) folder"
echo "   5. Wait 2-3 minutes for your site to go live!"
echo ""
echo "🌐 Your site will be at:"
echo "   https://YOUR-USERNAME.github.io/ai-content-site/"