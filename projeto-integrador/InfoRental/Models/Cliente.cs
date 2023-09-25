namespace InfoRental.Models;

public class Cliente
{
    public int Id { get; set; }
    public string Cnpj { get; set; } = null!;
    public string Nome { get; set; } = null!;

    //relacionamento 1-N com Equipamento
    public List<Equipamento> Alugueis { get; set; } = null!;
}
