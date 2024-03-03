Vue.createApp({
   
    data() {
        return {
            mesFilms: [],
            nomFilm: '',
        };
    },
    //! Dans cet Object methods, on va écrire nos fonctions
    methods: {
        ajouterFilm() {
            this.mesFilms.push(this.nomFilm);
            this.nomFilm = '';
            },
        
    },
    watch:{

    }
    //! L'application est montée sur la balise HTML qui possède l'id app
    }).mount('#app');