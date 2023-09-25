namespace InfoRental.Services;

using Microsoft.EntityFrameworkCore;
using InfoRental.Models;

public interface IChamadoRepository
{
    Task<List<Chamado>?> ConsultarAbertosAsync();
    Task<int> ConsultarQtdAbertosAsync();
    Task<int> ConsultarQtdFechadosAsync();
    Task<List<Object>> ConsultarPorCategoriaAsync();
    Task<List<Chamado>?> ConsultarTodosAsync();
    Task<Chamado?> ConsultarPorIdAsync(int id);
    Task<Chamado?> AdicionarAsync(Chamado chamado);
    Task<Chamado> FecharAsync(Chamado chamado);
}
