// Awards Section Renderer
function renderAwards() {
  const awardsHTML = portfolioData.awards.map((award, index) => `
    <div class="award-card" onclick="openAwardModal(${index})">
      <div class="award-image">
        <img src="${award.thumbnailUrl}" alt="${award.title}" loading="lazy">
      </div>
      <div class="award-content">
        <h4 class="award-title">${award.title}</h4>
        <p class="award-issuer">${award.issuer}</p>
        <p class="award-date">${award.date}</p>
      </div>
    </div>
  `).join('');
  document.getElementById('awardsList').innerHTML = awardsHTML;
}

function openAwardModal(index) {
  const award = portfolioData.awards[index];
  const modal = document.getElementById('awardModal');

  document.getElementById('awardModalTitle').textContent = award.title;
  document.getElementById('awardModalIssuer').textContent = award.issuer;
  document.getElementById('awardModalDate').textContent = award.date;
  
  const awardImage = document.getElementById('awardModalImage');
  awardImage.src = award.fullImageUrl;
  awardImage.style.cursor = 'pointer';
  awardImage.onclick = () => openLightbox(award.fullImageUrl);
  
  document.getElementById('awardModalHighlights').textContent = award.highlights;

  const tagsHTML = award.tags.map(tag => `<span class="award-tag">${tag}</span>`).join('');
  document.getElementById('awardModalTags').innerHTML = tagsHTML;

  modal.style.display = 'flex';
  document.body.style.overflow = 'hidden';
}
