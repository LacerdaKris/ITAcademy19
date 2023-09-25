# Projeto integrador

Exercício de integração da turma 19 do It Academy (PUCRS+DELL), consiste em criar uma aplicação com 4 funcionalidades obrigatórias utilizando todas as tecnologias aprendidas durante o treinamento:
**C#, Asp .NET, Entity Framework, SQL Server, JavaScript/TypeScript, HTML, CSS, e Vue.js**

## Contexto

Uma empresa aluga equipamentos de informática para outras empresas clientes, a qual nomeamos como InfoRental.

**Tabelas de dados**

- Cliente:
  Cada empresa cliente deve ter cnpj, nome e alugueis, para poder armazenar um ou mais equipamentos alugados.
- Equipamento:
  Cada equipamento deve ter um número de série, descrição, categoria (roteadores, impressoras, notebooks, etc.) e status (se está locado ou não).
- Chamado:
  Cada manutenção deve ter um Id de identificação, data de sua criação, número de série do equipamento, descrição do problema, status (aberto ou fechado), tipo de solução (conserto ou substituição), descrição da solução e data de fechamento.

**Funcionalidades**

- a) Abrir um novo chamado informando o CNPJ e selecionando entre os equipamentos locados.
- b) Atender um chamado aberto (quem atender marca se apenas conserta ou substitui o equipamento).
  > Opcional b.1) Se substituição, trocar no banco de dados por outro equipamento disponível.
- c) Listar chamados abertos do mais antigo ao mais novo.
- d) Dashboard contendo total de chamados abertos, fechados, e a quantidade de chamados por categoria de equipamentos.

**Requisitos**

- As empresas clientes podem abrir chamados de manutenção.
- Cada chamado pega data atual como abertura, no fechamento também armazena a data e altera o status.
- Aplicação deve começar com pelo menos 5 clientes, e 3 equipamentos cada um.

## Equipes

Considerando que somos 20, e nosso estágio é em 2 turnos de horários, decidimos nos dividir em 4 times, onde cada um contivesse pelo menos; uma aluna da PUC (caso houver necessidade de reunião presencial) e uma que já possua familiaridade com front end.
Ficou distribuído da seguinte forma, sendo times 1 e 2 do primeiro turno, 3 e 4 do segundo:

| 1             | 2                | 3               | 4                |
| ------------- | ---------------- | --------------- | ---------------- |
| Ana Xavier    | K.Cristine       | Gabriele        | Fe. Franceschini |
| Fe. Oliveira  | Luana            | Letícia         | Milena           |
| Carol Kowaluk | Eduarda Loureiro | Edissa          | Fe. Souza        |
| Laura         | Ana Moura        | Carol Mattiello | Andressa         |
| Veronica      | Mariana          | Maria Eduarda   | Vitória          |

## Links Documentação

- Cards contendo as tarefas executadas por cada equipe:
  [IT Academy 19 - Exercício Integrador | Trello](https://trello.com/b/Dw72C0f8/it-academy-19-exerc%C3%ADcio-integrador)
- Repositório com a Main principal e todos os commits originais do time:
  [Repositório InfoRental | GitHub](https://github.com/gabicolares/integrador-19)
- Diagrama do banco de dados:
  [IT Academy19 | DB Designer](https://erd.dbdesigner.net/designer/schema/1692905592-it-academy19)
- Diagrama de classes:
  [UML Class | Miro](https://miro.com/app/board/uXjVMjC_kUw=/?share_link_id=336899286270)
- Protótipo do front:
  [Projeto Integrador | Figma](https://www.figma.com/file/KBOviyyc5qhqAzBZ8K933v/Projeto-Integrador-team-library?type=design&node-id=2311-3&mode=design&t=TmR2amluf0IM38Ky-0)

## Comandos para rodar o projeto localmente

Execute um de cada vez:

- cd Inforental
- dotnet ef database update
- No arquivo InfoRentalContext.cs da pasta Services, apagar as duas barras para descomentar o //AdicionarDadosIniciais(), e rodar o comando novamente: dotnet ef database update
- dotnet run
- Novo terminal...
- cd vue-inforental
- npm install
- npm run dev
