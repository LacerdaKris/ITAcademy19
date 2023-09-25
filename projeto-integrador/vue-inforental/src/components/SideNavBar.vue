<template>
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
          <li><RouterLink to="/">Home</RouterLink></li>
          <li><RouterLink to="/novo_chamado">Novo Chamado</RouterLink></li>
          <li>
            <RouterLink to="/atender_chamado_manutencao"
              >Atender Chamado</RouterLink
            >
          </li>
          <li><RouterLink to="/listar_chamados">Chamados</RouterLink></li>
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
  font-family: "Courier New", Courier, monospace;
}

.container {
  width: 100%;
}

.navbar {
  width: 25%;
  max-width: 400px;
  min-width: 300px;
  height: 100%;
}

.nav-container {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.navbar .menu-items {
  display: flex;
}

.navbar .nav-container li {
  list-style: none;
}

.navbar .nav-container a {
  text-decoration: none;
  color: white;
  font-weight: 500;
  font-size: 18px;
}

.navbar .nav-container a:hover {
  font-weight: bolder;
}

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

.nav-container .hamburger-lines .line {
  display: block;
  height: 4px;
  width: 100%;
  border-radius: 10px;
  background: #0672cb;
}

.nav-container .hamburger-lines .line1 {
  transform-origin: 0% 0%;
  transition: transform 0.4s ease-in-out;
}

.nav-container .hamburger-lines .line2 {
  transition: transform 0.2s ease-in-out;
}

.nav-container .hamburger-lines .line3 {
  transform-origin: 0% 100%;
  transition: transform 0.4s ease-in-out;
}

.navbar .menu-items {
  background-color: #0672cb;
  padding-top: 120px;
  height: 100vh;
  width: 100%;
  transform: translate(-150%);
  display: flex;
  flex-direction: column;
  margin-left: 0px;
  padding-left: 0px;
  transition: transform 0.5s ease-in-out;
  text-align: left;
}

.navbar .menu-items li {
  margin-bottom: 1.2rem;
  font-size: 1.5rem;
  font-weight: 500;
  margin-left: 35%;
}

.nav-container input[type="checkbox"]:checked ~ .menu-items {
  transform: translateX(0);
}

.nav-container input[type="checkbox"]:checked ~ .hamburger-lines .line {
  background: white;
}
</style>
