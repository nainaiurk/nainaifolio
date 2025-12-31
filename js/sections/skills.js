// Skills Section Renderer
function renderSkills() {
  const skillsHTML = Object.entries(portfolioData.skills).map(([category, skills]) => `
    <div class="skill-category compact">
      <h3 class="skill-category-title">${category}</h3>
      <div class="skill-list compact">
        ${skills.map(skill => `<span class="skill-label compact">${skill.label}</span>`).join('')}
      </div>
    </div>
  `).join('');
  document.getElementById('skillsList').innerHTML = skillsHTML;
}
