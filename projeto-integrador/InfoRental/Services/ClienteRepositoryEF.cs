namespace InfoRental.Services;

using Microsoft.EntityFrameworkCore;
using InfoRental.Models;

public class ClientesRepositoryEF : IClienteRepository
{
    private readonly InfoRentalContext _context;

    public ClientesRepositoryEF(InfoRentalContext context)
    {
        _context = context;
    }

    public async Task<Cliente?> ConsultarPorCnpjAsync(string cnpj)
    {
        //return await _context.Clientes.FindAsync(cnpj);
        Cliente cliente = await _context.Clientes.Where(c => c.Cnpj == cnpj).FirstOrDefaultAsync();

        return cliente;
    }
}
