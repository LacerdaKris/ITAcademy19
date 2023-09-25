<script setup lang="ts">
import AtenderChamado from "../components/AtenderChamado.vue";
import NavBar from "../components/NavBar.vue";
</script>

<template>
  <div class="menu">
    <NavBar />
  </div>
  <div class="atenderChamado">
    <AtenderChamado />
  </div>
</template>

<style scoped>
.atenderChamado {
  position: relative;
  background-color: #0672cb;
  position: relative;
  min-height: 100vh;
}

.menu {
  position: absolute;
  z-index: 20;
}
</style>