<script setup lang="ts">
import BotaoColorido from "./components/BotaoColorido.vue";
import LayoutBasico from "./components/LayoutBasico.vue";
</script>

<template>
  <LayoutBasico>
    <template #cabecalho>
      <h1>Exemplos de slots</h1>
    </template>
    <template #default>
      <button>Botão simples</button><br />
      <BotaoColorido /><br />
      <BotaoColorido>Escrita do botão padrão do slot</BotaoColorido><br />
      <BotaoColorido> <span>Escrita dentro do span</span>👌 </BotaoColorido
      ><br />
    </template>
    <template #rodape>
      <p>Desenvolvido por mim mesma</p>
    </template>
  </LayoutBasico>
</template>

<style scoped></style>
