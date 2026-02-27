# AI Content Site - Automated Passive Income Generator

An automated content site that generates SEO-optimized articles about AI tools, productivity, and passive income. Built with Jekyll and designed for hands-off monetization.

## 🚀 Quick Start

### Option 1: Deploy to GitHub Pages (Free Hosting)

```bash
# 1. Navigate to the site
cd ~/ai-content-site

# 2. Initialize git repo (if not done)
git init
git remote add origin https://github.com/YOUR-USERNAME/ai-content-site.git

# 3. Deploy
bash scripts/deploy-gh-pages.sh
```

Then go to GitHub repo settings → Pages → Enable GitHub Pages.

### Option 2: Run Locally

```bash
# Install dependencies
gem install jekyll bundler
bundle install

# Run development server
bundle exec jekyll serve

# View at http://localhost:4000
```

## 🤖 Automated Content Generation

### Generate Articles Manually

```bash
bash scripts/generate-content.sh
```

This creates 2 new SEO-optimized articles in `_posts/` folder.

### Schedule Daily Content (Recommended)

```bash
# Setup cron job for daily generation at 8 AM
bash scripts/setup-cron.sh
```

Or add to your crontab manually:
```
0 8 * * * cd ~/ai-content-site && bash scripts/scheduler.sh
```

## 📁 Project Structure

```
ai-content-site/
├── _config.yml              # Site configuration
├── _layouts/                # HTML templates
│   ├── default.html
│   └── post.html
├── _posts/                  # Generated articles
├── _includes/               # Reusable components
├── assets/                  # CSS, images
├── scripts/                 # Automation scripts
│   ├── generate-content.sh  # Creates articles
│   ├── scheduler.sh         # Build & deploy
│   ├── setup-cron.sh        # Schedule automation
│   ├── deploy-gh-pages.sh   # Deploy to GitHub
│   └── topics.txt           # Article topic database
└── README.md
```

## 💰 Monetization Setup

### 1. Amazon Affiliate

1. Sign up at: https://affiliate-program.amazon.com/
2. Get your tracking ID
3. Update `_config.yml`:
   ```yaml
   affiliate_amazon: "YOUR-AMAZON-ID"
   ```

### 2. Google AdSense

1. Apply at: https://www.google.com/adsense/
2. Get your publisher ID
3. Update `_config.yml`:
   ```yaml
   google_adsense: "YOUR-ADSENSE-ID"
   ```

### 3. Newsletter (ConvertKit/Mailchimp)

1. Sign up at ConvertKit or Mailchimp
2. Create a signup form
3. Update the newsletter section in `index.html`

## 📄 Article Generation

The `generate-content.sh` script:

- Generates 2 articles per run (configurable)
- Creates SEO-optimized titles and content structure
- Includes affiliate link placeholders
- Adds proper front matter for Jekyll
- Word count: 800-1500 words per article

Topics are randomly selected from `scripts/topics.txt` - you can add more:
```
Topic Name|category|keyword1, keyword2, keyword3
```

## 🔄 Content Workflow

```
Daily (8 AM):
  ↓
Generate 2 Articles → Commit to GitHub → Deploy to Pages

Weekly:
  ↓
Review articles → Edit for quality → Update affiliate links

Monthly:
  ↓
Analytics review → Topic optimization → Revenue check
```

## 🎯 SEO Best Practices

Articles include:
- ✓ Meta descriptions
- ✓ Keyword optimization
- ✓ Proper heading structure (H1, H2, H3)
- ✓ Internal linking suggestions
- ✓ Affiliate disclaimers
- ✓ Mobile-responsive design
- ✓ Fast loading (static site)
- ✓ XML sitemap (auto-generated)

## 📊 Traffic Growth Strategy

**Months 1-3:** Content foundation
- 2 articles/day = ~180 articles
- Focus on long-tail keywords
- Build topical authority

**Months 4-6:** Promotion
- Social media automation
- Newsletter growth
- Backlink building

**Months 7-12:** Monetization
- Optimize high-traffic articles
- Add premium affiliate offers
- Test ad placements

## ⚙️ Customization

### Change the Niche

Edit `scripts/topics.txt` with your topics:
```
Your Topic|category|seo, keywords, here
```

### Modify Article Template

Edit the template in `scripts/generate-content.sh` (line ~50+).

### Adjust Posting Frequency

In `scripts/generate-content.sh`:
```bash
POSTS_PER_DAY=2  # Change this number
```

## 🛠️ Troubleshooting

**Jekyll build fails:**
```bash
bundle update
```

**Permission denied:**
```bash
chmod +x scripts/*.sh
```

**Cron job not running:**
```bash
crontab -l  # Check if job exists
cat cron.log  # Check for errors
```

**GitHub Pages not updating:**
- Ensure repo is public
- Check Pages settings
- Verify CNAME if using custom domain

## 📈 Expected Results

With consistent content generation:

| Timeline | Articles | Est. Monthly Visitors | Est. Revenue |
|----------|----------|----------------------|--------------|
| Month 1  | 60       | 100-500              | $0-10        |
| Month 3  | 180      | 1,000-5,000          | $20-100      |
| Month 6  | 360      | 5,000-20,000         | $100-500     |
| Month 12 | 720      | 20,000-50,000        | $500-2,000   |

