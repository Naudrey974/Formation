<script setup>
// import HelloWorld from './components/HelloWorld.vue'
// import TaskList from './components/TaskList.vue'
import AllFriends from './components/AllFriends.vue';
import UnAmi from './components/UnAmi.vue'
import Header from './components/Header.vue'

</script>

<template>
  <div class="main p-3">
    <!-- <a href="https://vitejs.dev" target="_blank">
      <img src="/vite.svg" class="logo" alt="Vite logo" />
    </a>
    <a href="https://vuejs.org/" target="_blank">
      <img src="./assets/vue.svg" class="logo vue" alt="Vue logo" />
    </a>
    <a href="https://vuejs.org/" target="_blank">
      <img src="./assets/bootstrap.svg" class="logo vue" alt="Bootstrap logo" />
    </a> -->
    <!-- <HelloWorld msg="Vite + Vue + Bootstrap" /> -->

    <!-- Dedéclaration automatique des composants. 
  Lorsque vous avez un composant Vue déclaré de manière globale, 
  vous pouvez l'utiliser comme une balise HTML 
  dans le reste de votre application sans avoir à l'importer explicitement.
  Vue.js prend automatiquement en compte la déclaration globale des composants
  et les associe aux balises HTML correspondantes. -->
    <!-- <task-list/>
    <TaskList/>
    <TaskList></TaskList> -->
    <!-- Par convention on nomme le fichiers de composant MonComposant et on l'utilise en HTML en kebab case <mon-composant> -->
    <!--<task-list></task-list>-->
    
    <!--<UnAmi unAmiName="maurice" unAmiPhone="0505050505" unAmiMail="maurice@loulou.fr" unAmiPremium="0"></UnAmi>
    <un-ami unAmiName="Cortex22" unAmiPhone="30303003" unAmiMail="cortex@cortex.cortex" unAmiPremium="1"></un-ami>
    <un-ami unAmiName="Dr.Qwerty" unAmiPhone="098765234" unAmiMail="b@b.bb" unAmiPremium="1"></un-ami>
    <UnAmi  unAmiPhone="098765234" unAmiMail="b@b.bb" unAmiPremium="1000"></UnAmi>-->
  
    <h1>App.vue ici</h1>
    <header></header>
    <router-view></router-view>
    
    
    <!-- <AllFriends></AllFriends> -->
    
    
  </div>
</template>

<style scoped>
.logo {
  height: 6em;
  padding: 1.5em;
  will-change: filter;
  transition: filter 300ms;
}
.logo:hover {
  filter: drop-shadow(0 0 2em #646cffaa);
}
.logo.vue:hover {
  filter: drop-shadow(0 0 2em #42b883aa);
}
h1{
  background-color: aqua;
}
</style>
