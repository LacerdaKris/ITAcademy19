<script setup lang="ts">
import NovoChamado from '../components/NovoChamado.vue'
import NavBar from "../components/NavBar.vue"
</script>

<template>
  <div class="menu">
    <NavBar />
  </div>
  <div class="novoChamado">
    <NovoChamado />
  </div>
</template>

<style scoped>
.novoChamado {
  position: relative;
}

.menu {
  position: absolute;
  z-index: 20;

}
</style>