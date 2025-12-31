// Experience Section Renderer
function renderExperience() {
  const experienceList = document.getElementById('experienceList');
  experienceList.innerHTML = '';
  portfolioData.experience.forEach((exp, idx) => {
    const card = document.createElement('div');
    card.className = 'experience-card compact';

    const header = document.createElement('div');
    header.className = 'exp-header';
    header.innerHTML = `
      <div class="exp-logo-role">
        ${exp.logo ? `<span class="exp-logo"><img src="${exp.logo}" alt="${exp.organization} logo" class="exp-logo-img"></span>` : ''}
        <div>
          <h3 class="exp-role">${exp.role}</h3>
          <p class="exp-org">${exp.organizationLink ? `<a href="${exp.organizationLink}" target="_blank" rel="noopener">${exp.organization}</a>` : exp.organization}</p>
          ${exp.supervisor ? `<p class="exp-supervisor">Supervisor: ${exp.professorLink ? `<a href="${exp.professorLink}" target="_blank" rel="noopener">${exp.supervisor}</a>` : exp.supervisor}</p>` : ''}
        </div>
      </div>
      <div class="exp-meta">
        <span class="exp-period">${exp.period}</span>
        <span class="exp-location">${exp.location}</span>
        <button class="exp-toggle" aria-expanded="false" aria-controls="exp-details-${idx}" title="Show details">
          <span class="chevron">&#9660;</span>
        </button>
      </div>
    `;

    const details = document.createElement('div');
    details.className = 'exp-details';
    details.id = `exp-details-${idx}`;
    details.style.display = 'none';
    details.innerHTML = `
      <ul class="exp-highlights">${exp.highlights.map(h => `<li>${h}</li>`).join('')}</ul>
    `;

    const toggleButton = header.querySelector('.exp-toggle');
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
    experienceList.appendChild(card);
  });
}
