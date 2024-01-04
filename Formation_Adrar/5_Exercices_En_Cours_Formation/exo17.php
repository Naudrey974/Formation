 
<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
 Exercice 14 Formulaire :
partie HTML :
créer une page index.php qui va contenir un formulaire :
-avec la méthode POST
-un input text (name : nbr1),
-un input text (name: nbr2),
-un bouton submit,  

<form action="" method="POST">
    <input type="text" name="nbr1">
    <input type="text" name="nbr2">
    <input type="submit" value="envoyer" name="submit">
</form>

<br>
<br>    
<br>    
</body>
</html> -->

<?php
/*partie PHP :
-tester si le formulaire est submit,
-Tester si les champs nbr1 et nbr2 sont remplis,
-additionner les 2 nombres,
-Afficher le résultat de l'opération sous la forme :
L'addition des 2 valeurs est égale : résultat  

if(isset($_POST["submit"])){
    if(!empty($_POST["nbr1"]) AND !empty($_POST["nbr2"])){
        echo "Le nombre 1 est : ".$_POST["nbr1"]."<br>";
        echo "Le nombre 2 est : ".$_POST["nbr2"]."<br>";
        // test si ce sont des nombres
    if(is_numeric($_POST["nbr1"]) AND is_numeric($_POST["nbr2"])){
        echo "La somme des 2 nombres est: ".($_POST["nbr1"])+($_POST["nbr2"])."<br>";
    }
    }else{
        echo "Les champs sont vides";
    }
}
 */
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
 <!-- Exercice 15 Formulaire :
Partie HTML :
créer une page index.php qui va contenir un formulaire :
-avec la méthode POST
-un input text (name : nbr1),
-un input text (name: nbr2),
-un input text (name: operateur),
-un bouton submit,  -->
<br>
<form action="" method="POST">
    <label for="nb1">Saisir un nombre</label>
    <input type="text" name="nb1">
    <label for="nb2">Saisir un nombre</label>
    <input type="text" name="nb2">
    <label for="operateur">Saisir + - * ou /</label>
    <input type="text" name="operateur">
    <input type="submit" value="envoyer" name="submit1">
</form>
    
</body>
</html> 

<?php
/* Partie PHP :
-tester si le formulaire est submit,
-tester si les champs sont remplis,
-tester la valeur de operateur :
si c'est "+" -> addition des 2 nombres,
si c'est "-" -> soustraction des 2 nombres,
si c'est "/" -> division des 2 nombres,
si c'est "*" -> multiplication des 2 nombres.
-Afficher le résultat de l'opération dans la page. */ 

/* Bonus :
-Tester si l'opérateur est différent de  " + - / ou * ",
Afficher une erreur l'opération n'existe pas.
-Tester si le 2 éme nombre vaut 0 (division par zero)
Afficher la division par zéro est impossible, */ 

if(isset($_POST["submit1"])){
    if(!empty($_POST["nb1"]) AND ($_POST["nb2"] !=="" OR is_numeric($_POST["nb2"])) AND !empty($_POST["operateur"])){
        if(is_numeric($_POST["nb1"]) AND is_numeric($_POST["nb2"])){
        echo "Les nombres sont : ".$_POST["nb1"]." et : ".$_POST["nb2"]."<br>";
    $result = ""; //je déclare la variable $result avant pour eviter le warning de la division par 0.
    switch ($_POST["operateur"]){
        case "+":
            $result = ($_POST["nb1"])+($_POST["nb2"]);
            break;
        case "-":
            $result = ($_POST["nb1"])-($_POST["nb2"]);
            break;
        case "/":
             if($_POST["nb2"]==="0"){
                echo "La division est impossible";}
                else{  
                $result = ($_POST["nb1"])/($_POST["nb2"]);}
            break;
        case "*":
            $result = ($_POST["nb1"])*($_POST["nb2"]);
            break;
        default:
            echo "L'opération est impossible";
            break;
        }
        echo $result;
    }else{
        echo "Merci de remplir les champs.";
    }
}
}

?>