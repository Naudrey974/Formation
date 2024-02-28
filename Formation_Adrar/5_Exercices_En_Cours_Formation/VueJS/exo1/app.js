//! Création d'une instance Vue c'est notre application
Vue.createApp({
//! Dans une fonction data on va retourner un objet qui contiendra les variables de l'application
//! Toutes les data seront contenues dans this
data() {
    return {
    tasks: [],
    valeurDeInput: '',
    toto:'LOL TOTO',
    test: 'Si ça s\'affiche...',
    compte:123,
    joliTab:["nous","irons","au","bois"],
    joliTab2:{nb1:4,nb2:5,nb3:6,nb4:"cuellir",nb5:"des",nb6:"cerises"},
    random: Math.random(),
};
},
//! Dans cet Object methods, on va écrire nos fonctions
methods: {
    ajouterTask() {
    this.tasks.push(this.valeurDeInput);
    this.valeurDeInput = '';
    },
    affichageText(){
        if(this.random > 0.5){
            return "Le livre de la jungle"
        }
        else{
            return "La lecture pour les nuls"
        }
    }
},
//! L'application est montée sur la balise HTML qui possède l'id app
}).mount('#app');

Vue.createApp({
    data() {
      return {
        leLien: 'https://www.google.com',
      };
    },
  }).mount('#bookListApp');
  