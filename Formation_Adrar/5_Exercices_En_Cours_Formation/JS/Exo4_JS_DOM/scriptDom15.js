const user={
    'id' : 1,
    'nom': 'Simon',
    'prenom': 'Audrey',
    'age': 38,
    'image' :'./logo.jpg'
}
const div=document.querySelector('div');
div.setAttribute('id',user.id);


const text1=document.querySelector('#p1');
const text2=document.querySelector('#p2');
const text3=document.querySelector('#p3');
const image=document.querySelector("img");

text1.setAttribute('p',user.nom);
text2.setAttribute('p',user.prenom);
text3.setAttribute('p',user.age);
image=setAttribute('src',user.img);
