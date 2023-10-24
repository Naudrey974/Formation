
// Version avec bonus
//récupération de la div (tasks)
const liste = document.querySelector('#tasks');
//fonction pour ajouter une tâche
    function addTask(){
    //récupération de l'input (task)
    const valeur = document.querySelector('#task').value;
    //création du container (container)
    const container = document.createElement('div');
    //ajout de l'attribut class : container (div container)
    container.setAttribute('class', 'container');
    //création du paragraphe
    const paragraphe = document.createElement('p');
    paragraphe.textContent = valeur;
    const btUpdate = document.createElement('button');
    //création du bouton update
    btUpdate.textContent = "Update";
    btUpdate.setAttribute('onclick','updateTask(this)');
    btUpdate.setAttribute('id','update');
    //création du bouton delete
    const btDelete = document.createElement('button');
    btDelete.textContent = "Delete";
    btDelete.setAttribute('onclick','deleteTask(this)');
    //ajouter les enfants à la div (container)
    container.appendChild(paragraphe);
    container.appendChild(btUpdate);
    container.appendChild(btDelete);
    //ajouter la div container à liste
    liste.appendChild(container);
} 


//fonction qui va supprimer tous les enfants de tasks
function delAllTask(){
    while(liste.firstChild){
        liste.removeChild(liste.firstChild);
    }
}
//fonction pour recharger la page
function reload(){
    location.reload();
}
//fonction pour supprimer la tache (div container parente)
function deleteTask(e){
    e.parentNode.remove();
}


let statut=true;
 //function pour mettre à jour le texte de la tache courante
function updateTask(e){
   
    if(statut){ 
    const paragraphe=e.previousElementSibling.textContent;
    
    const textInput=document.createElement('input');
    textInput.setAttribute('type','text');
    e.parentNode.replaceChild(textInput,e.previousElementSibling);
    statut=false
}else{
    const textInput2=e.previousElementSibling.value;
    const textV1=document.createElement('p');
    textV1.textContent=textInput2;
    e.parentNode.replaceChild(textV1,e.previousElementSibling);
    statut=true;
}
} 