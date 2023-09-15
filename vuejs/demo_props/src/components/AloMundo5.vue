<script setup lang="ts">
import { Pessoa } from "../pessoa";
defineProps<{ pessoas: Pessoa[] }>();
</script>

<template>
  <ul>
    <li v-for="pessoa in pessoas" :key="pessoa.id">Alô, {{ pessoa.nome }}!</li>
  </ul>
</template>
