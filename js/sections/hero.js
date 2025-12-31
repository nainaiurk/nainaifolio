// Typewriter effect for tagline
function typeWriter(element, text, speed = 100, callback) {
  let i = 0;
  element.textContent = '';
  element.style.position = 'relative';
  
  function type() {
    if (i < text.length) {
      element.textContent += text.charAt(i);
      i++;
      setTimeout(type, speed);
    } else if (callback) {
      callback();
    }
  }
  type();
}

// Hero Section Renderer
function renderHero() {
  const hero = portfolioData.hero;
  document.getElementById('heroName').textContent = hero.name;
  document.getElementById('heroTitle').textContent = hero.title;
  
  // Apply typewriter effect to tagline
  const taglineElement = document.getElementById('heroTagline');
  typeWriter(taglineElement, hero.tagline, 80, () => {
    // Add wave icon after typing completes
    const waveSpan = document.createElement('span');
    waveSpan.className = 'wave';
    waveSpan.textContent = ' 👋';
    taglineElement.appendChild(waveSpan);
  });
  
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
