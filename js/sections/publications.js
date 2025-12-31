// Publications Section Renderer
function renderPublications() {
  const allPubs = [
    ...portfolioData.publications.peerReviewed,
    ...portfolioData.publications.additional
  ];

  // Count by type
  const conferenceCount = allPubs.filter(p => p.type === 'Conference' && !p.status).length;
  const journalCount = allPubs.filter(p => p.type === 'Journal').length;
  const acceptedCount = allPubs.filter(p => p.status).length;

  // Update publication stats
  const statsElement = document.querySelector('.publication-stats');
  if (statsElement) {
    statsElement.textContent = `(${conferenceCount} Conference, ${journalCount} Journal, ${acceptedCount} Accepted)`;
  }

  function apa(pub) {
    const statusBadge = pub.status ? `<span class="pub-status-badge">Accepted, Not Published Yet</span>` : '';
    return `<div class="publication-item">
      <span class="pub-bullet">•</span>
      <div class="pub-content">
        <span class="pub-authors">${pub.authors}</span> (<span class="pub-year">${pub.year}</span>). <a href="${pub.link}" target="_blank" rel="noopener" class="pub-title">${pub.title}</a>. <span class="pub-venue">${pub.venue}</span>. ${statusBadge}
      </div>
    </div>`;
  }

  const peerReviewedHTML = portfolioData.publications.peerReviewed.map(apa).join('');
  const additionalHTML = portfolioData.publications.additional.length > 0 
    ? `<h4 class="pub-subsection-title">Additional Publications</h4>${portfolioData.publications.additional.map(apa).join('')}`
    : '';

  document.getElementById('publicationsList').innerHTML = `
    ${peerReviewedHTML}
    ${additionalHTML}
  `;
}
