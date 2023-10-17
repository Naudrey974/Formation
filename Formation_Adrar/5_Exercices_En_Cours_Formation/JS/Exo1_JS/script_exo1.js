/*
function changeNB(a,b){
    let nb1=a;
    let nb2=b;
    let nb3=nb1; 
    nb1=nb2;
    nb2=nb3;
    return array=[nb1,nb2];

}
console.log(changeNB(5,10));
*/
/*
let nb=7;
if(nb<0){
    console.log("negatif");
}else{
    console.log("positif");
}


    let nb1=-3;
    let nb2=-5;
    if(nb1+nb2<0){
        console.log("negatif");
    }else{
        console.log("positif");
    }
*/

/*function plusMoins(){

let nbr1= parseInt(prompt("Saisir le nombre1"));
let nbr2=parseInt(prompt("Saisir le nombre2"));

if(nbr1==0 || nbr2==0){
    console.log("négatif");
}else if(nbr1<0 && nbr2<0){
    console.log("positif")
}else if(nbr1<0 || nbr2<0){
    console.log("négatif")
}else if(nbr1>0 && nbr2>0){
    console.log("positif")
}
}
plusMoins();
*/
/*
let age=prompt("Sasir âge");
if(age>=6 && age<=7){
    console.log("poussin");
}else if(age>=8 && age<=9){
    console.log("pupille");
}else if(age>=10 && age<=11){
    console.log(minime);
}else if(age>=12){
    console.log("cadet");
}
*/
/* version avec SWITCH

switch(true){
    case age>=6 && age<=7:
        console.log("poussin");
        break;
    case age>=8 && age<=9:
        console.log("pupille");
        break;
    case age>=10 && age<=11:
        console.log("minime");
        break;
    case age>=12:
        console.log("cadet");
}
*/


function trie(){
    let mot1=prompt("saisir mot1");
    let mot2=prompt("saisir mot2");
    let mot3=prompt("saisir mot3");
    
    if(mot1<=mot2 && mot2<=mot3){
        console.log(`les mots triés sont:${mot1} ${mot2} ${mot3}`)
        //console.log("Les mots sont triés")
    }else{
        console.log("Les mots ne sont pas triés")
    }
}
trie();
