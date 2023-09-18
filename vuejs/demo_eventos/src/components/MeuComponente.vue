<script setup lang="ts">
const emit = defineEmits(["evento"]);
</script>

<template>
  <h1>Meu componente</h1>
  <button type="button" @click="emit('evento')">Dispare Evento</button>
</template>
