// Projects Section Renderer
let currentProjectIndex = 0;
let currentImageIndex = 0;
let slideshowInterval = null;
let isAutoPlaying = false;
let isTransitioning = false;

function renderProjects() {
  const projectsHTML = portfolioData.projects.map((project, index) => `
    <div class="project-card" onclick="openProjectModal(${index})">
      <div class="project-image">
        <img src="${project.imageUrl}" alt="${project.title}" loading="lazy">
        ${project.remark ? `<span class="project-badge">${project.remark}</span>` : ''}
      </div>
      <div class="project-content">
        <h3 class="project-title">${project.title}</h3>
        <p class="project-subtitle">${project.subtitle}</p>
      </div>
    </div>
  `).join('');
  document.getElementById('projectsList').innerHTML = projectsHTML;
}

function openProjectModal(index) {
  const project = portfolioData.projects[index];
  currentProjectIndex = index;
  currentImageIndex = 0;

  const modal = document.getElementById('projectModal');
  document.getElementById('modalTitle').textContent = project.title;
  document.getElementById('modalSubtitle').textContent = project.subtitle;
  document.getElementById('modalDescription').textContent = project.description;

  // Achievements
  const achievementsHTML = project.achievements ? 
    `<h4>Key Achievements</h4><ul>${project.achievements.map(a => `<li>${a}</li>`).join('')}</ul>` : '';
  document.getElementById('modalAchievements').innerHTML = achievementsHTML;

  // Links
  const linksHTML = [];
  if (project.videoUrl) linksHTML.push(`<a href="${project.videoUrl}" target="_blank" class="modal-link"><i class="fab fa-youtube"></i> Watch Video</a>`);
  if (project.documentationUrl) linksHTML.push(`<a href="${project.documentationUrl}" target="_blank" class="modal-link"><i class="fab fa-github"></i> Documentation</a>`);
  if (project.otherLinks) {
    project.otherLinks.forEach((link, i) => {
      linksHTML.push(`<a href="${link}" target="_blank" class="modal-link"><i class="fas fa-link"></i> Link ${i + 1}</a>`);
    });
  }
  document.getElementById('modalLinks').innerHTML = linksHTML.join('');

  // Image carousel or single image
  renderProjectImages(project);

  modal.style.display = 'flex';
  document.body.style.overflow = 'hidden';
}

function renderProjectImages(project) {
  const images = project.images || [project.imageUrl];
  const container = document.getElementById('modalImageContainer');

  if (images.length === 1) {
    container.innerHTML = `<img src="${images[0]}" alt="${project.title}" class="modal-single-image">`;
    stopSlideshow();
  } else {
    // Add all images plus clone of first image for infinite loop
    const slidesHTML = images.map((img, idx) => `
      <div class="carousel-slide ${idx === 0 ? 'active' : ''}">
        <img src="${img}" alt="${project.title}" class="modal-carousel-image" onclick="openLightbox('${img}'); event.stopPropagation();" style="cursor: pointer;">
      </div>
    `).join('');
    
    // Clone of first image for seamless loop
    const cloneHTML = `
      <div class="carousel-slide carousel-clone">
        <img src="${images[0]}" alt="${project.title}" class="modal-carousel-image" onclick="openLightbox('${images[0]}'); event.stopPropagation();" style="cursor: pointer;">
      </div>
    `;
    
    const carouselHTML = `
      <div class="modal-carousel">
        <button class="carousel-btn carousel-prev" onclick="prevImage()">
          <i class="fas fa-chevron-left"></i>
        </button>
        <div class="carousel-track" id="carouselTrack">
          ${slidesHTML}${cloneHTML}
        </div>
        <button class="carousel-btn carousel-next" onclick="nextImage()">
          <i class="fas fa-chevron-right"></i>
        </button>
        <div class="carousel-indicator">1 / ${images.length}</div>
      </div>
    `;
    container.innerHTML = carouselHTML;
    startSlideshow();
  }
}

function prevImage() {
  if (isTransitioning) return;
  
  const project = portfolioData.projects[currentProjectIndex];
  const images = project.images || [project.imageUrl];
  const track = document.getElementById('carouselTrack');
  if (!track) return;
  
  isTransitioning = true;
  
  // If at first image, jump to clone instantly then slide to last real image
  if (currentImageIndex === 0) {
    track.style.transition = 'none';
    currentImageIndex = images.length;
    track.style.transform = `translateX(-${currentImageIndex * 100}%)`;
    
    // Force reflow
    track.offsetHeight;
    
    // Now slide to last real image
    setTimeout(() => {
      track.style.transition = 'transform 0.6s ease-in-out';
      currentImageIndex = images.length - 1;
      track.style.transform = `translateX(-${currentImageIndex * 100}%)`;
      
      setTimeout(() => {
        isTransitioning = false;
      }, 600);
    }, 50);
  } else {
    currentImageIndex--;
    track.style.transform = `translateX(-${currentImageIndex * 100}%)`;
    
    setTimeout(() => {
      isTransitioning = false;
    }, 600);
  }
  
  // Update indicator
  const indicator = document.querySelector('.carousel-indicator');
  if (indicator) {
    indicator.textContent = `${currentImageIndex + 1} / ${images.length}`;
  }
  
  if (isAutoPlaying) {
    clearInterval(slideshowInterval);
    slideshowInterval = setInterval(() => nextImage(), 3000);
  }
}

function nextImage() {
  if (isTransitioning) return;
  
  const project = portfolioData.projects[currentProjectIndex];
  const images = project.images || [project.imageUrl];
  const track = document.getElementById('carouselTrack');
  if (!track) return;
  
  isTransitioning = true;
  currentImageIndex++;
  
  // Slide to next position (including clone)
  track.style.transform = `translateX(-${currentImageIndex * 100}%)`;
  
  // Update indicator
  const displayIndex = currentImageIndex >= images.length ? 0 : currentImageIndex;
  const indicator = document.querySelector('.carousel-indicator');
  if (indicator) {
    indicator.textContent = `${displayIndex + 1} / ${images.length}`;
  }
  
  // If we reached the clone, wait for transition then jump to real first image
  if (currentImageIndex >= images.length) {
    setTimeout(() => {
      track.style.transition = 'none';
      currentImageIndex = 0;
      track.style.transform = `translateX(0%)`;
      
      // Re-enable transition
      setTimeout(() => {
        track.style.transition = 'transform 0.6s ease-in-out';
        isTransitioning = false;
      }, 50);
    }, 600);
  } else {
    setTimeout(() => {
      isTransitioning = false;
    }, 600);
  }
  
  if (isAutoPlaying) {
    clearInterval(slideshowInterval);
    slideshowInterval = setInterval(() => nextImage(), 3000);
  }
}

function startSlideshow() {
  const project = portfolioData.projects[currentProjectIndex];
  const images = project.images || [project.imageUrl];
  
  if (images.length > 1) {
    isAutoPlaying = true;
    updatePlayPauseButton();
    slideshowInterval = setInterval(() => {
      nextImage();
    }, 3000); // Change image every 3 seconds
  }
}

function stopSlideshow() {
  if (slideshowInterval) {
    clearInterval(slideshowInterval);
    slideshowInterval = null;
  }
  isAutoPlaying = false;
  updatePlayPauseButton();
}

function toggleSlideshow() {
  if (isAutoPlaying) {
    stopSlideshow();
  } else {
    startSlideshow();
  }
}

function toggleSlideshow() {
  if (isAutoPlaying) {
    stopSlideshow();
  } else {
    startSlideshow();
  }
}

function updatePlayPauseButton() {
  const btn = document.getElementById('playPauseBtn');
  if (btn) {
    btn.innerHTML = isAutoPlaying 
      ? '<i class="fas fa-pause"></i>' 
      : '<i class="fas fa-play"></i>';
  }
}

function closeProjectModal() {
  stopSlideshow();
  document.getElementById('projectModal').style.display = 'none';
}

// Lightbox functions for full-screen image view
function openLightbox(imageSrc) {
  const lightbox = document.getElementById('imageLightbox');
  const lightboxImage = document.getElementById('lightboxImage');
  lightboxImage.src = imageSrc;
  lightbox.style.display = 'flex';
  document.body.style.overflow = 'hidden';
}

function closeLightbox() {
  const lightbox = document.getElementById('imageLightbox');
  lightbox.style.display = 'none';
  document.body.style.overflow = 'auto';
}

// Prevent lightbox close when clicking on the image itself
document.addEventListener('DOMContentLoaded', () => {
  const lightboxImage = document.getElementById('lightboxImage');
  if (lightboxImage) {
    lightboxImage.addEventListener('click', (e) => {
      e.stopPropagation();
    });
  }
});
