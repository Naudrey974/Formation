//function pour mettre à jour le texte de la tache courante
function updateTask(e){
    //test si statut est égale à true
    if(statut){
        //récupération de la valeur de la tâche (paragraphe)
        const valeur = e.parentNode.firstChild.textContent;
        //création de l'élément input
        const input = document.createElement('input');
        input.setAttribute('type', 'text');
        //remplacer le paragraphe par un input
        e.parentNode.replaceChild(input, e.parentNode.firstChild);
        //assigner la valeur
        e.parentNode.firstChild.value = valeur;
        //changer la valeur de statut 
        statut = false;
    }
    //test sinon statut est égal à false
    else{
        //récupération la valeur de la tâche (input)
        const valeur = e.parentNode.firstChild.value;
        //créer un nouvel élément paragraphe
        const paragraphe = document.createElement('p');
        //remplacer l'input par le paragraphe
        e.parentNode.replaceChild(paragraphe, e.parentNode.firstChild);
        //Assigner la valeur au paragraphe
        e.parentNode.firstChild.textContent = valeur;
        //changer la valeur de statut
        statut = true;
    }
}