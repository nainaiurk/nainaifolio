// Hero Section Renderer
function renderHero() {
  const hero = portfolioData.hero;
  document.getElementById('heroName').textContent = hero.name;
  document.getElementById('heroTitle').textContent = hero.title;
  document.getElementById('heroTagline').textContent = hero.tagline;
  document.getElementById('heroImage').src = hero.image;
  document.getElementById('heroCvLink').href = hero.cvUrl;

  const socialsHTML = hero.socials.map(social => {
    // Use 'fas' for graduation-cap, 'fab' for brand icons (linkedin, github)
    const iconClass = social.icon === 'fa-graduation-cap' ? 'fas' : 'fab';
    return `
      <a href="${social.url}" target="_blank" rel="noopener" class="social-link" title="${social.platform}">
        <i class="${iconClass} ${social.icon}"></i>
      </a>
    `;
  }).join('');
  document.getElementById('heroSocials').innerHTML = socialsHTML;
}
