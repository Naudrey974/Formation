const app = Vue.createApp({
  data() {
    return {
      //nom du joueur
      joueur: 'Evoli',
      monstre: 'Ectoplasma',
      //HP du joueur
      maxHP: 200,
      vieJoueur: 200,
      vieMonstre: 200,
      //Point attaque et soin
      attaque: 20,
      attaqueSpe: 30,
      soin: 35,
      //initialisation du compteur de tour
      currentRound: 0,
      //initialisation du battle log
      tab: [],
      attackLogPlayer: '',
      soinLogPlayer: '',
      attackLogMonstre: '',
      // Pourcentage de la barre de vie
      percentJoueur: 100,
      percentMonstre: 100,

      fuite: 'Vous avez pris la fuite',
      message: '',
    };
  },


  methods: {
    // Fonction Combat
    attackAdversaire(value) {
      bar = document.getElementsByClassName('lifeBar');
      switch (value) {
        // Si btn attaque simple cliqué
        case 'simpleAttack':
          this.vieMonstre = this.vieMonstre - this.attaque;
          this.currentRound++;
          this.attackLogPlayer = 'Player Attaque : -' + this.attaque + ' pts';
          this.tab.push(this.attackLogPlayer);
          this.percentMonstre = (this.vieMonstre / this.maxHP) * 100;
          break;
        // Si btn attaque spé cliqué
        case 'specialAttack':
          this.vieMonstre = this.vieMonstre - this.attaqueSpe;
          this.currentRound = 0;
          this.attackLogPlayer = 'Player Attaque spéciale : -' + this.attaqueSpe + ' pts';
          this.tab.push(this.attackLogPlayer);
          this.percentMonstre = (this.vieMonstre / this.maxHP) * 100;
          break;
        default:
          this.vieMonstre = this.vieMonstre;
      }
      // L'adversaire attaque aussi
      this.attackPlayer();
      this.percent = (this.vieJoueur / this.maxHP) * 100;
    },
    // Function d'attaque de l'adversaire
    attackPlayer() {
      this.vieJoueur = this.vieJoueur - this.attaque * 1.3;
      this.attackLogMonstre = 'Monstre Attaque : -' + this.attaque * 1.3 + ' pts';
      this.tab.push(this.attackLogMonstre);
      this.percentJoueur = (this.vieJoueur / this.maxHP) * 100;
    },

    // Function de soin
    selectSoin() {
      // Si la vie du joueur plus le soin dépasse 200 alors rien ne se passe
      if (this.vieJoueur + this.soin > 200) {
        this.vieJoueur = this.vieJoueur;
        this.percentJoueur = (this.vieJoueur / this.maxHP) * 100;
      } else {
        this.vieJoueur = this.vieJoueur + this.soin;
        this.soinLogPlayer = 'Player Se soigne : +' + this.soin + ' pts';
        this.tab.push(this.soinLogPlayer);
        this.attackPlayer();
      }
    },

    //Function abandon
    fuiteBtn() {
      this.fuite;
      this.tab.splice(0, this.tab.length, this.fuite);
      setTimeout(function () {
        window.location.reload();
      }, 5000);
    },

    refresh() {
      setTimeout(function () {
        window.location.reload();
      }, 100);
    },
  },

  // Check pour action en fonction de la vie du joueur
  watch: {
    vieJoueur(hp) {
      if (hp <= 0) {
        this.vieJoueur = 0;
        // Déclenchement d'un audio
        loosesound = new Audio('./sound/loose.mp3');
        loosesound.play();
        this.message = 'Oh non, tu as perdu... Ré-essayer?';
      }
    },
    vieMonstre(hp) {
      if (hp <= 0) {
        this.vieMonstre = 0;
        victorysound = new Audio('./sound/victory.mp3');
        victorysound.play();
        this.message = 'Bravo, tu as terrassé ton adversaire';
      }
    },
  },
});

app.mount('#monApp');
