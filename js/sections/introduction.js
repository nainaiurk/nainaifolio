// Introduction Section Renderer
function renderIntroduction() {
  const intro = portfolioData.introduction;
  document.getElementById('introTitle').textContent = intro.title;
  
  const introContent = document.getElementById('introContent');
  const introContainer = document.querySelector('.intro-content-merged');
  const toggleButton = document.getElementById('introToggle');

  if (!introContainer || !toggleButton) return;

  const paragraphs = Array.isArray(intro.paragraphs) ? intro.paragraphs : [];
  const hasMultipleParagraphs = paragraphs.length > 1;

  const truncateToWord = (text, maxChars) => {
    if (typeof text !== 'string') return '';
    const normalized = text.trim();
    if (normalized.length <= maxChars) return normalized;
    const sliced = normalized.slice(0, maxChars);
    return sliced.replace(/\s+\S*$/, '').trimEnd();
  };

  const getCollapsedCharLimit = () => {
    return window.matchMedia('(max-width: 480px)').matches ? 140 : 190;
  };

  const renderIntroParagraphs = (isCollapsed, showToggleInline) => {
    if (!introContent) return;

    introContent.innerHTML = '';

    if (!paragraphs.length) {
      return;
    }

    if (isCollapsed) {
      const p = document.createElement('p');
      const shortText = truncateToWord(paragraphs[0], getCollapsedCharLimit());
      p.appendChild(document.createTextNode(shortText));

      if (showToggleInline) {
        p.appendChild(document.createTextNode('… '));
        p.appendChild(toggleButton);
      }

      introContent.appendChild(p);
      return;
    }

    for (const paragraph of paragraphs) {
      const p = document.createElement('p');
      p.textContent = paragraph;
      introContent.appendChild(p);
    }

    if (showToggleInline) {
      const lastParagraph = introContent.querySelector('p:last-child');
      if (lastParagraph) {
        lastParagraph.appendChild(document.createTextNode(' '));
        lastParagraph.appendChild(toggleButton);
      }
    }
  };

  const applyFoldState = () => {
    const isMobile = window.matchMedia('(max-width: 768px)').matches;

    if (!hasMultipleParagraphs) {
      introContainer.classList.remove('is-collapsed');
      toggleButton.style.display = 'none';
      toggleButton.setAttribute('aria-expanded', 'true');
      renderIntroParagraphs(false, false);
      return;
    }

    if (isMobile) {
      toggleButton.style.display = 'inline';
      if (!toggleButton.dataset.initialized) {
        introContainer.classList.add('is-collapsed');
        toggleButton.dataset.initialized = 'true';
      }
    } else {
      introContainer.classList.remove('is-collapsed');
      toggleButton.style.display = 'none';
      toggleButton.dataset.initialized = '';
    }

    const isCollapsed = introContainer.classList.contains('is-collapsed');
    toggleButton.textContent = isCollapsed ? 'Read more' : 'Read less';
    toggleButton.setAttribute('aria-expanded', String(!isCollapsed));

    renderIntroParagraphs(isMobile ? isCollapsed : false, isMobile);
  };

  toggleButton.onclick = () => {
    introContainer.classList.toggle('is-collapsed');
    applyFoldState();
  };

  applyFoldState();
  window.addEventListener('resize', applyFoldState);
}
