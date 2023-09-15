<script setup lang="ts">
interface Props {
  nome: string;
  repeticao?: number;
}
defineProps<Props>();
</script>

<template>
  <h2 v-for="n in repeticao">Alô, {{ nome }}!</h2>
</template>
