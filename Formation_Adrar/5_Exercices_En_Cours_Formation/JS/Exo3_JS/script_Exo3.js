/*exo 10 boucle

let tab=[];
let total=0
    for(let i=0;i<3; i++){
        let student = {
            'nom': prompt("Saisir un nom d'élève"),
            'note': parseInt(prompt("Saisir une note")),  
        }
        tab.push(student)  
        total+=tab[i].note;    
    }

    let moyenne = total/tab.length
    console.log(Math.round(moyenne));
*/
/*---------------------
//exo 11 condition
 
let prix1= 1.40;
let prix2= 1.30;
let prix3= 1.20;
let qte= prompt("Saisir une quantité");
let total=0;

if(qte>0 && qte<=10){
    total=qte*prix1;
}else if(qte>10 && qte<=20){
    total=((qte-10)*prix2)+10*prix1;
}else{
    total=((qte-20)*prix3)+ 10*prix1 + 10*prix2
}
console.log(total)
*/
//-----------------------
//Exo 12 boucle
/* let nb=parseInt(prompt("Définir un nombre à trouver"));
let nbTour=10;
let tentative=0;

for(let i=0; i<10;i++){
    tentative=prompt("Taper un nombre"); 

    if(tentative>nb){
        alert("c'est plus petit!")
    }else if(tentative==nb){
        alert("Ton entrainement a payé! Tu l'as trouvé en: "+i+" coups!" );
        i = 10;
    }else{
        alert("C'est plus grand!")
    }

if(tentative!=nb || i>nbTour){
    alert("Tu es un mauvais mentaliste")
}
} */
//------------------------------
//Exo 13 Boucles

let lanceBanq=0;
let lanceJoueur=0;
let scoreBanq=0;
let scoreJoueur=0;
let tour=0;
while(tour<5){
    lanceBanq=Math.floor(Math.random() *6 )+1;
    alert("La banque fait: "+lanceBanq+"")
    lanceJoueur=Math.floor(Math.random() *6 ) +1;
    alert("Vous avez fait: "+lanceJoueur+"")
    if(lanceJoueur>lanceBanq){
        scoreJoueur++;
    }if(lanceJoueur==lanceBanq){
        scoreJoueur+=2;
    }if(lanceJoueur<lanceBanq){
        scoreBanq++
    }
    tour++
}
if(scoreJoueur>scoreBanq){
    alert("Vous avez gagné avec : "+scoreJoueur+" point")
}else{
    alert("La banque gagne avec un score de: "+scoreBanq+" point")
}
 
