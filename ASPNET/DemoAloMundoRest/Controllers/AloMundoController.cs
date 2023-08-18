using DemoAloMundoRest.DTOs;
using Microsoft.AspNetCore.Mvc;

namespace DemoAloMundoRest.Controllers;

//atributo para regras de roteamento e variaveis de roteamento
[ApiController]
//rota com template para uma string que diz:se a url https://meuservidor/alomundo for acessada deve acessar a rota para esta classe
//[Route("alomundo")]   ou pelas regras padrão de convenção de nomes considera td q está escrioto antes de Controller no nome da classe
[Route("[controller]")]

//herda da classe base para controladores q implementam serviços do tipo rest
public class AloMundoController : ControllerBase
{
    //propriedade apenas p/ leitura com log do que está acontecendo
    private readonly ILogger<AloMundoController> _logger;
    //CONSTRUTOR, ponto injetor de dependencias do framework p/ criar o objeto
    public AloMundoController(ILogger<AloMundoController> logger)
    {
        _logger = logger;
    }

    //metodos para responder a requisição HTTP (pode ser get,put,post,delete,head,patch,etc)
    [HttpGet]
    public string Get()
    {
        _logger.LogInformation("GET/alomundo");
        return "Alô, Mundo!";
    }

    //roteamento GET com variavel .../servidor/alomundo/nomeQueForDigitado no url
    [HttpGet("{meuNome}")]
    public string Get(string meuNome)
    {
        _logger.LogInformation("GET/alomundo/{meuNome}");
        return $"Alô, {meuNome}!";
    }   

    //.../alomundo/query?nome=kris  (pode passar varios valores)
    [HttpGet("query")]
    public string GetQuery(string nome)
    {
        _logger.LogInformation("GET/alomundo/query?nome=valor");
        return $"Alô por query, {nome}!";
    }

    //POST com valor da variavel vinda do corpo .../alomundo
    [HttpPost]
    public string Post([FromBody] string name)
    {
        _logger.LogInformation("POST/alomundo");
        return $"Alô post do tipo json, {name}!";
    }

    //POST com um objeto da classe pessoa .../alomundo/pessoa
    [HttpPost("pessoa")]
    public string Post(Pessoa umaPessoa)
    {
        _logger.LogInformation("POST/alomundo/pessoa");
        _logger.LogInformation($"umaPessoa.Nome = {umaPessoa.Nome}");
        _logger.LogInformation($"umaPessoa.Idade = {umaPessoa.Idade}");
        return $"Alô post com objeto, {umaPessoa.Nome}!";
    }
}
