namespace InfoRental.Services;

using Microsoft.EntityFrameworkCore;
using InfoRental.Models;
using System.Threading.Tasks;

class ChamadoRepositoryEF : IChamadoRepository
{
    private readonly InfoRentalContext _context;

    public ChamadoRepositoryEF(InfoRentalContext context)
    {
        _context = context;
    }

    //dados que deve ser listados na lista de chamados abertos: data, id, desc e equip.
    public async Task<List<Chamado>?> ConsultarAbertosAsync()
    {
        return await _context.Chamados
            .Where(c => c.Status == false)
            .OrderByDescending(c => c.DataAbertura.Year)
            .ThenByDescending(c => c.DataAbertura.Month)
            .ThenByDescending(c => c.DataAbertura.Day)
            .Include(c => c.Equip)
            .Include(c => c.Equip.Cliente)
            .ToListAsync();
    }

    public async Task<int> ConsultarQtdAbertosAsync()
    {
        return await _context.Chamados.Where(c => c.Status == false).CountAsync();
    }

    public async Task<int> ConsultarQtdFechadosAsync()
    {
        return await _context.Chamados.Where(c => c.Status == true).CountAsync();
    }

    public async Task<List<Object>> ConsultarPorCategoriaAsync()
    {
        var listSemObject = await _context.Chamados
            .Include(c => c.Equip)
            .GroupBy(c => c.Equip.Categoria)
            .Select(c => new { categorias = c.Key, qtds = c.Count() })
            .ToListAsync();
        List<Object> lista = new List<object>();
        foreach (var item in listSemObject)
        {
            lista.Add(new { categoria = item.categorias, qtd = item.qtds });
        }
        return lista;
    }

    public async Task<List<Chamado>?> ConsultarTodosAsync()
    {
        return await _context.Chamados
            .Include(c => c.Equip)
            .Include(c => c.Equip.Cliente)
            .ToListAsync();
    }

    public async Task<Chamado?> ConsultarPorIdAsync(int id)
    {
        return await _context.Chamados
            .Include(c => c.Equip)
            .Include(c => c.Equip.Cliente)
            .FirstOrDefaultAsync(c => c.Id == id);
    }

    public async Task<Chamado?> AdicionarAsync(Chamado chamado)
    {
        await _context.Chamados.AddAsync(chamado);
        await _context.SaveChangesAsync();
        return chamado;
    }

    public async Task<Chamado> FecharAsync(Chamado chamado)
    {
        await _context.SaveChangesAsync();
        return chamado;
    }
}
