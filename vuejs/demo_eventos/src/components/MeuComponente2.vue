<script setup lang="ts">
const emit = defineEmits(["evento"]);
</script>

<template>
  <h1>Meu componente 2</h1>
  <button type="button" @click="emit('evento', 'Meu componente diz alô!')">
    Dispare Evento
  </button>
</template>
