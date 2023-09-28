// Écrire une fonction f1 qui ne prend rien en entrée, et qui affiche 17 dans la console.
function f1(){
    console.log(17);
}
// Utiliser la fonction f1 pour afficher 17 dans la console.
f1();
// Écrire une fonction f2 qui ne prend rien en entrée, et qui retourne 18.
function f2(){
    
    return 18;

}
// Utiliser la fonction f2 pour afficher 18 dans la console.
console.log(f2());

// La fonction f2 a l'air moins pratique à utiliser. Quel intérêt pourrait-elle avoir par rapport à f1 ?
//Elle permet d'utiliser directement le résultat de f2 pour une autre opération, elle donne plus de liberté. 
//Alors que f1 est spécialisé que pour faire de l'affichage, on ne peut pas réutiliser le résultat.


// Écrire une fonction f3 qui prend un nombre en entrée et qui affiche dans la console le double de ce nombre.
function f3(double){
    let a=double*2;
    console.log(a);
    //pour alléger le code : console.log(double*2);
}
// Utiliser la fonction f3 pour écrire dans la console le double de 98.
f3(98);
// Écrire une fonction f4 qui prend un nombre en entrée et qui retourne le double de ce nombre.
function f4(doubleBis){
    let a=doubleBis*2;
    return a;
    //pour alléger: return doubleBis*2;
}
// Utiliser la fonction f4 pour écrire dans la console le double de 99.
console.log(f4(99));
// Utiliser la fonction f4 pour stocker dans une variable appelée f le double de 99.
let a=f4(99);
console.log("La variable a contient:",a);

// Écrire une fonction f5 qui prend en entrée deux nombres et qui affiche dans la console la somme de ces deux nombres.
function f5(nb1, nb2){
    let a=nb1+nb2;
    console.log (a);
}
// Utiliser la fonction f5 pour écrire dans la console la somme de 41 et 77.
f5(41,77);

// Écrire une fonction f6 qui prend en entrée deux nombres et qui retourne la somme de ces deux nombres.
function f6(nb1, nb2){
    let b=nb1+nb2;
    return b; //pour alléger: return nb1+nb2;
}
// Utiliser la fonction f6 pour écrire dans la console la somme de 42 et 77.
console.log(f6(42,77));

// Utiliser la fonction f6 pour incrémenter la variable a de la somme de 42 et 77.
a+=f6(42,77);
//ou a = f6(a,f6(41,77))

// Écrire une fonction f7 qui prend deux nombres en entrée et qui retourne le plus grand des deux.
function f7(nb1,nb2){
    if(nb1<nb2){
        return nb2;
    }else{
        return nb1;
    }
}
//console.log(f7(2,3));

// Écrire une fonction f8 qui prend trois nombres en entrée et qui retourne le plus grand des trois.
// (Au moins deux versions possibles : sans utiliser f7, et en utilisant f7).
/*
function f8(nb1, nb2,nb3 ){
    if((nb1=>nb2) && (nb1>=nb3)){  //utiliser => permet d'éviter les erreurs si 2 nombres on la même valeur
        return nb1;
    }else if((nb2=> nb1) && (nb2>=nb3)){
        return nb2;
    }else{
        return nb3;
    }
}   
*/

function f8(nb1, nb2, nb3){
    let maxNb1Nb2= f7(nb1, nb2);
    return f7(maxNb1Nb2,nb3);
}

/* ou
function f8(nb1, nb2, nb3){
    retur f7( f7(nb1,nb2),nb3)
}
*/
console.log(f8(8,4,9));

// Écrire une fonction f9 qui prend un nombre et un mot en entrée, et qui affiche dans la console ce mot ce nombre de fois.

function f9(number, name){
for (let i=0; i<number; i++){
    console.log(name);
}
}

f9(5,"audrey");