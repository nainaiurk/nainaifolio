// Leadership Section Renderer
function renderLeadership() {
  const leadershipList = document.getElementById('leadershipList');
  leadershipList.innerHTML = '';
  portfolioData.leadership.forEach((item, idx) => {
    const card = document.createElement('div');
    card.className = 'leadership-card compact';

    const header = document.createElement('div');
    header.className = 'leadership-header';
    header.innerHTML = `
      <div class="leadership-logo-title">
        ${item.logo ? `<span class="leadership-logo"><img src="${item.logo}" alt="${item.organization} logo" class="leadership-logo-img"></span>` : ''}
        <div>
          <h3 class="leadership-title">
            ${item.titleUrl ? `<a href="${item.titleUrl}" target="_blank" rel="noopener">${item.title}</a>` : item.title}
          </h3>
          <p class="leadership-org">${item.organization}</p>
        </div>
      </div>
      <div class="leadership-meta">
        <span class="leadership-period">${item.period}</span>
        ${item.location ? `<span class="leadership-location">${item.location}</span>` : ''}
        <button class="leadership-toggle" aria-expanded="false" aria-controls="leadership-details-${idx}" title="Show details">
          <span class="chevron">&#9660;</span>
        </button>
      </div>
    `;

    const details = document.createElement('div');
    details.className = 'leadership-details';
    details.id = `leadership-details-${idx}`;
    details.style.display = 'none';
    details.innerHTML = `
      <ul class="leadership-highlights">${item.highlights.map(h => `<li>${h}</li>`).join('')}</ul>
    `;

    const toggleButton = header.querySelector('.leadership-toggle');
    const toggleFunction = function(e) {
      // Prevent toggle if clicking on a link
      if (e.target.tagName === 'A') return;
      const expanded = details.style.display === 'block';
      details.style.display = expanded ? 'none' : 'block';
      toggleButton.setAttribute('aria-expanded', String(!expanded));
      toggleButton.querySelector('.chevron').innerHTML = expanded ? '&#9660;' : '&#9650;';
    };
    
    // Make entire header clickable
    header.style.cursor = 'pointer';
    header.onclick = toggleFunction;

    card.appendChild(header);
    card.appendChild(details);
    leadershipList.appendChild(card);
  });
}
