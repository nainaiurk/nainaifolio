# Quick Start - Native Portfolio

## ✅ Installation Complete!

Your native HTML/CSS/JS portfolio is ready in the `native-portfolio` folder.

## 📂 Files Created
- **index.html** - Main portfolio page (complete with all sections)
- **css/styles.css** - All styling (responsive, professional design)
- **js/data.js** - Your complete portfolio data
- **js/main.js** - Interactive features (modals, carousels, navigation)
- **assets/images/** - Local image assets (copied from Flutter project)
- **test.html** - Test page to verify data loading
- **deploy.ps1** - Deployment helper script

## 🚀 How to View

### Method 1: Direct Browser
```bash
# Open index.html directly in your browser
Start-Process native-portfolio\index.html
```

### Method 2: Local Server (Recommended)
```bash
# Using Python
cd native-portfolio
python -m http.server 8000
# Visit: http://localhost:8000

# Using Node.js
npx http-server native-portfolio -p 8080
# Visit: http://localhost:8080
```

### Method 3: Use Deployment Script
```bash
cd native-portfolio
.\deploy.ps1
```

## 🌐 Deploy Online

### Vercel (Easiest)
```bash
cd native-portfolio
npm i -g vercel
vercel --prod
```

### Netlify
1. Go to https://app.netlify.com/drop
2. Drag and drop the `native-portfolio` folder
3. Done!

### GitHub Pages
1. Push to GitHub
2. Settings → Pages → Select branch
3. Select `/native-portfolio` folder

## 📊 Comparison with Flutter

| Feature | Flutter Web | Native HTML |
|---------|-------------|-------------|
| Bundle Size | ~2-3 MB | ~50 KB |
| Load Time | 2-3s | <1s |
| SEO | Limited | Full |
| Text Selection | Blocked | Native |
| Right-click | Disabled | Enabled |
| Dependencies | Large | None |

## 🎨 Customization

### Change Colors
Edit `css/styles.css`:
```css
:root {
  --primary: #0B2D5B;      /* Change primary color */
  --secondary: #B7882E;    /* Change secondary color */
  --background: #F4F6F8;   /* Change background */
}
```

### Update Content
Edit `js/data.js` - all your portfolio data is there:
- Personal info
- Projects
- Experience
- Skills
- Publications
- Awards

### Add New Sections
1. Add HTML in `index.html`
2. Add styling in `css/styles.css`
3. Add rendering logic in `js/main.js`

## 📱 Mobile Support
Fully responsive with breakpoints:
- Desktop: > 768px
- Tablet: 481px - 768px
- Mobile: < 480px

## ⚡ Performance Features
- Lazy image loading
- Smooth scroll
- CSS animations
- Efficient selectors
- No frameworks = Fast!

## 🐛 Troubleshooting

**Images not loading?**
- Check that images are in `assets/images/`
- Or update URLs in `js/data.js` to use external links

**JavaScript not working?**
- Open browser console (F12)
- Check for errors
- Ensure all scripts are loading

**Styles not applying?**
- Clear browser cache (Ctrl+F5)
- Check CSS file path in index.html

## 📝 Testing Checklist
- [ ] Open test.html to verify data loads
- [ ] Check all sections render
- [ ] Test project modals
- [ ] Test award gallery
- [ ] Test on mobile (Chrome DevTools)
- [ ] Verify all links work
- [ ] Test image carousel

## 🎯 Next Steps
1. Open `test.html` to verify everything works
2. Open `index.html` to see full portfolio
3. Customize colors/content as needed
4. Deploy to your favorite platform!

## 📞 Support
Need help? Contact:
- Email: nainaiu.rakhaine@gmail.com
- GitHub: @nainaiurk

---

**Enjoy your new native portfolio! 🚀**
