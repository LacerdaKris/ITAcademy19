namespace InfoRental.Models;

public class Chamado
{
    public int Id { get; set; }
    public DateTime DataAbertura { get; set; } = DateTime.Now;
    public DateTime? DataFechamento { get; set; }
    public string NSerie { get; set; } = null!;

    //relacionamento 1-1 com Equipamento
    public Equipamento Equip { get; set; } = null!;
    public string DescProblema { get; set; } = null!;
    public string? DescSolucao { get; set; }

    // chamado false = aberto pois o problema não foi resolvido
    // chamado true = fechado pois o problema foi resolvido
    public bool Status { get; set; } = false;
}
