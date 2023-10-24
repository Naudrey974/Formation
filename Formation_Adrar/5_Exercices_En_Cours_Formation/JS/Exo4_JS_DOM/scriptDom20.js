//récupération de la div (tasks)
const liste = document.querySelector('#tasks');

//création de la clé "tasks" avec en valeur un tableau vide
localStorage.setItem("tasks","[]");

//fonction pour ajouter une tâche

function addTask(){
    //récupération de l'input (task)
    const valeur = document.querySelector('#task').value;    
    localStorage.setItem("tasks",valeur);
      
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
//Exo 20 fonction sur le LocalStorage "showAllTasks"
function showAllTask(){
    const storage=localStorage.getItem("tasks");
    console.log(storage);
    const paragraphe = document.createElement('p');
    paragraphe.textContent = storage;
    const container = document.createElement('div');
    container.setAttribute('class', 'container');
    container.appendChild(paragraphe);
    liste.appendChild(container);
    console.log(liste)
    //delAllTask();
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
//fonction pour modifier la tâche
let statut=true;
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