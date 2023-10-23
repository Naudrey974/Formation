
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



function calculer(){
    //récupération de la valeur
    const quantite = parseInt(document.querySelector('#quantite').value);
    //récuparion de l'attribut resultat
    let resultat = document.querySelector('#resultat');
    //prix total
    let total = 0;
    const msg = "Le prix total est égal à : ";
    //prix des chocolatines
    let prixChoco = [1.4, 1.3, 1.20];
    //test si quantité est vide
    if(quantite ==""){
        total = "Veuillez renseigner le nombre de chocolatine";
    }
    //test si quantité n'est pas un nombre
    if(isNaN(quantite)){
        total = "Veuillez saisir une valeur numérique";
    }
    //test si quantité est égal à 0 ou inférieure
    if(quantite == 0 || quantite < 0){
        total = "Veuillez saisir une valeur supérieure à 0";
    }
    //test si quantité est un nombre
    if(!isNaN(quantite) && quantite !=0 && quantite > 0){
        //tester le prix pour la quantité comprise entre 1 et 10
        if(quantite > 0 && quantite <= 10){
            total = msg+quantite * prixChoco[0]+" €";
        }
        //tester le prix pour une quantité comprise entre 1 et 20
        else if (quantite >= 11 && quantite <= 20){
            total = msg+(10*prixChoco[0])+( quantite-10)*prixChoco[1]+" €";
        }
        //tester le prix pour une quantité supérieure 
        else{
            total = msg+(10*prixChoco[0])+(10*prixChoco[1])+(quantite-20)*prixChoco[2]+" €";
        }
    }
    //afficher le résultat
    resultat.textContent = total;
}