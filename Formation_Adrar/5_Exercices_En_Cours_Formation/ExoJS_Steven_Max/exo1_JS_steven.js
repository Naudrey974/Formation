// Créer une fonction qui prend en entrée un nombre qui s'ajoute lui même 10 fois. A la 5 ème fois où il s'ajoute divise le résultat final par le résultat du 5ème ajout. Afficher le résultat après division dans la console. Nombre de départ 567.

/* function exo1(){
let result= n;
for (let i=1; i<=10;i++){
    result+=n;
    if(i==5){
        result/=n;
    }
}
    console.log(result);
}  

exo1(567); */

function additionnerEtDiviser(n) {
    let resultat = n;
    for (let i = 1; i <= 10; i++) {
    resultat += n;
    if (i === 5) {
    resultat /= n;
    }
    }
    console.log(resultat);
    }
    
    additionnerEtDiviser(567);
//let result=total/midlle;
//console.log(result);


/* for (let i = 0; i <= 10; i++) {
    
      for (let j = 0; j <= 10; j++) {
    
        console.log(i, '*', j, '=', i * j)
    
      }
    
    } */