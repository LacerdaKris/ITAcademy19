namespace InfoRental.Controllers;

using Microsoft.AspNetCore.Mvc;
using InfoRental.Services;
using InfoRental.Models;
using InfoRental.Dtos;

[ApiController]
[Route("api/[controller]")]
public class ClienteController : ControllerBase
{
    private readonly IClienteRepository _clientesRepository;

    public ClienteController(IClienteRepository clientesRepository)
    {
        _clientesRepository = clientesRepository;
    }

    //GET .../api/cliente/cnpj
    [HttpGet("{cnpj}")]
    public async Task<ActionResult<ClienteDTO>> GetPorCnpj(CnpjRequisicaoDTO cnpj)
    {
    if (string.IsNullOrEmpty(cnpj.cnpjCliente))
    {
        return BadRequest("CNPJ é obrigatório.");
    }

    var cliente = await _clientesRepository.ConsultarPorCnpjAsync(cnpj.cnpjCliente);

    if (cliente == null)
    {
        return NotFound("Cliente não encontrado.");
    }
    return ClienteDTO.DeModelParaDTOComAlugueis(cliente);
}
}

