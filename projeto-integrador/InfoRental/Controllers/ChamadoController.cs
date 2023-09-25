namespace InfoRental.Controllers;

using Microsoft.AspNetCore.Mvc;
using InfoRental.Services;
using InfoRental.Models;
using InfoRental.Dtos;
using Microsoft.AspNetCore.Cors;

[ApiController]
[Route("api/[controller]")]
[EnableCors("AcessoCors")]
public class ChamadoController : ControllerBase
{
    private readonly IClienteRepository _clientesRepository;
    private readonly IChamadoRepository _chamadosRepository;
    private readonly IEquipamentoRepository _equipamentosRepository;

    public ChamadoController(
        IClienteRepository clientesRepository,
        IChamadoRepository chamadosRepository,
        IEquipamentoRepository equipamentoRepository
    )
    {
        _clientesRepository = clientesRepository;
        _chamadosRepository = chamadosRepository;
        _equipamentosRepository = equipamentoRepository;
    }

    //GET .../api/chamado/abertos
    [HttpGet("abertos")]
    public async Task<ActionResult<IEnumerable<ChamadoDTO>>> GetChamadosAbertos()
    {
        List<Chamado>? chamados = await _chamadosRepository.ConsultarAbertosAsync();
        if (chamados.Count == 0)
        {
            return NotFound();
        }
        List<ChamadoDTO> chamadosAbertos = new List<ChamadoDTO>();
        foreach (var item in chamados)
        {
            chamadosAbertos.Add(ChamadoDTO.DeModelParaDTO(item));
        }
        return chamadosAbertos;
    }

    //GET .../api/chamado/qtdAbertos
    [HttpGet("qtdAbertos")]
    public async Task<ActionResult<int>> GetQtdChamadosAbertos()
    {
        return await _chamadosRepository.ConsultarQtdAbertosAsync();
    }

    //GET .../api/chamado/qtdFechados
    [HttpGet("qtdFechados")]
    public async Task<ActionResult<int>> GetQtdChamadosFechados()
    {
        return await _chamadosRepository.ConsultarQtdFechadosAsync();
    }

    //GET .../api/chamado/todos
    [HttpGet("todos")]
    public async Task<ActionResult<IEnumerable<ChamadoDTO>>> GetTodosChamados()
    {
        List<Chamado>? chamados = await _chamadosRepository.ConsultarTodosAsync();
        if (chamados.Count == 0)
        {
            return NotFound();
        }
        List<ChamadoDTO> todosChamados = new List<ChamadoDTO>();
        foreach (var item in chamados)
        {
            todosChamados.Add(ChamadoDTO.DeModelParaDTO(item));
        }
        return todosChamados;
    }

    //GET .../api/chamado/categoria
    [HttpGet("categoria")]
    public async Task<List<Object>> GetPorCategoria()
    {
        var chamadosCategoria = await _chamadosRepository.ConsultarPorCategoriaAsync();
        return chamadosCategoria;
    }

    //GET .../api/chamado/id
    [HttpGet("{id:int}")]
    public async Task<ActionResult<ChamadoDTO>> GetChamadoPorID(int id)
    {
        var chamado = await _chamadosRepository.ConsultarPorIdAsync(id);
        if (chamado == null)
        {
            return NotFound();
        }
        return ChamadoDTO.DeModelParaDTO(chamado);
    }

    //POST .../api/chamado/abrir
    [HttpPost("abrir")]
    public async Task<ActionResult<ChamadoDTO>> AbrirChamado([FromBody] ChamadoDTO aberturaChamado)
    {
        // Verifique se o cliente (por CNPJ) existe
        var cnpj = await _clientesRepository.ConsultarPorCnpjAsync(aberturaChamado.Cnpj);
        if (cnpj == null)
        {
            return Problem("CNPJ não existe na base de dados");
        }

        var equip = await _equipamentosRepository.ConsultarPorNSerie(aberturaChamado.Equip.NSerie);
        if (equip == null)
        {
            return Problem("O equipamento não existe na base de dados");
        }

        Chamado chamado = new Chamado();
        chamado.DataAbertura = DateTime.Now;
        chamado.DataFechamento = null;
        chamado.NSerie = equip.NSerie;
        chamado.Equip = equip;
        chamado.DescProblema = aberturaChamado.DescProblema;
        chamado.DescSolucao = null;
        chamado.Status = aberturaChamado.Status;

        //aberturaChamado.DataAbertura = DateTime.Now;
        //aberturaChamado.Equip.IdCliente = cnpj.Id;
        var novoChamado = await _chamadosRepository.AdicionarAsync(chamado);

        return CreatedAtAction(
            nameof(GetChamadoPorID),
            new { id = novoChamado.Id },
            ChamadoDTO.DeModelParaDTO(novoChamado)
        );
    }

    //PUT .../api/chamado/fechar
    [HttpPut("fechar")]
    public async Task<ActionResult<ChamadoDTO>> FecharChamado(
        [FromBody] ChamadoDTO fechamentoChamado
    )
    {
        var chamado = await _chamadosRepository.ConsultarPorIdAsync(fechamentoChamado.Id);
        if (chamado == null)
        {
            return NotFound();
        }

        chamado.DataFechamento = DateTime.Now;
        chamado.DescSolucao = fechamentoChamado.DescSolucao;
        chamado.Status = fechamentoChamado.Status;

        await _chamadosRepository.FecharAsync(chamado);
        return CreatedAtAction(
            nameof(FecharChamado),
            new { id = fechamentoChamado.Id },
            ChamadoDTO.DeModelParaDTO(chamado)
        );
    }
}
