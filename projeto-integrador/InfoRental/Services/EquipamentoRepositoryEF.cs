namespace InfoRental.Services;

using Microsoft.EntityFrameworkCore;
using InfoRental.Models;
using System.Threading.Tasks;
using System.Collections.Generic;

public class EquipamentoRepositoryEF : IEquipamentoRepository
{
    private readonly InfoRentalContext _contextEquipamento;

    public EquipamentoRepositoryEF(InfoRentalContext context)
    {
        _contextEquipamento = context;
    }

    public async Task<IEnumerable<Equipamento>> ConsultarTodosEquipamentos()
    {
        // irá ordernar pela categoria do equipamento
        return await _contextEquipamento.Equipamentos
            .OrderBy(e => e.Categoria)
            .Include(c => c.Cliente)
            .ToListAsync();
    }

    public async Task<Equipamento?> ConsultarPorNSerie(string nSerie)
    {
        return await _contextEquipamento.Equipamentos
            .Include(c => c.Cliente)
            .FirstOrDefaultAsync(c => c.NSerie == nSerie);
    }

    public async Task<IEnumerable<Equipamento>> ConsultarPorCliente(int id)
    {
        // irá ordernar pela categoria do equipamento
        return await _contextEquipamento.Equipamentos
            .Where(e => e.IdCliente == id)
            .OrderBy(e => e.Categoria)
            .Include(c => c.Cliente)
            .ToListAsync();
    }

}
