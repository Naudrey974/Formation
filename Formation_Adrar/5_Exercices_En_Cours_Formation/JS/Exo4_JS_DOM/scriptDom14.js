//Exo 14 DOM

const titre=document.querySelector('h1');
console.log (titre)
const div=document.querySelector('div');
const text=document.querySelector('p');
titre.style.fontSize='14px';
div.style.fontFamily='arial';
text.style.color='green';
div.style.marginTop='30px';
titre.textContent="Nouveau titre";
text.textContent="On a modifier le contenu du paragraphe aussi!"



