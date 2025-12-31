// Scroll-Triggered Content Reveal Animation System
class ScrollAnimations {
  constructor() {
    this.observerOptions = {
      root: null,
      rootMargin: '0px',
      threshold: 0.1 // Trigger when 10% of the element is visible
    };
    
    this.lastScrollY = window.scrollY;
    this.isScrollingDown = true;
    
    this.init();
  }

  init() {
    // Track scroll direction
    window.addEventListener('scroll', () => {
      const currentScrollY = window.scrollY;
      this.isScrollingDown = currentScrollY > this.lastScrollY;
      this.lastScrollY = currentScrollY;
    }, { passive: true });
    
    // Wait for DOM to be ready
    if (document.readyState === 'loading') {
      document.addEventListener('DOMContentLoaded', () => this.setupObserver());
    } else {
      this.setupObserver();
    }
  }

  setupObserver() {
    // Create Intersection Observer
    const observer = new IntersectionObserver((entries) => {
      entries.forEach(entry => {
        if (entry.isIntersecting) {
          // If scrolling down, animate; if scrolling up or jumping, show immediately
          if (this.isScrollingDown) {
            entry.target.classList.add('visible');
          } else {
            // Scrolling up - reveal immediately without waiting
            entry.target.classList.add('visible', 'instant-reveal');
          }
          
          // Stop observing after reveal
          observer.unobserve(entry.target);
        }
      });
    }, this.observerOptions);

    // Observe all elements with animation classes
    this.observeElements(observer);
    
    // Show elements already in viewport (for page load and navigation jumps)
    this.revealVisibleElements();
    
    // Re-observe when new content is added (for dynamic content)
    this.setupMutationObserver(observer);
    
    // Handle hash navigation (clicking nav links)
    window.addEventListener('hashchange', () => {
      setTimeout(() => this.revealVisibleElements(), 100);
    });
    
    // Continuously check for visible elements when scrolling
    let scrollTimeout;
    window.addEventListener('scroll', () => {
      clearTimeout(scrollTimeout);
      scrollTimeout = setTimeout(() => this.revealVisibleElements(), 50);
    }, { passive: true });
  }

  revealVisibleElements() {
    // Immediately show all elements currently in viewport
    const elements = document.querySelectorAll('.scroll-reveal:not(.visible)');
    elements.forEach(el => {
      const rect = el.getBoundingClientRect();
      const isVisible = rect.top < window.innerHeight && rect.bottom > 0;
      if (isVisible) {
        el.classList.add('visible');
      }
    });
  }

  observeElements(observer) {
    // Select all elements that should be animated on scroll
    const selectors = [
      '.section-title',
      '.expertise-card',
      '.intro-content p',
      '.experience-card',
      '.education-card',
      '.project-card',
      '.skill-badge',
      '.leadership-card',
      '.award-card',
      '.publication-item',
      '.contact-button',
      '.cta-btn'
    ];

    selectors.forEach(selector => {
      const elements = document.querySelectorAll(selector);
      elements.forEach(el => {
        // Add initial hidden state
        el.classList.add('scroll-reveal');
        // Observe the element
        observer.observe(el);
      });
    });
  }

  setupMutationObserver(intersectionObserver) {
    // Watch for newly added elements
    const mutationObserver = new MutationObserver((mutations) => {
      mutations.forEach(mutation => {
        mutation.addedNodes.forEach(node => {
          if (node.nodeType === 1) { // Element node
            // Check if the node itself matches
            const selectors = [
              '.expertise-card',
              '.experience-card',
              '.education-card',
              '.project-card',
              '.skill-badge',
              '.leadership-card',
              '.award-card',
              '.publication-item',
              '.contact-button'
            ];

            selectors.forEach(selector => {
              if (node.matches && node.matches(selector)) {
                node.classList.add('scroll-reveal');
                intersectionObserver.observe(node);
              }
              
              // Check child elements
              const children = node.querySelectorAll(selector);
              children.forEach(child => {
                child.classList.add('scroll-reveal');
                intersectionObserver.observe(child);
              });
            });
          }
        });
      });
    });

    // Start observing the document for changes
    mutationObserver.observe(document.body, {
      childList: true,
      subtree: true
    });
  }
}

// Initialize scroll animations
const scrollAnimations = new ScrollAnimations();
