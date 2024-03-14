<template>
	<div class="container">
        <div class="card text-center">
            <div class="card-body">
                <p class="card-text">Ajouter des Task</p>
                <!--la directive v-model, sur l'input va permettre de le Connecter à une variable JS -->
                <input v-model="valeurDeInput" class="form-control" type="text" />
                <!-- la directive v-on:click, sur le button permet de réagir au click et exécuter la fonction ajouterTask côté JS -->
                <button v-on:click="ajouterTask" type="button" class="btn btn-primary mt-2">Ajouter</button>
            </div>
            <div class="card-footer text-muted">
                <h5>Ma Liste</h5>
                <ul>
                    <!-- la directive v-for, sur la <li> va permettre de répéter l'affichage de <li> autant de fois que des data sont présentes dans le tableau tasks (côté JS)  -->
                    <!-- cette syntaxe en double accolades {{uneTask}} permet d'afficher une variable(JS) directement -->
                    <li v-for="uneTask in tasks">{{uneTask}}</li>
                </ul>
            </div>
        </div>
    </div>
</template>

<script lang='js'>
import { defineComponent } from 'vue'

export default defineComponent({
	name: 'TodoList',
	data() {
		return {
			tasks: [],
    		valeurDeInput: '',
		};
	},
	methods: {
		ajouterTask() {
    this.tasks.push(this.valeurDeInput);
    this.valeurDeInput = '';
    },
	},
});
</script>

<style scoped lang="css">
</style>