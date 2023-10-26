/* //Début fetch:
//url pour toutes les villes (remplacer ville par le nom de la ville choisie dans l'adresse => ex:q=ville&  == q=albi&)
const ville = 'https://api.openweathermap.org/data/2.5/weather?q=ville&appid=6f88826d767f323ad19cd282444924e9'


//url pour ville de toulouse(grâce à la lattitude et longitude)
const adresse = 'https://api.openweathermap.org/data/2.5/weather?lon=1.44&lat=43.6&appid=6f88826d767f323ad19cd282444924e9'

const meteo= fetch(ville).then(async response=>{
    console.log(response);
    const json = await response.json();
    console.log(json.name);
    console.log(json.coord.lat);
    console.log(json.weather[0].id)
}) */

/* //url de l'api
const ville= "morlaix"
const url = `https://api.openweathermap.org/data/2.5/weather?q=${ville}&appid=6f88826d767f323ad19cd282444924e9`;
//fonction récupérer la météo
const meteo = fetch(url).then(async response =>{
    //récupération du json 
    const json = await response.json();
    //affichage du json dans la console
    console.log(json);

    let nom=document.getElementById('nom');
    let temps=document.getElementById('temps');
    let temperature=document.getElementById('temperature');

    nom.textContent=json.name;
    temps.textContent=(json.main.temp-273.15).toFixed(2);
    temperature.textContent=json.weather[0].main;
}); */

const bt=document.getElementById('bt');
const input=document.getElementById('ville');

bt.addEventListener('click', ()=>{

    let ville=input.value;

    //url de l'api
    let url = `https://api.openweathermap.org/data/2.5/weather?q=${ville}&appid=6f88826d767f323ad19cd282444924e9`;
    //fonction récupérer la météo 

        const meteo = fetch(url).then(async response =>{
        //récupération du json 
        const json = await response.json(); //"await" pour attendre la réponse avant de l'utiliser
const icon=document.getElementById('icon');
        //affichage du json dans la console
    console.log(response);//pour trouver l'attribut de l'erreur404 en déroulant la ligne du console.log

    //Gestion de l'erreur 404
    if(response.status===404){  //===pour vérifier le type également
        const error=document.getElementById('error');
        error.textContent="La ville n'est pas valide";
        
    }else{ 
        
        let iconMeteo= `http://openweathermap.org/img/wn/${json.weather[0].icon}@2x.png`
        icon.setAttribute("src","");
        let nom=document.getElementById('nom');
        let temps=document.getElementById('temps');
        let temperature=document.getElementById('temperature');

        nom.textContent=json.name;
        temps.textContent=(json.main.temp-273.15).toFixed(2);//conversion de degrès kelvin à celsius
        temperature.textContent=json.weather[0].main;
        console.log(json);
        error.textContent="";
        }
    });
});