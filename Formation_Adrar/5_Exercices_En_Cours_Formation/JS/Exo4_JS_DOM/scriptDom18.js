

function addTask(){  
     const task=document.querySelector("#task").value;
    //const newTask=document.createElement('p');
    //newTask.textContent=task;
    //tasks.appendChild(newTask); 
let container=0;
const element=document.getElementById('tasks');
element.setAttribute('id', container);
container=document.createElement('p');
container.textContent=task;
tasks.appendChild(container); 
    

    /* const bt1=document.createElement('button');
    const bt2=document.createElement('button');
    bt1.setAttribute('id',delete);
    bt1.setAttribute('onclick',deleteTask(this));
    bt2.setAttribute('id',update);
    bt2.setAttribute('onclick',updateTask(this)) */
}


function delAllTask(){
    const newElem=document.querySelector("#tasks")
    while(newElem.firstChild){
    newElem.removeChild(newElem.firstChild);
    }
}


function reload(){
    location.reload();
}