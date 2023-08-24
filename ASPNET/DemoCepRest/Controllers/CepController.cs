//classe de controle p/ gerenciar ações das operações com CEPs definidas em cada rota

namespace DemoCepRest.Controllers;

//habilita os demais diretórios do projeto + recursos MVC e CORS
using Microsoft.AspNetCore.Mvc;
using DemoCepRest.Services;
using DemoCepRest.Models;
using DemoCepRest.DTOs;
using Microsoft.AspNetCore.Cors;

//indica que esta classe é um controller de API
[ApiController]

//define o prefixo da rota para as ações
[Route("api/v1/cep")]

//p/ as origens permitidas pela política definida em "Program" acessem as ações deste controlador
[EnableCors("PermiteTudo")]
public class CepController : ControllerBase
{
    //injeção de dependências no construtor, permite que as classes obtenham de fora outros objetos q precisam usar, em vez de criar internamente
    //'ILogger' é usado para registrar informações, avisos e erros durante a execução do app
    private readonly ILogger<CepController> _logger;
    private readonly ICepRepository _cepRepository;

    //construtor recebe uma instância de ILogger e ICepRepository que serão injetados automaticamente obtendo os serviços necessários
    public CepController(ILogger<CepController> logger, ICepRepository cepRepository)
    {
        _logger = logger;
        _cepRepository = cepRepository;
    }

    //método de ação para a rota GET sem parâmetros .../api/v1/cep
    [HttpGet]
    //o IEnumerable define como retorno do método um conjunto de objetos do tipo CepDTO
    public IEnumerable<CepDTO> GetTodos()
    {
        //consulta todos os CEPs no repositório e transforma em DTOs(objeto p/transferir dados)
        return _cepRepository.ConsultarTodos()
               .OrderBy(c => c.Cidade)
               .Select(c => CepModel.ParaDTO(c))
               .ToList();
    }

    //método de ação para a rota GET usando expressão regular .../api/v1/cep/90619900
    [HttpGet("{codigocep:regex(^\\d{{8}}$)}")]
    //'ActionResult' é uma classe base para retornar várias possíveis respostas HTTP (OK, NotFound, etc). O parâmetro 'codigocep' será o próprio cep digitado ao final da url
    public ActionResult<CepDTO> GetPorCodigo(string codigocep)
    {
        //consulta CEP específico no repo e retorna um DTO correspondente
        var cep = _cepRepository.ConsultarPorCodigoCep(codigocep);
        if (cep == null)
        {
            return NotFound();
        }
        return CepModel.ParaDTO(cep);
    }

    //método de ação para a rota POST com os dados do CEP no corpo da requisição .../api/v1/cep
    [HttpPost]
    //o próprio ASP.NET mapeia os dados recebidos para o parâmetro cepDto automaticamente
    public ActionResult<CepDTO> Post(CepDTO cepDto)
    {
        //verifica se o CEP já existe na base de dados
        CepModel? cepAtual = _cepRepository.ConsultarPorCodigoCep(cepDto.Cep);
        if (cepAtual != null) {
            //Mensagem de falha
            return Problem("Cep já existe na base de dados");
        }
        //cadastra novo CEP no repositório e retorna o DTO correspondente
        CepModel cepNovo = _cepRepository.Cadastrar(CepModel.ParaModel(cepDto));
        return CreatedAtAction(nameof(GetPorCodigo), new {codigoCep = cepNovo.Cep}, CepModel.ParaDTO(cepNovo));
    }
}