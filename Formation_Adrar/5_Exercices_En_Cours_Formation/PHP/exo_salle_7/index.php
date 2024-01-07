<?php
    $prenom = "Mathieu";
    //concatenation avec des doubles ""
    echo "Le prénom de l'utilisateur $prenom<br>";
    //concatenation avec des doubles "" et opérateur .
    echo "Le prénom de l'utilisateur ".$prenom."<br>";
    //concatenation avec des simple '
    echo 'le prénom de l\'utilisateur est '.$prenom.'<br>';
    //concatener une fonction avec simple et double
    echo 'Le type de la variable $prenom est '.gettype($prenom).'<br>';
    echo "Le type de la variable prenom est ".gettype($prenom)."<br>";
    //tableau associatif
    $tab = ["prenom"=>"Mathieu", "nom"=>"Mithridate"];
    //affichage du contenu d'un tableau
    echo "le nom de l'utilisateur est ".$tab['prenom']."<br>";
    //Afficher un tableau
    echo '<pre>';
    var_dump($tab);
    echo '</pre>';

   // -Créer 1 variable $a qui a pour valeur « bon »,
   //$a = "Bon";
   // -Créer 1 variable $b qui a pour valeur « jour »,
   $b = "jour";
  //  -Créer 1 variable $c qui a pour valeur 10,
  $c =10;
   // -Concaténer $a, $b et $c +1,
   //-Afficher le résultat de la concaténation. 
   echo $a.$b.($c+1);
    
   /*-Créer une variable $a qui a pour valeur bonjour,
   -Afficher un paragraphe (balise html) et à l’intérieur les mots suivants :l’adrar,
   -Ajouter la variable $a avant la phase dans le paragraphe,
   -Cela doit donner :
   <p>bonjour l’Adrar</p> (modifié)*/
   
   //$a = "Bonjour";
   echo "<p>$a l'Adrar</p>";
   echo '<p>'.$a.' l\'Adrar</p>';
   echo "<p>".$a." l'Adrar</p>";

   /*Exercice 4 Concaténation et opérateur :
-Créer une variable prix HT (d’un article),
-Créer une variable (le nombre d’articles),
-Créer une variable  (le taux de TVA), 
-Stocker dans une variable le calul du (total TTC),
-Afficher le prix HT, le nbr d’articles et le taux de TVA (utilisez la fonction echo),
-Afficher le total TTC (utilisez la fonction echo).*/

$prixHT = 2.49;
$quantite = 5;
$tva = 1.2;
$total = $prixHT*$quantite*$tva;
echo "Le total est égal à : $total €<br>";
echo "Le total est égal à :" .$total." €<br>";
echo 'Le total est égal à :' .$total.' €<br>';
echo 'Le total est égal à :' .($prixHT*$quantite*$tva).' €<br>';


/*5-Créer une fonction qui soustrait à $a la variable $b (2 paramètres en entrée),
-la fonction doit renvoyer le résultat de la soustraction $a-$b (return).*/
function soustraction(int $a, int $b):int{

$resultat = $a - $b;
return $resultat;
}
echo soustraction(5,2).'<br>';

/*6-Créer une fonction qui prend en entrée un nombre à virgule (float),
-la fonction doit renvoyer l’arrondi (return) du nombre en entrée.*/
function arrondi(float $nb):float{
return round($nb,2); // retourne un resultat arrondi 2 chiffres après la virgule
}

echo arrondi(4.267); 

/*7-Créer une fonction qui prend en entrée 3 valeurs et renvoie la somme des 3 valeurs.*/

function somme(int $nb1,int $nb2,int$nb3):int{
    $resultat = $nb1+$nb2+$nb3;
    return $resultat;
}
echo "<br>".somme(2,4,6);
/*Bonus : 
passer plusieurs valeurs en entrées et retourner la somme de ces valeurs peut importe le nombre de valeur.
NB : utiliser le type intérable ... voir le cours page 20/21*/
function somme1(...$liste){
    $somme = 0;
    foreach ($liste as $value){ //tout les éléments passé dans les parametres sont itéré dans le tableau
        $somme+= $value;
    }
    return $somme;
}
echo "<br>".somme1(2,4,6,3);

/*8-Créer une fonction qui prend en entrée 3 valeurs et retourne la valeur moyenne des 3 valeurs (saisies en paramètre).*/ 
function moyenne(int $nb1,int $nb2,int$nb3):int{
    $resultat = ($nb1+$nb2+$nb3)/3;
    return $resultat;
}
echo "<br>".moyenne(2,4,6);

/*9-Créer une fonction qui prend en entrée 3 valeurs et retourne le nombre le plus petit (echo dans la page web).*/

function petit(int $nb1, int $nb2,int $nb3):int{
if($nb1<$nb2 AND $nb1<$nb3){
    return $nb1;
}
else if($nb2<$nb1 AND $nb2<$nb3){
    return $nb2;
}
else{
    return $nb3;
}
}
echo '<br>'.petit(6,8,3);

/*9-Créer une fonction qui prend en entrée 1 valeur (l’âge d’un enfant). Ensuite, elle informe de sa catégorie (echo dans la page web) : 
    •    "Poussin" de 6 à 7 ans
    •    "Pupille" de 8 à 9 ans
    •    "Minime" de 10 à 11 ans
    •    "Cadet" après 12 ans */

    function categorie(int $nb){
        if($nb>=6 AND $nb<=7){
            $age="poussin";
            return $age;
        }else if($nb>=8 AND $nb<=9){
            $age="pupille";
            return $age;
        }else if($nb>=10 AND $nb<=11){
            $age="minime";
            return $age;
    }else if($nb>=12){
        $age="cadet";
        return $age;
    }else{
        $age="trop jeune";
        return $age;
    }
}
echo '<br>'.'Tu es '.categorie(11).'<br>';

/*Bonus : le faire en switch case */
function categorie2($nb){
    switch(true){  //j'utilise un booleen car je veux tester des conditions
        case $nb>=6 AND $nb<=7:
            echo "poussin";
            break;
        case $nb>=8 AND $nb<=9:
            echo "pupille";
            break;
        case $nb>=10 AND $nb<=11:
            echo "minime";
            break;
        case $nb>=12:
            echo "cadet";
            break;
        case $nb<=0:
                echo "Erreur de saisie";
                break;
        default:
            echo "trop jeune";
            break;
    }
}
categorie2(3);

/*ou sans booleen:
function testAgeSwitch(int $age){
    switch ($age) {
        case 1 : case 2: case 3: case 4: case 5:
            return "trop jeune";
            break;
        case 6: case 7:
            return "Poussin";
            break;
        case 8 : case 9:
            return "Pupille";
            break;
        case 10 : case 11 :
            return "Minime";
            break;
        default:
            return "Cadet";
            break;
    }
}
echo testAgeSwitch(12);
*/




?>
