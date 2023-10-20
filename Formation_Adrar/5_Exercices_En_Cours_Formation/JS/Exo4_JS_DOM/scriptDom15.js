const user = {
    'id' : 1,
    'nom': 'Mithridate',
    'prenom': 'mathieu',
    'age': 44,
    'image' :'./logo.jpg'
}
const section = document.querySelector('div');
section.setAttribute('id', user.id);
const p1 = document.querySelector('p:nth-child(2)');
const p2 = document.querySelector('p:nth-child(3)');
const p3 = document.querySelector('p:nth-child(4)');
// Version node list
//récupérer les attributs dans une nodelist
const liste = document.querySelectorAll('p');
/*liste[0].textContent = user.nom;
liste[1].textContent = user.prenom;
liste[2].textContent = user.age; */
p1.textContent = user.nom;
p2.textContent = user.prenom;
p3.textContent = user.age;
const image = document.querySelector('img');
image.setAttribute('src', user.image);
//version alternative
/* image.src = user.image;
document.querySelector('img').setAttribute('src', user.image);
document.querySelector('img').src = user.image; */
p1.style.fontSize = "11px";
p2.style.fontSize = "11px";
p3.style.fontSize = "11px";
p1.style.color = 'bleu';
p2.style.color = 'bleu';
p3.style.color = 'bleu';
//version boucle for sur la node list
/* for(i = 0; i<liste.length; i++){
    liste[i].style.fontSize = '11px';
    liste[i].style.color = 'blue';
} */
//version forEach node List
/* liste.forEach(toto => {
    toto.style.fontSize = '11px';
    toto.style.color = 'blue';
}); */
image.style.width = '40px';
image.style.height = '40px';
image.style.float = 'right';
image.style.margin = '10px';
section.style.backgroundColor = 'rgb(220, 220, 220)';