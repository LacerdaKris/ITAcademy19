namespace InfoRental.Controllers;

using Microsoft.AspNetCore.Mvc;
using InfoRental.Services;
using InfoRental.Models;
using InfoRental.Dtos;
using Microsoft.AspNetCore.Cors;

[ApiController]
[Route("api/[controller]")]
[EnableCors("AcessoCors")]
public class EquipamentoController : ControllerBase
{
    private readonly IEquipamentoRepository _equipamentosRepository;

    public EquipamentoController(IEquipamentoRepository equipamentosRepository)
    {
        _equipamentosRepository = equipamentosRepository;
    }

   //GET .../api/equipamento/todos
    [HttpGet("todos")]
    public async Task<IEnumerable<EquipamentoDTO>> GetTodosEquipamentos()
    {
        var equipamentos = await _equipamentosRepository.ConsultarTodosEquipamentos();
        return equipamentos.Select(e => EquipamentoDTO.DeModelParaDTO(e));
    }

    //GET .../api/equipamento/nSerie
    [HttpGet("{nSerie}")]
    public async Task<ActionResult<EquipamentoDTO>> GetPorNSerie(string nSerie)
    {
        var equipamentos = await _equipamentosRepository.ConsultarPorNSerie(nSerie);
        if (equipamentos == null)
        {
            return NotFound();
        }
        return EquipamentoDTO.DeModelParaDTO(equipamentos);
    }

    /*[HttpGet("{id}")]
    public async Task<ActionResult<EquipamentoDTO>> GetPorId(int id)
    {
        var equipamentos = await _equipamentosRepository.ConsultarPorCliente(id);
        return equipamentos.Select(e => EquipamentoDTO.DeModelParaDTO(e));
        
    }*/


}
