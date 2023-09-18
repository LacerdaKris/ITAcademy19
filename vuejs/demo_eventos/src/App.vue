<script setup lang="ts">
import MeuComponente from "./components/MeuComponente.vue";
import MeuComponente2 from "./components/MeuComponente2.vue";
import MeuComponente3 from "./components/MeuComponente3.vue";
import { ref } from "vue";

const mensagem = ref("Nada ocorreu");

function tratadorDoEvento() {
  mensagem.value = "Evento de MeuComponente ocorreu!";
}
function tratadorDoEvento2(valor: string) {
  mensagem.value = valor;
}
</script>

<template>
  <p>{{ mensagem }}</p>
  <br />
  <MeuComponente @evento="tratadorDoEvento" />
  <br />
  <MeuComponente2 @evento="tratadorDoEvento2" />
  <br />
  <MeuComponente3 @evento="tratadorDoEvento2" />
</template>

<style scoped></style>
