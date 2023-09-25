<script setup lang="ts">
import { ref } from 'vue';
const qtdChamadosAbertos = ref('');
const qtdChamadosFechados = ref('');
const listaEquipamentos = ref([]);
interface Lista {
    categoria: string,
    qtd: number
}
async function fetchData() {
    try {
        const qtdAbertos = await fetch('http://localhost:8080/api/chamado/qtdAbertos');
        const jsonAbertos = await qtdAbertos.json();
        const qtdFechados = await fetch('http://localhost:8080/api/chamado/qtdFechados');
        const jsonFechados = await qtdFechados.json();
        const listaChamados = await fetch('http://localhost:8080/api/chamado/categoria');
        const jsonLista = await listaChamados.json();
        qtdChamadosAbertos.value = jsonAbertos;
        qtdChamadosFechados.value = jsonFechados;
        listaEquipamentos.value = jsonLista;

    } catch (error) {
        console.error(error);
    }
};
await fetchData();

</script>

<template>
    <div>
        <!-- Cabeçalho com nome da empresa -->
        <header id="header">
            <div class="card">Home</div>
            <h1 class="nome-empresa"><img src="../assets/Frame.svg"> InfoRental</h1> <!-- acrescentei a logo -->
        </header>

        <body>
            <div class="home">
                <div class="cardAbertoFechado">
                    <div class="divAbertoFechado">
                        <span>{{qtdChamadosAbertos }}</span>
                        <label> Chamados Abertos</label>
                    </div>
                    <div class="divAbertoFechado">
                        <span>{{ qtdChamadosFechados }}</span>
                        <label>Chamados Fechados</label>
                    </div>
                </div>
                <table id="chamadosHome">
                    <thead>
                        <tr>
                            <th>Quantidade de Chamados por Equipamento</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr v-for="group in listaEquipamentos">
                            <td>{{ (group as Lista).categoria }}</td>
                            <td>{{ (group as Lista).qtd }}</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </body>
    </div>
</template>

<style>
#header {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background-color: white;
    color: #0672cb;
    padding: 5px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.home {
    display: flex;
    justify-content: space-evenly;
    align-items: center;
    width: 100vw;
    gap: 30px;
}

.cardAbertoFechado {
    display: flex;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    /* Adicionei a fonte */
    text-align: center;
    justify-content: space-around;
    flex-direction: column;
    gap: 40px;
}

.divAbertoFechado {
    display: flex;
    justify-content: space-between;
    /* ajuster pra center para ficar centralizado */
    align-items: center;
    background-color: #0672cb;
    color: white;
    height: 30px;
    padding: 10px;
    float: left;
    width: 200px;
    box-shadow: 0px 0px 10px #909192;
}

#chamadosHome {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    border-collapse: collapse;
    box-shadow: 0px 0px 10px #909192;
    width: 30%;
}

#chamadosHome td,
#chamadosHome th {
    border: 1px solid #ddd;
    padding: 8px;
}

#chamadosHome tr:nth-child(even) {
    background-color: #f2f2f2;
}

#chamadosHome tr:hover {
    background-color: #ddd;
}

#chamadosHome thead {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #0672CB;
    color: #FFFFFF;
}

#chamadosHome tbody {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #FFFFFF;
    color: black;
}

.card {
    background-color: #0672cb;
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
</style>