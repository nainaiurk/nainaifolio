// Contact Section Renderer
function renderContact() {
  const contact = portfolioData.contact;
  const emailEl = document.getElementById('contactEmail');
  emailEl.href = `mailto:${contact.email}`;
  emailEl.querySelector('.contact-btn-value').textContent = contact.email;

  const phoneEl = document.getElementById('contactPhone');
  phoneEl.href = `tel:${contact.phone}`;
  phoneEl.querySelector('.contact-btn-value').textContent = contact.phone;

  const whatsappEl = document.getElementById('contactWhatsapp');
  whatsappEl.href = `https://wa.me/${contact.whatsapp.replace(/\+/g, '')}`;
  whatsappEl.querySelector('.contact-btn-value').textContent = contact.whatsapp;

  const wechatEl = document.getElementById('contactWechat');
  wechatEl.querySelector('.contact-btn-value').textContent = contact.wechat;

  const linkedinEl = document.getElementById('contactLinkedin');
  linkedinEl.href = contact.linkedin;
  linkedinEl.querySelector('.contact-btn-value').textContent = '/in/nainaiu-rakhaine';
}
