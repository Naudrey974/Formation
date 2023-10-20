
//-----------------------
//Exo 12 boucle
let nb=parseInt(prompt("Définir un nombre à trouver"));
/* let nb=parseInt(prompt("Définir un nombre à trouver"));
let nbTour=10;
let valide=true;
let tentative=0;
for(let i=0; i<10;i++){
    tentative=prompt("Taper un nombre"); 
    if(tentative>nb){
    alert("plus petit")
        alert("c'est plus petit!")
    }else if(tentative==nb){
        console.log("Ton entrainement a payé");
        alert("Ton entrainement a payé! Tu l'as trouvé en: "+i+" coups!" );
        i = 10;
    }else{
    alert("plus grand")
        alert("C'est plus grand!")
    }
if(tentative!=nb || i>nbTour){
    alert("Tu es un mauvais mentaliste")
}

} */
//------------------------------
//Exo 13 Boucles

if(tentative!=nb || tentative>nbTour){
    console.log("Tu es un mauvais mentaliste")
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
}
if(scoreJoueur>scoreBanq){
    alert("Vous avez gagné avec : "+scoreJoueur+" point")
}else{


    alert("La banque gagne avec un score de: "+scoreBanq+" point")
}
