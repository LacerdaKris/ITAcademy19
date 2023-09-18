<script setup lang="ts">
import { ref, watch } from "vue";

const pergunta = ref("");
const resposta = ref("*Perguntas devem terminar com interrogação*");
const imagem = ref("");

watch(pergunta, async (novaPergunta) => {
  if (novaPergunta.indexOf("?") > -1) {
    resposta.value = "Pensando...";
    try {
      const res = await fetch("https://yesno.wtf/api");
      const json = await res.json();
      resposta.value = json.answer;
      imagem.value = json.image;
    } catch (error) {
      resposta.value = "Erro! API inacessível: " + error;
    }
  }
});
</script>

<template>
  <p>
    Faça uma pergunta:
    <input type="text" v-model="pergunta" />
  </p>
  <p>{{ resposta }}</p>
  <img :src="imagem" alt="Resposta da imagem" />
</template>
