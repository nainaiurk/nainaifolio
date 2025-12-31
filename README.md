# Nainaiu Rakhaine - Native Portfolio Website

## Overview
This is a native HTML/CSS/JavaScript version of the Flutter portfolio, providing an exact replica with better performance and SEO.

## Features
- ✅ Pure HTML/CSS/JavaScript (no frameworks)
- ✅ Fully responsive design (mobile, tablet, desktop)
- ✅ Interactive project modals with image carousels
- ✅ Certificate gallery with modal previews
- ✅ Smooth scroll navigation
- ✅ SEO optimized
- ✅ Fast loading (~50KB vs 2MB+ Flutter)

## File Structure
```
native-portfolio/
├── index.html          # Main HTML structure
├── css/
│   └── styles.css      # All styling
├── js/
│   ├── data.js         # Portfolio data
│   └── main.js         # Interactive features
└── assets/
    └── images/         # Image assets (if using local images)
```

## How to Run

### Local Development
1. Open `index.html` directly in a browser, or
2. Use a local server:
   ```bash
   # Using Python
   python -m http.server 8000
   
   # Using Node.js (http-server)
   npx http-server
   ```

### Deploy to Vercel
1. Install Vercel CLI: `npm i -g vercel`
2. Navigate to native-portfolio folder: `cd native-portfolio`
3. Run: `vercel --prod`

### Deploy to Netlify
1. Drag and drop the `native-portfolio` folder to Netlify
2. Or use Netlify CLI:
   ```bash
   npm i -g netlify-cli
   netlify deploy --prod --dir=.
   ```

### Deploy to GitHub Pages
1. Push to GitHub repository
2. Go to Settings → Pages
3. Select branch and `/native-portfolio` folder
4. Save

## Customization

### Update Content
Edit `js/data.js` to modify:
- Personal information
- Projects
- Experience
- Skills
- Publications
- Awards
- Contact info

### Update Styling
Edit `css/styles.css` to change:
- Colors (CSS variables in `:root`)
- Fonts
- Layouts
- Animations

### Add Features
Edit `js/main.js` to add:
- New interactions
- Animations
- Form handling
- Analytics

## Performance Comparison

| Metric | Flutter Web | Native HTML |
|--------|-------------|-------------|
| Initial Bundle | ~2MB | ~50KB |
| First Paint | 2-3s | <1s |
| SEO Crawlable | Limited | Full |
| Right-click Copy | No | Yes |

## Browser Compatibility
- Chrome/Edge: ✅
- Firefox: ✅
- Safari: ✅
- Mobile browsers: ✅

## License
© 2025 Nainaiu Rakhaine. All rights reserved.

## Contact
- Email: nainaiu.rakhaine@gmail.com
- LinkedIn: https://www.linkedin.com/in/nainaiu-rakhaine/
- GitHub: https://github.com/nainaiurk
