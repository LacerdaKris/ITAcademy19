//ponto de entrada da aplicação. É responsável por construir e configurar o host da web

//inclui o uso dos arquivos em "services"
using DemoCepRest.Services;

//cria um objeto, args p/ aceitar argumentos de linha de comando durante a execução do app
var builder = WebApplication.CreateBuilder(args);

//serviço de política CORS sendo definida, permitindo qualquer origem, método e cabeçalho
builder.Services.AddCors(options => {
    options.AddPolicy("PermiteTudo", policy => {
        policy.AllowAnyOrigin()
              .AllowAnyMethod()
              .AllowAnyHeader();
    });
});

//o serviço ICepRepository é registrado. Singleton é criado apenas uma vez e compartilhado entre todas as solicitações. CepRepositoryMemory é o repositório de memória para lidar com informações de CEP
builder.Services.AddSingleton<ICepRepository, CepRepositoryMemory>();

//controladores p/ lidar com as solicitações HTTP e retornar respostas apropriadas
builder.Services.AddControllers();

//serviços p/ geração automática de documentação interativa para os endpoints da API. Descreve as rotas, parâmetros e respostas
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//cria a instância da aplicação web
var app = builder.Build();

//configura o pipeline da requisição HTTP.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.UseCors();

app.UseAuthorization();

app.MapControllers();

//o app é executado e começa a aguardar solicitações HTTP
app.Run();
