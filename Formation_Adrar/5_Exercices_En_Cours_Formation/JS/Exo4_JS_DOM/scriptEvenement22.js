const email=document.getElementById('email');

let regexEmail = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
//Ecouteur 'keyup' s'active au clic sur la touche clavier
email.addEventListener('keyup',()=>{
    // 'match()' : on match la valeur avec le regex
    if(email.value.match(regexEmail)){
        email.style.backgroundColor="green";
    }else{
        email.style.backgroundColor="red";
    }
})

const password = document.querySelector('#password');
let regexPwd = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{12,20}$/

//Ecouteur 'blur' s'active lorsqu'on dé-sélectionne le champ
password.addEventListener('blur', ()=>{
    console.log(password);
    if(password.value.match(regexPwd)){
        password.style.backgroundColor = 'green';
    }else{
        password.style.backgroundColor = 'red';
    }
});

const error=document.getElementById('error');
//error==true;
console.log(error);
const bt=document.getElementById('bt')

bt.addEventListener('click', ()=>{
    // 'test()' se construit à l'inverse de match : le regex est testé par apport à la valeur
    if(regexPwd.test(password.value) && regexEmail.test(email.value)){
    error.textContent="Votre mail et mot de passe sont valides"
    }else if(regexPwd.test(password.value) || regexEmail.test(email.value)){
        error.textContent="Votre mail ou votre mot de passe sont invalides"
    }
});
