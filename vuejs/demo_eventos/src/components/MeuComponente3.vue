<script setup lang="ts">
const emit = defineEmits<{ evento: [valor: string] }>();
</script>

<template>
  <h1>Meu componente 3</h1>
  <button
    type="button"
    @click="emit('evento', 'Meu componente tipado diz alô!')"
  >
    Dispare Evento
  </button>
</template>
