<script setup lang="ts">
import { useRoute } from "vue-router";

const route = useRoute();
const parametro = route.params.nome;
</script>

<template>
  <div class="about">
    <h1>About</h1>
    <p>{{ parametro }}</p>
  </div>
</template>

<style>
@media (min-width: 1024px) {
  .about {
    min-height: 100vh;
    display: flex;
    align-items: center;
  }
}
</style>
