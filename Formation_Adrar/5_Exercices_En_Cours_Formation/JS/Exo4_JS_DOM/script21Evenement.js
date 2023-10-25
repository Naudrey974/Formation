
const bt=document.querySelector('#bt');
bt.addEventListener('click', ()=>{
    const nom=document.getElementById('nom').value;
    const prixHT=document.getElementById('prixHT').value;
    const quantite=document.getElementById('quantite').value;
    const listInput=document.querySelectorAll('input[type="text"');
    console.log(listInput[0].value)
    for(let i=0;i<listInput.length;i++){
        //listInput[i].value
        if(listInput[i].value==""){
            listInput[i].style.backgroundColor = 'red'
        }else{
            listInput[i].style.backgroundColor = 'green'
        }
    }
    if(!isNaN(listInput[1].value) && !isNaN(listInput[2].value) && (listInput[1].value)>0 && (listInput[2].value>0)){
        let resultat=document.getElementById('resultat');
        let prixTTC=(parseInt(listInput[2].value)*parseFloat(listInput[1].value)*1.2).toFixed(2);
        resultat.textContent=`le prix TTC est égale à:${prixTTC} €`;
        
    }
})