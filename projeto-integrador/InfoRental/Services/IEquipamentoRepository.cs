namespace InfoRental.Services;

using InfoRental.Models;

public interface IEquipamentoRepository
{
    Task<IEnumerable<Equipamento>> ConsultarTodosEquipamentos();
    Task<Equipamento?> ConsultarPorNSerie(string nSerie);
    Task<IEnumerable<Equipamento>> ConsultarPorCliente(int id);
}
