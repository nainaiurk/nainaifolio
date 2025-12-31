// Education Section Renderer
function renderEducation() {
  const edu = portfolioData.education;
  const educationHTML = `
    <div class="education-card">
      ${edu.logo ? `<img src="${edu.logo}" alt="${edu.institution} logo" class="edu-logo">` : ''}
      <div class="edu-content">
        <h3 class="edu-degree">${edu.degree}</h3>
        <div class="edu-header">
          <p class="edu-institution">
            ${edu.institutionUrl ? `<a href="${edu.institutionUrl}" target="_blank" rel="noopener">${edu.institution}</a>` : edu.institution}
          </p>
          <p class="edu-duration">${edu.duration}</p>
        </div>
        <p class="edu-description">${edu.description}</p>
      </div>
    </div>
  `;
  document.getElementById('educationList').innerHTML = educationHTML;
}
