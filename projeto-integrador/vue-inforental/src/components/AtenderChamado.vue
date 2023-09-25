<script setup lang="ts">
import { ref, onMounted, watch } from "vue";
import axios from "axios";
import { Chamado } from "./Chamado";

//começar com opção manutenção, e depois poder armazenar por qual equipamento trocar
const tipoSolucao = ref("opcao1");
const equipamentoSelecionado = ref("");

//ID do chamado a ser fechado e descrição da solução
const chamadoSelecionado = ref("");
const descricaoSolucao = ref("");

//carregar e armazenar os chamados da API p/ aparecer nas opções do select
const chamados = ref([]);
async function carregarChamados() {
  try {
    const response = await axios.get(
      "http://localhost:8080/api/chamado/abertos"
    );
    chamados.value = response.data;
  } catch (error) {
    console.error("Erro ao carregar os chamados:", error);
  }
}
onMounted(() => {
  carregarChamados();
});

//carregar e armazenar os equipamentos da API p/ aparecer nas opções do select
const equipamentos = ref([]);
async function carregarEquipamentos() {
  try {
    const response = await axios.get(
      "http://localhost:8080/api/equipamento/todos"
    );
    equipamentos.value = response.data;
  } catch (error) {
    console.error("Erro ao carregar os equipamentos:", error);
  }
}
onMounted(() => {
  carregarEquipamentos();
});

// Função para carregar os detalhes do chamado selecionado
const dataAbertura = ref("");
const descProblema = ref("");
const cnpj = ref("");
const equip = ref("");
async function carregarDetalhesChamado() {
  try {
    if (chamadoSelecionado.value) {
      const response = await axios.get(
        `http://localhost:8080/api/chamado/${chamadoSelecionado.value}`
      );
      const chamado = response.data;
      dataAbertura.value = chamado.dataAbertura;
      descProblema.value = chamado.descProblema;
      cnpj.value = chamado.cnpj;
      equip.value = chamado.cnpj;
    }
  } catch (error) {
    console.error("Erro ao carregar os detalhes do chamado:", error);
  }
}

// Chame esta função quando o chamado selecionado mudar
onMounted(() => {
  carregarChamados();
});

// Assista às mudanças no chamadoSelecionado e chame carregarDetalhesChamado
watch(chamadoSelecionado, () => {
  carregarDetalhesChamado();
});

//para fechar o chamado
async function fecharChamado() {
  try {
    if (!chamadoSelecionado.value || !descricaoSolucao.value) {
      console.error("Chamado e descrição da solução são obrigatórios");
      return;
    }

    console.log(chamadoSelecionado);

    const getPorId = await axios.get(
      `http://localhost:8080/api/chamado/${chamadoSelecionado.value}`
    );
    const chamadoId = getPorId.data;

    const requestBody = {
      id: chamadoId.id,
      cnpj: chamadoId.cnpj,
      dataAbertura: chamadoId.dataAbertura,
      dataFechamento: null,
      equip: {
        nSerie: chamadoId.equip.nSerie,
        descricao: chamadoId.equip.descricao,
        categoria: chamadoId.equip.categoria,
        statusAlugado: false,
        cliente: {
          id: chamadoId.equip.cliente.id,
          cnpj: chamadoId.equip.cliente.cnpj,
          nome: chamadoId.equip.cliente.nome,
          alugueis: [],
        },
        idCliente: chamadoId.equip.idCliente,
      },
      descProblema: chamadoId.descProblema,
      descSolucao: descricaoSolucao.value,
      status: true,
    };

    console.log(requestBody);
    const response = await axios.put(
      "http://localhost:8080/api/chamado/fechar",
      requestBody
    );

    alert("Chamado fechado com sucesso!");

    // Após o fechamento do chamado, atualize a lista de chamados
    await atualizarListaChamados();
  } catch (error) {
    alert("Erro ao fechar o chamado.");
  }
}

//para atualizar a lista de chamados após o fechamento
async function atualizarListaChamados() {
  try {
    const response = await axios.get(
      "http://localhost:8080/api/chamado/abertos"
    );
    chamados.value = response.data;
  } catch (error) {
    console.error("Erro ao atualizar a lista de chamados:", error);
  }
}
</script>

<template>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" />
  <link
    href="https://fonts.googleapis.com/css2?family=Roboto:wght@100&display=swap"
    rel="stylesheet"
  />

  <!-- Cabeçalho com nome da empresa -->
  <header id="header">
    <div class="card">Atender Chamado</div>
    <h1 class="nome-empresa"><img src="../assets/Frame.svg" /> InfoRental</h1>
  </header>
  <div class="atender-chamado">
    <!-- Input para selecionar o chamado a ser fechado -->
    <div class="grupo-form">
      <select v-model="chamadoSelecionado" id="input">
        <option value="" disabled selected data-default>
          Selecione o chamado
        </option>
        <option
          v-for="chamado in chamados"
          :key="chamado.id"
          :value="chamado.id"
        >
          {{ chamado.id }}
        </option>
      </select>
    </div>

    <!-- mostra data e descrição do problema -->
    <div class="grupo-form">
      <p id="data-abertura">
        Data de abertura: {{ dataAbertura.split("T")[0] }}
      </p>
      <textarea v-model="descProblema" placeholder="Descrição do problema:">{{
        descProblema
      }}</textarea>
    </div>

    <!-- Seleção de tipo da solução -->
    <div class="grupo-form">
      <div>
        <label>
          <input
            type="radio"
            name="opcao"
            value="opcao1"
            v-model="tipoSolucao"
          />
          Manutenção
          <input
            type="radio"
            name="opcao"
            value="opcao2"
            v-model="tipoSolucao"
          />
          Substituição
        </label>
      </div>
    </div>

    <!-- Campo de seleção para o equipamento (aparece apenas quando "opcao2" é selecionada) -->
    <div
      class="grupo-form"
      id="equipamento-troca"
      v-if="tipoSolucao === 'opcao2'"
    >
      <select v-model="equipamentoSelecionado" id="input">
        <option value="" disabled selected data-default>
          Selecione o equipamento
        </option>
        <option
          v-for="equipamento in equipamentos"
          :key="equipamento.nSerie"
          :value="equipamento.nSerie"
        >
          {{ equipamento.nSerie }}
        </option>
      </select>
    </div>

    <!-- Input para a descrição da solução -->
    <div class="grupo-form" id="descricao-solucao">
      <textarea
        v-model="descricaoSolucao"
        placeholder="Descrição da solução:"
      ></textarea>
    </div>

    <!-- Botão para fechar o chamado -->
    <div class="vertical-center">
      <button @click="fecharChamado" class="button">Fechar Chamado</button>
    </div>
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

.atender-chamado {
  /* modifiquei para ficar apenas a cor de fundo (os tamanhos estavam alterando os demais itens) */
  background-color: #0672cb;
  align-items: center;
}

#descricao-solucao {
  /* ajustei isso */
  height: 100%;
  margin-top: 20px;
}

#data-abertura {
  text-align: left;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

#input {
  /* modificado */
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

.button {
  /* Acrescentei isso */
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
  margin: 0 auto;
}

.button:hover,
.button:focus {
  /* Acrescentei isso */
  background-color: #054982;
}

.grupo-form {
  margin-bottom: 20px;
  flex-direction: column;
  display: flex;
  color: white;
  font-family: "Roboto";
  margin: 0 auto;
  text-align: center;
  width: 50%;
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

select {
  /* Acrescentei isso */
  margin-top: 50px;
  height: 35px;
  border-radius: 6px;
  font-size: 12px;
  text-align: left;
  padding-left: 10px;
}

textarea {
  /* Acrescentei isso */
  margin-bottom: 20px;
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
  height: 100px;
  padding: 12px 20px;
  border-radius: 4px;
  border: none;
  resize: none;
}

label {
  /* Acrescentei isso */
  font-family: "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
}

.vertical-center {
  /* Acrescentei isso */
  display: flex;
  justify-content: center;
  align-items: center;
  margin-top: 20px;
  margin-bottom: 60px;
}

input[type="radio"] {
  accent-color: rgb(18, 50, 119);
}
</style>
