<template>
  <link
    href="https://fonts.googleapis.com/css2?family=Lato&display=swap"
    rel="stylesheet"
  />
  <link
    href="https://use.fontawesome.com/releases/v5.6.1/css/all.css"
    rel="stylesheet"
  />
  <nav>
    <div class="navbar">
      <div class="container nav-container">
        <input class="checkbox" type="checkbox" name="" id="" />
        <div class="hamburger-lines">
          <span class="line line1"></span>
          <span class="line line2"></span>
          <span class="line line3"></span>
        </div>
        <div class="menu-items">
          <li>
            <RouterLink to="/"><img src="../assets/Home.svg" />Home</RouterLink>
          </li>
          <li>
            <RouterLink to="/novo_chamado"
              ><img src="../assets/Adicionar.svg" /> Novo Chamado</RouterLink
            >
          </li>
          <li>
            <RouterLink to="/atender_chamado_manutencao"
              ><img src="../assets/Atender.svg" />Atender Chamado
            </RouterLink>
          </li>
          <li>
            <RouterLink to="/listar_chamados"
              ><img src="../assets/Pesquisar.svg" />Chamados</RouterLink
            >
          </li>
        </div>
      </div>
    </div>
  </nav>
</template>

<style scoped>
* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

body {
  font-family: "Lato", sans-serif;
}

.container {
  width: 100%;
}

/* o que tem nessa parte */
.navbar {
  width: 25%;
  max-width: 400px;
  min-width: 300px;
  height: 100%;
}

/* o que tem nessa parte */
.nav-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

/* o que tem nessa parte */
.navbar .menu-items {
  display: flex;
  font-family: "Lato", sans-serif;
  align-items: left;
}

/* o que tem nessa parte */
.navbar .nav-container li {
  list-style: none;
}

/* o que tem nessa parte */
.navbar .nav-container a {
  text-decoration: none;
  color: white;
  font-weight: 500;
  font-size: 18px;
}

/* o que tem nessa parte */
.navbar .nav-container a:hover {
  font-weight: bolder;
}

/* o que tem nessa parte */
.nav-container {
  display: block;
  position: relative;
}

/*Botão invisível onde clica e abre o menu lateral, mesma posição das linhas do hambúrguer*/
.checkbox {
  position: absolute;
  display: block;
  height: 32px;
  width: 32px;
  top: 20px;
  left: 20px;
  z-index: 5;
  opacity: 0;
  cursor: pointer;
}

/* Linhas de hamburguer, para o menu lateral */
.hamburger-lines {
  display: block;
  height: 26px;
  width: 32px;
  position: absolute;
  top: 17px;
  left: 20px;
  z-index: 2;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

/* o que tem nessa parte */
.nav-container .hamburger-lines .line {
  display: block;
  height: 4px;
  width: 100%;
  border-radius: 10px;
  background: #0672cb;
}

/* o que tem nessa parte */
.nav-container .hamburger-lines .line1 {
  transform-origin: 0% 0%;
  transition: transform 0.4s ease-in-out;
}

/* o que tem nessa parte */
.nav-container .hamburger-lines .line2 {
  transition: transform 0.2s ease-in-out;
}

/* o que tem nessa parte */
.nav-container .hamburger-lines .line3 {
  transform-origin: 0% 100%;
  transition: transform 0.4s ease-in-out;
}

/* o que tem nessa parte */
.navbar .menu-items {
  background-color: #053d6a;
  padding-top: 80px;
  padding-left: 10px;
  /* Ajustei o padding para dar espaço na parte esquerda da navbar */
  height: 100vh;
  width: 100%;
  transform: translate(-150%);
  display: flex;
  flex-direction: column;
  transition: transform 0.5s ease-in-out;
  text-align: left;
  display: flex;
}

/* o que tem nessa parte */
.navbar .menu-items li {
  margin-bottom: 1.2rem;
  font-size: 1.5rem;
  font-weight: 500;
  margin-left: 20px;
  align-items: center;
}

/* o que tem nessa parte */
.nav-container input[type="checkbox"]:checked ~ .menu-items {
  transform: translateX(0);
}

/* o que tem nessa parte */
.nav-container input[type="checkbox"]:checked ~ .hamburger-lines .line {
  background: white;
}

/* o que tem nessa parte */
img {
  vertical-align: middle;
}
</style>
