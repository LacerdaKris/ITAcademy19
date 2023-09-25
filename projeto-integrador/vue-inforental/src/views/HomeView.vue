<script setup lang="ts">
import NavBar from "../components/NavBar.vue"
import Home from "../components/Home.vue"

</script>

<template>
  <div class="menu">
    <NavBar />
  </div>
  <div class="home">
    <Suspense>
      <Home />
    </Suspense>
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