<template>
	<div class="superProfile">
		<p>Ici on est dans StevenSeagal.vue</p>
		<h1>Profil</h1>
		<h2>{{ firstName }}</h2>
		<h2>{{ lastName }}</h2>
		<h2>{{ job }}</h2>
		<h2>{{ carrure }}</h2>
	</div>
</template>

<script lang='js'>
import { defineComponent } from 'vue'

export default defineComponent({
	// Le composant a un nom
	name: 'StevenSeagal',

	data() {
		return {
			firstName: 'steven',
			lastName: 'Seagal',
			job: 'Frigo',
			carrure: 'Buffet'
		};
	}
});
</script>

<style scoped lang="css">
.superProfile {
	background-color: coral;
}
</style>