/* Exercice 8 Tableau :
Créer un programme qui va demander 3 valeurs :
-nom de produit (string),
-prix HT (float),
-quantité (integer),

Calculer le prix TTC (prix HT X 1.20 X quantité) et stocker le prix TTC .
Afficher le Prix TTC 
*/


function calculer(){
const nom=document.querySelector('#nomPDT');
const prixHT= parseFloat(document.querySelector('#prixHT').value);
const quantite = parseInt(document.querySelector('#quantite').value);
console.log(prixHT)
console.log(quantite)

const resultat=document.querySelector('#resultat')
let total=0;
if(quantite ==""){
    total = "Veuillez renseigner le nombre";
}
if(isNaN(quantite)){
    total = "Veuillez saisir une valeur numérique";
}
if(quantite == 0 || quantite < 0){
    total = "Veuillez saisir une valeur supérieure à 0";
}
if(!isNaN(quantite) && quantite !=0 && quantite > 0 && nom!=""){
total=(prixHT*1.20)*quantite;
}
resultat.textContent=(total).toFixed(2); //.toFixed(2) fixe la valeur à 2 unité après la virgule, doit être utiliser après l'entrée de la valeur.
}
