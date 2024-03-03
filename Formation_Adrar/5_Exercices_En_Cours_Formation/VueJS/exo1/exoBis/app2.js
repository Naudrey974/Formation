// Vue.createApp({
//     //! Dans une fonction data on va retourner un objet qui contiendra les variables de l'application
//     //! Toutes les data seront contenues dans this
//     data() {
//         return {
//             photo: '2111288.jpg',
//             nom: 'Dr.Mario',
//             age:45,
//             nbFetiche: Math.random(),
       
//     };
//     },
//     //! Dans cet Object methods, on va écrire nos fonctions
//     methods: {
//         agePlus(){
//             return this.age +10
//         },

//         CsonChoix(){
//             return this.nbFetiche
//         }
//     },
//     //! L'application est montée sur la balise HTML qui possède l'id app
//     }).mount('#app');





    // Vue.createApp({
       
    //     data() {
    //         return {
    //             nombre:0
    //     };
    //     },
        
    //     methods: {
    //         moins(){
    //             this.nombre -=1
    //         },

    //         plus(){
    //             this.nombre +=1
    //         }

    //     },
    //     //! L'application est montée sur la balise HTML qui possède l'id app
    //     }).mount('#monApp');


    
// -----------
// méthode pour crer un bug sur les fonctions et évènements
// -----------
 Vue.createApp({
       
        data() {
            return {
                nombre:0,
                userName:'',

            };
        },
        
        methods: {
            moins(){
                this.nombre -=1
            },

            plus(){
                this.nombre +=1
            },            
        },

        computed:{
            bugUser(){
                console.log ("Fonction executée");

                if(this.userName==''){
                    return "test"
                }
                else{
                    return "Un autre test"
                }
            },
        }
    
        //! L'application est montée sur la balise HTML qui possède l'id app
        })
        .mount('#monApp');



        //! SOLUCE en utilisant les methods avec des paramètres (utilisés côté template)
//! avec un petit bonus : la methods capterInput et event en paramètre pour capter un event (Native Object Event)
// Vue.createApp({
//     data(){
//         return {
//             leNombre : 0,
//             truc:2,
//             uneString:'Hello'
//         };        
//     },
//     methods: {
//         augmenter(num){
//             this.leNombre += num;
//         },
//         reduire(num){
//             this.leNombre -= num;
//         },
//         capterInput(event){
//             console.log(event);
//             this.uneString = event.target.value;
//         },
//         capterClick(eventClick){
//             console.log(eventClick);
//         }
//     }
// }).mount('#monApp');



// Vue.createApp({
//     data(){
//         return {
//            input1:'',
//            input2:''
//         };        
//     },
//     methods: {
//         saisie1(event){
//             console.log(event);
//             this.input1=event.target.value; //target.value pour capter les valeurs saisies
//         },

//         saisie2(event){
//             console.log(event)
//             this.input2=event.target.value;
//         },

//         lanceAlerte(){ 
//             alert("Coucou les amis")
//         }
//     }
// }).mount('#monApp');


