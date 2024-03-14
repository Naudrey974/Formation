<!-- 
<template>
    <div class="container p-3 my-1">
        <ul class="list-group">
            <h2 class="list-group-item">{{ unAmiName }}</h2>

            <h2 class="list-group-item">{{ unAmiPremium == '' ? true : false}}</h2>
            <button @click="afficherDetails" class="btn btn-outline-dark">
                {{ !detailsVisibles ? 'Voir Détails' : 'Masquer Détails' }}
            </button>
            <ul v-if="detailsVisibles" class="list-group">
                <li class="list-group-item">{{ unAmiPhone }}</li>
                <li class="list-group-item">{{ unAmiMail }}</li>
            </ul>
        </ul>
    </div>
</template>

<script lang='js'>
import { defineComponent } from 'vue'

export default defineComponent({
    name: 'UnAmi',
    // props: ['unAmiName', 'unAmiPhone', 'unAmiMail','unAmiPremium'],
	props:{ //on créer des objets props plus détaillés pour sécuriser (on verra des warnings dans la console)
		unAmiName:{
			type : String,
			required : true,
		},
		unAmiPhone:{
			type : Number,
			required : true,
		},
		unAmiMail:{
			type : String,
			required : true,
		},
		unAmiPremium:{ 
			type : Boolean,
			required : false,
			default: false, // valeur par defaut = si non renseignée ça ne casse pas le code, dans cet exemple ça applique 0
			// validator: function (value){
			// 	return value==='1'|| value=='0';
			// }
	},
	},
    data() {
        return {
            detailsVisibles: false,
			premium: this.unAmiPremium,
        };
    },

    methods: {
        afficherDetails() {
            this.detailsVisibles = !this.detailsVisibles;
        },

		afficherPremuium(){
			// if(this.premium === '1'){
			// 	this.premium = '0';
			// }else{
			// 	this.premium = '1';
			// }
			this.premium = !this.premium;

		}
    },
});
</script>

<style scoped lang="css">
.container {
    background-color: deepskyblue;
}
</style> -->
<template>
    <div class="container my-1 p-3">
        <ul class="list-group">
            <h2 class="list-group-item">{{unAmiName}} {{premium? 'Ami premium':'Ami nul'}}</h2> 
            <button @click="afficherPremium" class="btn btn-danger mb-1">Premium ?</button>
            <button @click="afficherDetails" class="btn btn-outline-dark">{{detailsVisibles? 'Masquer': 'Afficher'}}</button>           
            <ul v-if="detailsVisibles" class="list-group">
                <li class="list-group-item">{{unAmiPhone}}</li>
                <li class="list-group-item">{{unAmiMail}}</li>
            </ul>
        </ul>
    </div> 
</template>

<script lang='js'>
import { defineComponent } from 'vue'

export default defineComponent({
    name: 'UnAmi',
    props: {
        id: {
            type: String,
            required: true
        },
        unAmiName: {
            type: String,
            required: true
        },
        unAmiPhone: {
            type: String,
            required: true
        },
        unAmiMail: {
            type: String,
            required: true
        },
        premium: {
            type: Boolean,
            required: false,
            default: false
        }
    },
    data() {
        return {
            detailsVisibles: false,
            // premiumData: this.premium
        };
    },

    methods: {
        afficherDetails() {
            this.detailsVisibles = !this.detailsVisibles;
        },
        afficherPremium() {
            // this.premiumData = !this.premiumData;
            this.$emit('mon-event-premium',this.id);
        }
    },
});
</script>