const menu = document.querySelector('#mobile-menu');
// references the lines 23-43 in GoTDB.html
const menuLinks = document.querySelector('.navbar__menu');

menu.addEventListener('click', function()
{
    menu.classList.toggle('is-active');
    menuLinks.classList.toggle('active');
} )
