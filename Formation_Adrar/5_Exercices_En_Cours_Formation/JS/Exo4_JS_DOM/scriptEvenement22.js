const email=document.getElementById('email');

let regexEmail = /^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

email.addEventListener('keyup',()=>{
    if(email.value.match(regexEmail)){
        email.style.backgroundColor="green";
    }else{
        email.style.backgroundColor="red";
    }
})

const password = document.querySelector('#password');
let regexPwd = /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z]).{12,20}$/

password.addEventListener('keyup', ()=>{
    console.log(password);
    if(password.value.match(regexPwd)){
        password.style.backgroundColor = 'green';
    }else{
        password.style.backgroundColor = 'red';
    }
});