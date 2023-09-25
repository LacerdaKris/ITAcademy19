namespace InfoRental.Services;

using InfoRental.Models;

public interface IClienteRepository
{
    Task<Cliente?> ConsultarPorCnpjAsync(string cnpj);
}
