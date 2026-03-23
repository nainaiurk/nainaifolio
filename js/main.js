// Main Application Logic
class Portfolio {
  constructor() {
    this.currentProjectIndex = 0;
    this.currentImageIndex = 0;
    this.init();
  }

  init() {
    console.log('Initializing portfolio...');
    console.log('Portfolio data:', portfolioData);
    this.renderHero();
    this.renderIntroduction();
    this.renderExpertise();
    this.renderEducation();
    this.renderExperience();
    this.renderPublications();
    this.renderProjects();
    this.renderSkills();
    this.renderLeadership();
    this.renderAwards();
    this.renderContact();
    this.setupSmoothScroll();
    this.setupNavigation();
    console.log('Portfolio initialized successfully!');
  }

  renderHero() {
    const hero = portfolioData.hero;
    document.getElementById('heroName').textContent = hero.name;
    document.getElementById('heroTitle').textContent = hero.title;
    document.getElementById('heroTagline').textContent = hero.tagline;
    document.getElementById('heroImage').src = hero.image;
    document.getElementById('academicCvLink').href = hero.academicCvUrl;
    document.getElementById('tabularCvLink').href = hero.tabularCvUrl;

    // CV Dropdown toggle
    const cvDropdown = document.getElementById('cvDropdown');
    const cvToggle = document.getElementById('cvDropdownToggle');
    cvToggle.addEventListener('click', (e) => {
      e.stopPropagation();
      cvDropdown.classList.toggle('open');
    });
    document.addEventListener('click', (e) => {
      if (!cvDropdown.contains(e.target)) {
        cvDropdown.classList.remove('open');
      }
    });

    const socialsHTML = hero.socials.map(social => `
      <a href="${social.url}" target="_blank" rel="noopener" class="social-link" title="${social.platform}">
        <i class="fab ${social.icon}"></i>
      </a>
    `).join('');
    document.getElementById('heroSocials').innerHTML = socialsHTML;
  }

  renderIntroduction() {
    const intro = portfolioData.introduction;
    document.getElementById('introTitle').textContent = intro.title;
    
    const paragraphsHTML = intro.paragraphs.map(p => `<p>${p}</p>`).join('');
    document.getElementById('introContent').innerHTML = paragraphsHTML;
  }

  renderExpertise() {
    const expertiseHTML = portfolioData.expertiseAreas.map((item, index) => `
      <div class="expertise-card" onclick="portfolio.openExpertiseModal(${index})">
        <div class="expertise-icon" style="background: ${item.color}">
          <i class="fas ${item.icon}"></i>
        </div>
        <h3 class="expertise-title">${item.label}</h3>
      </div>
    `).join('');
    document.getElementById('expertiseList').innerHTML = expertiseHTML;
  }

  openExpertiseModal(index) {
    const item = portfolioData.expertiseAreas[index];
    const modal = document.getElementById('expertiseModal');
    
    document.getElementById('expertiseModalIcon').innerHTML = `<i class="fas ${item.icon}"></i>`;
    document.getElementById('expertiseModalIcon').style.background = item.color;
    document.getElementById('expertiseModalTitle').textContent = item.label;
    document.getElementById('expertiseModalDescription').textContent = item.description;
    
    modal.style.display = 'flex';
    document.body.style.overflow = 'hidden';
  }

  renderAbout() {
    document.getElementById('aboutText').textContent = portfolioData.about;
  }

  renderExperience() {
    const experienceHTML = portfolioData.experience.map(exp => `
      <div class="experience-card">
        <div class="exp-header">
          <div>
            <h3 class="exp-role">${exp.role}</h3>
            <p class="exp-org">
              ${exp.organizationLink ? `<a href="${exp.organizationLink}" target="_blank" rel="noopener">${exp.organization}</a>` : exp.organization}
            </p>
            ${exp.supervisor ? `<p class="exp-supervisor">Supervisor: ${exp.professorLink ? `<a href="${exp.professorLink}" target="_blank" rel="noopener">${exp.supervisor}</a>` : exp.supervisor}</p>` : ''}
          </div>
          <div class="exp-meta">
            <span class="exp-period">${exp.period}</span>
            <span class="exp-location">${exp.location}</span>
          </div>
        </div>
        <ul class="exp-highlights">
          ${exp.highlights.map(h => `<li>${h}</li>`).join('')}
        </ul>
      </div>
    `).join('');
    document.getElementById('experienceList').innerHTML = experienceHTML;
  }

  renderEducation() {
    const edu = portfolioData.education;
    const educationHTML = `
      <div class="education-card">
        <h3 class="edu-degree">${edu.degree}</h3>
        <p class="edu-institution">
          ${edu.institutionUrl ? `<a href="${edu.institutionUrl}" target="_blank" rel="noopener">${edu.institution}</a>` : edu.institution}
        </p>
        <p class="edu-duration">${edu.duration}</p>
        <p class="edu-description">${edu.description}</p>
      </div>
    `;
    document.getElementById('educationList').innerHTML = educationHTML;
  }

  renderSkills() {
    const skillsHTML = Object.entries(portfolioData.skills).map(([category, skills]) => `
      <div class="skill-category">
        <h3 class="skill-category-title">${category}</h3>
        <div class="skill-list">
          ${skills.map(skill => `
            <div class="skill-item">
              <div class="skill-header">
                <span class="skill-label">${skill.label}</span>
                <span class="skill-percent">${Math.round(skill.level * 100)}%</span>
              </div>
              <div class="skill-bar">
                <div class="skill-progress" style="width: ${skill.level * 100}%"></div>
              </div>
            </div>
          `).join('')}
        </div>
      </div>
    `).join('');
    document.getElementById('skillsList').innerHTML = skillsHTML;
  }

  renderProjects() {
    const projectsHTML = portfolioData.projects.map((project, index) => `
      <div class="project-card" onclick="portfolio.openProjectModal(${index})">
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

  openProjectModal(index) {
    const project = portfolioData.projects[index];
    this.currentProjectIndex = index;
    this.currentImageIndex = 0;

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
    this.renderProjectImages(project);

    modal.style.display = 'flex';
    document.body.style.overflow = 'hidden';
  }

  renderProjectImages(project) {
    const images = project.images || [project.imageUrl];
    const container = document.getElementById('modalImageContainer');

    if (images.length === 1) {
      container.innerHTML = `<img src="${images[0]}" alt="${project.title}" class="modal-single-image">`;
    } else {
      const imageHTML = `
        <div class="modal-carousel">
          <button class="carousel-btn carousel-prev" onclick="portfolio.prevImage()">
            <i class="fas fa-chevron-left"></i>
          </button>
          <img src="${images[this.currentImageIndex]}" alt="${project.title}" class="modal-carousel-image" id="carouselImage">
          <button class="carousel-btn carousel-next" onclick="portfolio.nextImage()">
            <i class="fas fa-chevron-right"></i>
          </button>
          <div class="carousel-indicator">${this.currentImageIndex + 1} / ${images.length}</div>
        </div>
      `;
      container.innerHTML = imageHTML;
    }
  }

  prevImage() {
    const project = portfolioData.projects[this.currentProjectIndex];
    const images = project.images || [project.imageUrl];
    this.currentImageIndex = (this.currentImageIndex - 1 + images.length) % images.length;
    document.getElementById('carouselImage').src = images[this.currentImageIndex];
    document.querySelector('.carousel-indicator').textContent = `${this.currentImageIndex + 1} / ${images.length}`;
  }

  nextImage() {
    const project = portfolioData.projects[this.currentProjectIndex];
    const images = project.images || [project.imageUrl];
    this.currentImageIndex = (this.currentImageIndex + 1) % images.length;
    document.getElementById('carouselImage').src = images[this.currentImageIndex];
    document.querySelector('.carousel-indicator').textContent = `${this.currentImageIndex + 1} / ${images.length}`;
  }

  closeModal(modalId) {
    document.getElementById(modalId).style.display = 'none';
    document.body.style.overflow = '';
  }

  renderPublications() {
    const peerReviewedHTML = portfolioData.publications.peerReviewed.map(pub => `
      <div class="publication-card">
        <h4 class="pub-title">
          <a href="${pub.link}" target="_blank" rel="noopener">${pub.title}</a>
        </h4>
        <p class="pub-authors">${pub.authors}</p>
        <p class="pub-venue">${pub.venue} (${pub.year})</p>
        ${pub.status ? `<span class="pub-status">${pub.status}</span>` : ''}
        <p class="pub-summary">${pub.summary}</p>
      </div>
    `).join('');

    const additionalHTML = portfolioData.publications.additional.map(pub => `
      <div class="publication-card">
        <h4 class="pub-title">
          <a href="${pub.link}" target="_blank" rel="noopener">${pub.title}</a>
        </h4>
        <p class="pub-authors">${pub.authors}</p>
        <p class="pub-venue">${pub.venue} (${pub.year})</p>
        <p class="pub-summary">${pub.summary}</p>
      </div>
    `).join('');

    document.getElementById('publicationsList').innerHTML = `
      <div class="pub-section">
        <h3 class="pub-section-title">Peer-Reviewed Publications</h3>
        ${peerReviewedHTML}
      </div>
      <div class="pub-section">
        <h3 class="pub-section-title">Additional Publications</h3>
        ${additionalHTML}
      </div>
    `;
  }

  renderLeadership() {
    const leadershipHTML = portfolioData.leadership.map(item => `
      <div class="leadership-card">
        <h3 class="leadership-title">
          ${item.titleUrl ? `<a href="${item.titleUrl}" target="_blank" rel="noopener">${item.title}</a>` : item.title}
        </h3>
        <p class="leadership-period">${item.period}</p>
        <ul class="leadership-highlights">
          ${item.highlights.map(h => `<li>${h}</li>`).join('')}
        </ul>
      </div>
    `).join('');
    document.getElementById('leadershipList').innerHTML = leadershipHTML;
  }

  renderAwards() {
    const awardsHTML = portfolioData.awards.map((award, index) => `
      <div class="award-card" onclick="portfolio.openAwardModal(${index})">
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

  openAwardModal(index) {
    const award = portfolioData.awards[index];
    const modal = document.getElementById('awardModal');

    document.getElementById('awardModalTitle').textContent = award.title;
    document.getElementById('awardModalIssuer').textContent = award.issuer;
    document.getElementById('awardModalDate').textContent = award.date;
    document.getElementById('awardModalImage').src = award.fullImageUrl;
    document.getElementById('awardModalHighlights').textContent = award.highlights;

    const tagsHTML = award.tags.map(tag => `<span class="award-tag">${tag}</span>`).join('');
    document.getElementById('awardModalTags').innerHTML = tagsHTML;

    modal.style.display = 'flex';
    document.body.style.overflow = 'hidden';
  }

  renderContact() {
    const contact = portfolioData.contact;
    document.getElementById('contactEmail').textContent = contact.email;
    document.getElementById('contactEmail').href = `mailto:${contact.email}`;
    document.getElementById('contactPhone').textContent = contact.phone;
    document.getElementById('contactPhone').href = `tel:${contact.phone}`;
    document.getElementById('contactLocation').textContent = contact.location;

    // Additional contact methods
    const additionalHTML = `
      <p><strong>WhatsApp:</strong> <a href="https://wa.me/${contact.whatsapp.replace(/\+/g, '')}" target="_blank">${contact.whatsapp}</a></p>
      <p><strong>WeChat:</strong> ${contact.wechat}</p>
      <p><strong>LinkedIn:</strong> <a href="${contact.linkedin}" target="_blank" rel="noopener">View Profile</a></p>
    `;
    document.getElementById('contactAdditional').innerHTML = additionalHTML;
  }

  setupSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
      anchor.addEventListener('click', function (e) {
        e.preventDefault();
        const target = document.querySelector(this.getAttribute('href'));
        if (target) {
          target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
      });
    });
  }

  setupNavigation() {
    const nav = document.querySelector('.nav');
    let lastScroll = 0;

    window.addEventListener('scroll', () => {
      const currentScroll = window.pageYOffset;
      
      if (currentScroll > 100) {
        nav.classList.add('scrolled');
      } else {
        nav.classList.remove('scrolled');
      }

      lastScroll = currentScroll;
    });

    // Mobile menu toggle (if needed)
    const mobileMenuBtn = document.getElementById('mobileMenuBtn');
    const navLinks = document.querySelector('.nav-links');
    
    if (mobileMenuBtn) {
      mobileMenuBtn.addEventListener('click', () => {
        navLinks.classList.toggle('active');
      });

      // Close drawer when clicking a link
      const navLinkItems = navLinks.querySelectorAll('a');
      navLinkItems.forEach(link => {
        link.addEventListener('click', () => {
          navLinks.classList.remove('active');
        });
      });

      // Close drawer when clicking outside
      document.addEventListener('click', (e) => {
        if (navLinks.classList.contains('active') && 
            !navLinks.contains(e.target) && 
            !mobileMenuBtn.contains(e.target)) {
          navLinks.classList.remove('active');
        }
      });
    }
  }
}

// Initialize portfolio when DOM is loaded
let portfolio;
document.addEventListener('DOMContentLoaded', () => {
  portfolio = new Portfolio();
});

// Close modals when clicking outside
window.onclick = function(event) {
  if (event.target.classList.contains('modal')) {
    portfolio.closeModal(event.target.id);
  }
};
