// Main Application Controller
class PortfolioApp {
  constructor() {
    this.init();
  }

  init() {
    console.log('Initializing portfolio...');
    console.log('Portfolio data:', portfolioData);
    
    // Render all sections
    renderHero();
    renderIntroduction();
    renderExpertise();
    renderEducation();
    renderExperience();
    renderPublications();
    renderProjects();
    renderSkills();
    renderLeadership();
    renderAwards();
    renderContact();
    
    // Setup interactions
    this.setupSmoothScroll();
    this.setupNavigation();
    this.setupScrollToTop();

    // Handle URL hash deep-linking after content is rendered
    this.handleInitialHash();
    // Update URL hash as user scrolls
    this.setupHashTracking();
    
    // Reveal page (FOUC prevention)
    document.body.classList.add('loaded');
    
    console.log('Portfolio initialized successfully!');
  }

  handleInitialHash() {
    const hash = window.location.hash;
    if (hash) {
      // Small delay to let the DOM settle after rendering
      setTimeout(() => {
        const target = document.querySelector(hash);
        if (target) {
          target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
      }, 100);
    }
    // Also listen for hash changes (e.g., user edits URL or shares link)
    window.addEventListener('hashchange', () => {
      const newHash = window.location.hash;
      if (newHash) {
        const target = document.querySelector(newHash);
        if (target) {
          target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
      }
    });
  }

  setupHashTracking() {
    const sections = document.querySelectorAll('section[id]');
    const navLinks = document.querySelectorAll('.nav-links a[href^="#"]');
    let ticking = false;
    window.addEventListener('scroll', () => {
      if (!ticking) {
        requestAnimationFrame(() => {
          let current = '';
          const viewportPoint = window.pageYOffset + window.innerHeight * 0.35;
          const atBottom = (window.innerHeight + window.pageYOffset) >= document.body.scrollHeight - 50;
          if (atBottom) {
            // At page bottom — always highlight the last section
            current = sections[sections.length - 1].getAttribute('id');
          } else {
            sections.forEach(section => {
              const top = section.offsetTop;
              const bottom = top + section.offsetHeight;
              if (viewportPoint >= top && viewportPoint < bottom) {
                current = section.getAttribute('id');
              }
            });
          }
          if (current && window.location.hash !== '#' + current) {
            history.replaceState(null, null, '#' + current);
          }
          // Highlight active nav link
          navLinks.forEach(link => {
            link.classList.remove('active');
            if (link.getAttribute('href') === '#' + current) {
              link.classList.add('active');
            }
          });
          ticking = false;
        });
        ticking = true;
      }
    });
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
    }
  }

  setupScrollToTop() {
    const scrollTopBtn = document.getElementById('scrollToTop');
    
    // Show/hide button based on scroll position
    window.addEventListener('scroll', () => {
      if (window.pageYOffset > 300) {
        scrollTopBtn.classList.add('visible');
      } else {
        scrollTopBtn.classList.remove('visible');
      }
    });
    
    // Scroll to top on click
    scrollTopBtn.addEventListener('click', () => {
      window.scrollTo({
        top: 0,
        behavior: 'smooth'
      });
    });
  }

  closeModal(modalId) {
    document.getElementById(modalId).style.display = 'none';
    document.body.style.overflow = '';
  }
}

// Global function to close modals
function closeModal(modalId) {
  document.getElementById(modalId).style.display = 'none';
  document.body.style.overflow = '';
}

// Initialize app when DOM is loaded
let app;
document.addEventListener('DOMContentLoaded', () => {
  app = new PortfolioApp();
});

// Close modals when clicking outside
window.onclick = function(event) {
  if (event.target.classList.contains('modal')) {
    closeModal(event.target.id);
  }
};
