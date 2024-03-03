Vue.createApp({
    //! Dans une fonction data on va retourner un objet qui contiendra les variables de l'application
    //! Toutes les data seront contenues dans this
    data() {
        return {
            leNombre : 0,
            nbMystere:''
        };
    },
    //! Dans cet Object methods, on va écrire nos fonctions
    methods: {
        rouge(num){
            this.leNombre += num;
        },
        
         
    },
    watch:{
        leNombre(value){
            console.log(value)
            
            if(value < 7){

                 this.nbMystere = "Essaie encore";
            }
            else if(value > 7){
                this.nbMystere = "Tu as dépassé le nombre mystère!";
            }
            if(value > 30){
                setTimeout(() => {this.leNombre=0}, 3000);
            }
           
            else{

                this.nbMystere = "Tu as trouvé le nombre mystère"
                
            }
            
        }
    }
    //! L'application est montée sur la balise HTML qui possède l'id app
    }).mount('#app');
    