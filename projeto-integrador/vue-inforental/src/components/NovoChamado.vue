<script lang="ts">
import { Chamado } from "./Chamado";
import { ref } from "vue";
import axios from "axios";


export default {
  data() {
    return {
      todosEquipamentos: [],

      clienteData: {
        id: 0,
        cnpj: '',
        nome: '',
        alugueis: null
      },

      postData: {
        cnpj: "",
        descProblema: "",
        dataAbertura: new Date(),
        dataFechamento: null,
        Equip: {
          nSerie: "",
          descricao: "",
          categoria: "",
          statusAlugado: false,
          cliente: {
            id: 0,
            cnpj: "",
            nome: "",
            alugueis: null,
          },
        },
      },
    };
  },
  methods: {
    buscarCliente() {
      axios
        .get(`http://localhost:8080/api/cliente/${this.postData.cnpj}`)
        .then((response) => {
          this.clienteData = response.data;
          console.log(response.data);
        })
        .catch((error) => console.log(error));
    },
    buscarEquipamento(){
      console.log(this.postData.Equip)
      axios
      .get(`http://localhost:8080/api/equipamento/${this.postData.Equip}`)
        .then((response) => {
          if (response.data.cliente.alugueis === null) {
            response.data.cliente.alugueis = [];
          }
          this.postData.Equip = response.data;
          console.log(response.data);
        })
        .catch((error) => console.log(error));
    },
    enviarChamado() {
      axios
        .post("http://localhost:8080/api/chamado/abrir", this.postData)
        .then((response) => {
          alert("Chamado aberto com sucesso!");
        })
        .catch((error) => {
          alert("Erro ao criar o chamado: " + error);
        });
    },
    buscarTodosEquipamentos() {
      axios
        .get('http://localhost:8080/api/equipamento/todos')
        .then((response) => {
          this.todosEquipamentos = response.data;
        })
        .catch((error) => console.log(error));
    },
    created() {
      this.buscarTodosEquipamentos();
    },
  },
};
</script>

<template>
  <div>
    <!-- Cabeçalho com nome da empresa -->
    <header id="header">
      <div class="card">Novo Chamado</div>
      <h1 class="nome-empresa"><img src="../assets/Frame.svg">InfoRental</h1>
    </header>

    <!-- Corpo da página -->
    <form @submit.prevent="enviarChamado" @click="buscarTodosEquipamentos">
      <div id="card-form">
        <div class="titulo">
          <h1>Informe os dados abaixo</h1>
        </div>
        <!-- Input para o CNPJ -->
        <div class="grupo-form">
          <input
            id="input"
            type="text"
            v-model="postData.cnpj"
            @change="buscarCliente"
            @click="buscarTodosEquipamentos"
            placeholder="Digite o CNPJ"
          />
        </div>

        <!-- Input para selecionar equipamento -->
        <div class="grupo-form">
        <select v-model= "postData.Equip">
            <option value="" disabled selected data-default>
              Selecione o equipamento
            </option>
            <option v-for="equipamento in todosEquipamentos" :key="equipamento.nSerie" :value="equipamento.nSerie"> 
              NSerie: {{ equipamento.nSerie}}
              Cnpj: {{ equipamento.cliente.cnpj}}
            </option>
        </select>
        </div>

        <!-- Input para a descrição do problema -->
        <div class="grupo-form">
          <textarea
            v-model="postData.descProblema"
            rows="5"
            id="input"
            placeholder="Descreva o problema..."
            @change="buscarEquipamento"
          ></textarea>
        </div>

        <!-- Botão para enviar o chamado -->
        <button type="submit" class="button">Enviar</button>
      </div>
    </form>
  </div>
</template>

<style>
#header {
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  background-color: white;
  color: #0672cb;
  padding: 5px;
  display: flex;
  justify-content: space-between;
  align-items: center;
}

h1 {
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

#card-form {
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  background-color: #0672cb;
  color: white;
  padding: 20px;
  min-height: 100vh;
  display: flex;
  flex-direction: column;
  justify-content: flex-start;
  align-items: center;
}

#input {
  width: 100%;
  padding: 12px 20px;
  margin: 5px 0;
  box-sizing: border-box;
  border-radius: 5px;
  border: none;
}

#input-option {
  width: 100%;
  padding: 10px 8px;
  margin: 1px 0;
  box-sizing: border-box;
  border-radius: 5px;
  border: none;
  margin: 0 auto;
}

.titulo {
  margin-top: 50px;
}

.grupo-form {
  margin-bottom: 15px;
  flex-direction: column;
  display: flex;
}

.card {
  background-color: #0672cb;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  color: white;
  padding: 10px;
  border-radius: 5px;
  margin-left: 100px;
}

.nome-empresa {
  text-align: center;
  margin-right: 200px;
  flex-grow: 1;
}

::placeholder {
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  font-size: 12px;
}

input[type="text"] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  box-sizing: border-box;
  border-radius: 5px;
  border: none;
}

.button {
  background-color: #033259;
  border-radius: 8px;
  border-style: none;
  box-sizing: border-box;
  color: #ffffff;
  cursor: pointer;
  display: inline-block;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  font-size: 12px;
  font-weight: 500;
  height: 40px;
  line-height: 20px;
  margin: 0;
  padding: 4px 12px;
  position: relative;
  text-align: center;
  touch-action: manipulation;
}

.button:hover,
.button:focus {
  background-color: #054982;
}

select {
  font-size: 12px;
  text-align: left;
}
</style>
