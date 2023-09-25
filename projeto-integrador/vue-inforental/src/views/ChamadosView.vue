<script setup lang="ts">
import TabelaChamados from '../components/TabelaChamados.vue'
import NavBar from "../components/NavBar.vue"
</script>

<template>
  <!-- Navegador lateral -->
  <div class="menu">
    <NavBar />
  </div>

  <!-- Cabeçalho com nome da empresa -->
  <header id="header">
    <div class="card">Listar chamados abertos</div>
    <h1 class="nome-empresa"><img src="../assets/Frame.svg"> InfoRental</h1>
  </header>
  <!-- Tabela com chamados listados -->
  <div class="corpo">
    <div class="tabela">
      <TabelaChamados />
    </div>
  </div>
</template>

 
<style scoped>
/*aqui é onde a definimos o fundo do background onde tem a tabela e tambem o padding! */
.tabela {
  position: relative;
  background-color: #DFE1E6;
  padding: 30px;
}

/* o que tem nessa parte */
.menu {
  position: absolute;
  z-index: 20;
}

/*aqui é onde a gente deixou o background da mesma cor! */
.corpo {
  background-color: #DFE1E6;
  position: relative;
  min-height: 100vh;
}

/* estilização do cabeçalho da página */
#header {

  font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
  background-color: #FFFFFF;
  color: #0672cb;
  padding: 5px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* estilização da logo */
.nome-empresa {
  text-align: center;
  margin-right: 200px;
  flex-grow: 1;
}

/* estilização do card com o nome da página */
.card {

  background-color: #0672cb;
  color: #DFE1E6;
  padding: 10px;
  border-radius: 5px;
  margin-left: 100px;
}
</style>