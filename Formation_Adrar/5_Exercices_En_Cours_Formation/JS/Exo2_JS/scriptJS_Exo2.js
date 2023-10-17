/*let nb1=prompt("saisir nombre 1");
let nb2=prompt("saisir nombre 2");
let nb3=prompt("saisir nombre 3");

let tableau=[];
tableau[0]=nb1;
tableau[1]=nb2;
tableau[2]=nb3;

// console.log(tableau)

if([0]<[1] && [1]<[2]){
    console.log("Les valeurs sont triées dans l\'ordre croissant")
}else{
    console.log("Les valeurs ne sont pas triées dans l/'ordre croissant")
}
*/

/*let nom=prompt("saisir nom produit");
let prix=parseFloat(prompt("saisir un prix HT"));
let qte=parseInt(prompt("saisir une quantité"));

let tableau=[];
tableau[0]=nom;
tableau[1]=prix;
tableau[2]=qte;

let total

total=(prix*1.20)*qte
tableau.push(total);
console.log(tableau)

console.log(`le prix ttc est :${Math.round(tableau[3])}€`); //Math.round : pour faire un arrondie
*/

let users=[];
    for(let i=0;i<2; i++){
        let user = {
            'nom': prompt("Saisir un nom"),
            'prenom': prompt("Saisir un prénom"),
            'age': parseInt(prompt("Saisir un âge")),
            'tel': parseInt(prompt("Saisir un numéro de téléphone"))
        }
        users.push(user)
        
    }
    
    let young=users[0].age
    let indice=0
    for(let i=0; i<users.length; i++){
    if(users[i].age<users[i++].age){
        young=users[i].age;
        indice=i;
    }
    console.log(users[indice].nom+ +users[indice].prenom)
    }
