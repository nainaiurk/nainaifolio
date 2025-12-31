// Expertise Areas Section Renderer
function renderExpertise() {
  const expertiseHTML = portfolioData.expertiseAreas.map((item, index) => `
    <div class="expertise-card" onclick="openExpertiseModal(${index})">
      <div class="expertise-icon" style="background: ${item.color}">
        <i class="fas ${item.icon}"></i>
      </div>
      <h3 class="expertise-title">${item.label}</h3>
    </div>
  `).join('');
  document.getElementById('expertiseList').innerHTML = expertiseHTML;
}

function openExpertiseModal(index) {
  const item = portfolioData.expertiseAreas[index];
  const modal = document.getElementById('expertiseModal');
  
  document.getElementById('expertiseModalIcon').innerHTML = `<i class="fas ${item.icon}"></i>`;
  document.getElementById('expertiseModalIcon').style.background = item.color;
  document.getElementById('expertiseModalTitle').textContent = item.label;
  document.getElementById('expertiseModalDescription').textContent = item.description;
  
  modal.style.display = 'flex';
  document.body.style.overflow = 'hidden';
}
