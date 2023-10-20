
/* let nbrChoco = parseInt(prompt("Saisir le nombre de chocolatine"));
let total = 0;
let prixChoco = [1.4, 1.3, 1.20];
if(nbrChoco > 0 && nbrChoco <= 10){
    total = nbrChoco * prixChoco[0];
}
else if(nbrChoco >= 11 && nbrChoco <= 20){
    total = (10*prixChoco[0])+((nbrChoco-10)*prixChoco[1]);
}
else{
    total = (10*prixChoco[0])+(10*prixChoco[1])+((nbrChoco-20)*prixChoco[2]);
}
console.log("Le prix total est égal à : "+total);
alert("Le prix total est égal à : "+total); */


const totaldef=document.querySelector('#resultat');
function calculer(){
    let total = 0;
let prixChoco = [1.4, 1.3, 1.20];
const quantite=document.querySelector('#quantite');

    if(quantite.value > 0 && quantite.value <= 10){
        total = quantite.value * prixChoco[0];
    }
    else if(quantite.value >= 11 && quantite.value <= 20){
        total = (10*prixChoco[0])+((quantite.value-10)*prixChoco[1]);
    }
    else{
        total = (10*prixChoco[0])+(10*prixChoco[1])+((quantite.value-20)*prixChoco[2]);
    }
}

totaldef.textContent=total;