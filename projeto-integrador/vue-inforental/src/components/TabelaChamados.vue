<script setup lang="ts">

    import {ref} from 'vue';

    const chamadosAbertos = ref([]);

    // Carregar os dados do banco
    fetch("http://localhost:8080/api/chamado/abertos")
    .then((response) => response.json())
    .then((data) => {
        chamadosAbertos.value = data;
    });
</script>

<template> 
    <body>
        <!--aqui esta a tabela de chamados-->
        <table id="chamados" class="center">
            <thead>
                <tr>
                    <th>Data</th>
                    <th>ID chamado</th>
                    <th>Equipamento</th>
                    <th>Cliente</th>
                    <th>Descrição</th>

                </tr>
            </thead>
            <tbody>
                <!-- Tabela populada dinamicamente pelo fetch -->
                <tr v-for="(chamado, index) in chamadosAbertos" :key="index">
                    <td>{{ chamado.dataAbertura.split('T')[0] }}</td>
                    <td>{{ chamado.id }}</td>
                    <td>{{ chamado.equip.categoria }}</td>
                    <td>{{ chamado.equip.cliente.nome }}</td>
                    <td>{{ chamado.descProblema }}</td>
                </tr>
            </tbody>
        </table>
    </body>
</template>

<style>
#chamados td,
#chamados th {
    border: 1px solid #ddd;
    padding: 8px;
}

#chamados tr:nth-child(even) {
    background-color: #f2f2f2;
}

#chamados tr:hover {
    background-color: #ddd;
}

#chamados thead {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #0672CB;
    color: #FFFFFF;
}

#chamados tbody {
    padding-top: 12px;
    padding-bottom: 12px;
    text-align: center;
    background-color: #FFFFFF;
    color: black;
}

#chamados {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    border-collapse: collapse;
    border-style: hidden;
    width: 70%;
}

.center {

    margin-left: auto;
    margin-right: auto;
}
</style>