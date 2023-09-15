<script setup lang="ts">
import AloMundo from "./components/AloMundo.vue";
import AloMundo2 from "./components/AloMundo2.vue";
import AloMundo3 from "./components/AloMundo3.vue";
import AloMundo4 from "./components/AloMundo4.vue";
import AloMundo5 from "./components/AloMundo5.vue";
import { Pessoa } from "./pessoa";
import { ref } from "vue";

const algumasPessoas = ref([
  new Pessoa(1, "John", 32),
  new Pessoa(2, "Mary", 30),
  new Pessoa(3, "Ana", 12),
]);
</script>

<template>
  <AloMundo />
  <AloMundo2 nome="Kris" />
  <AloMundo3 nome="com repetição" :repeticao="3" />
  <AloMundo4 nome="repetição default 1x sem informar repetição" />
  <AloMundo5 :pessoas="algumasPessoas" />
</template>

<style scoped></style>
