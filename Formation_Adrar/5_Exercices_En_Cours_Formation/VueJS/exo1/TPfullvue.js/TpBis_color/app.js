// const app = Vue.createApp({
//     data() {
//         return {
//         selectCard1: false,
//         selectCard2: false,
//         //! Bonus : si on veut appliquer plusieurs modifications de style, je les range dans un objet
//         //! 🤔 ptet qu'on est en train de ré inventer les classes CSS ?
//         styleObject: {
//             color: 'red',
//             fontSize: '53px'
//         }
//         };
//     },
//     methods: {
//         selectionCard(uneCard) {
//         if (uneCard === 1) {
//             // this.selectCard1=true;
//             // téma le reclick malin 
//             this.selectCard1 = !this.selectCard1;
//         }
//         if (uneCard === 2) {
//             // this.selectCard2=true;
//             this.selectCard2 = !this.selectCard2;
//         }
//         },
//     },
//     });
//     app.mount('#monApp');

 

// ------------------
// version avec les class Css
// ------------------

const app = Vue.createApp({
    data() {
        return {
        selectCard1: false,
        selectCard2: false,
        //! Bonus : si on veut appliquer plusieurs modifications de style, je les range dans un objet
        //! 🤔 ptet qu'on est en train de ré inventer les classes CSS ?
        styleObject: {
            color: 'red',
            fontSize: '53px'
        }
        };
    },
    methods: {
        selectionCard(uneCard) {
        if (uneCard === 1) {
            // this.selectCard1=true;
            // téma le reclick malin 
            this.selectCard1 = !this.selectCard1;
        }
        if (uneCard === 2) {
            // this.selectCard2=true;
            this.selectCard2 = !this.selectCard2;
        }
        },
    },
    });
    app.mount('#monApp');
