// Écrire une fonction qui prend un tableau en entrée et affiche le dernier élément de ce tableau.

function lastCase(tab){
    let numero=tab.length -1;
    console.log(tab[numero]);  
    }

        lastCase([12,4,88,74,9]);
        

// Écrire une fonction qui prend un tableau en entrée et retourne le dernier élément de ce tableau.
function lastCase1(tab){
    let numero=tab.length -1;
    return tab[numero];  
    }
console.log(lastCase1([2,67,88]))
// Écrire une fonction qui prend en entrée un tableau et qui retourne le minimum de ce tableau.


function fMin(tab){
    
    let caseMin=tab[0];
    for(let i=0;i<tab.length;i++){
        
        if (tab[i]>=caseMin){
            
        }else{
            caseMin=tab[i];
        
        }
    }
    return caseMin;
}
console.log(fMin([7,88,10,3,46,2]));

// Écrire une fonction qui prend en entrée un tableau et qui retourne le maximum de ce tableau.
function fMax(tab){
    
    let caseMax=tab[0];
    for(let i=0;i<tab.length;i++){       
        if (tab[i]>=caseMax){            
        
            caseMax=tab[i];
        }
    }
    return caseMax;
}
console.log(fMax([7,88,1,3,31]));

// [Plus difficile - bonus] Écrire une fonction qui prend en entrée un tableau de nombres positifs et qui retourne la deuxième plus grande valeur du tableau.

/*function fMax2(tab){
    
    let caseMax=tab[0];
    let caseMax2=tab[0];

    for(let i=0;i<tab.length;i++){       
        if (tab[i]>=caseMax){            
            caseMax=tab[i];
        }
        for(let j=0;j<tab.length;j++){ 
            if ((tab[j]>=caseMax2) && (tab[j]<caseMax)){            
                    caseMax2=tab[j];
                }               
            }        
    }
    return caseMax2;
}
console.log(fMax2([7,88,1,3,31]));
*/

//Méthode plus courte et mieux
function fMax2(tab){
    
    let caseMax=tab[0];
    let caseMax2=tab[0];

    for(let i=0;i<tab.length;i++){       
        if (tab[i]>caseMax){            
            caseMax2=caseMax;
            caseMax=tab[i];
        }else if(tab[i]>caseMax2){
                caseMax2=tab[i];
            }
        }       
    
    return caseMax2;
}
console.log(fMax2([7,88,1,3,31]));

// Écrire une fonction qui prend en entrée un tableau et un nombre et qui retourne le nombre de fois que ce nombre apparaît dans le tableau.

let tab=[12,4,4,65,4];

function countNb(tab,numb){
   
    let repeatNb=0;
    for(let i=0;i<tab.length;i++){
        if (tab[i]==numb){
            repeatNb++;
        }
    }
    return repeatNb;
}
console.log(countNb([12,4,4,65,4],4));

// Écrire une fonction qui prend en entrée un tableau et un nombre et qui retourne true si le nombre existe dans le tableau, false sinon.

// [Bonus] Suite de l'exo : on **sait** que le tableau reçu est trié (on ne le vérifie pas). Comment exploiter cette information pour améliorer la recherche d'un élément ?

// Créer un tableau qui contient [1,2,3,...,7777].

// Créer un tableau qui contient [10,20,30,...,77770].

// En se servant du tableau précédent, créer un tableau qui contient [5,10,15,...,38885].

// Écrire une fonction qui prend un tableau en entrée et qui en supprime les dernières valeurs, tant qu'elles sont inférieures à 50.
// console.log(leNomDeVotreFonction([1,45,88,54,23,-100,12])); // doit afficher [1,45,88,54]