namespace InfoRental.Models;

public class Equipamento
{
    public string NSerie { get; set; } = null!;
    public string Descricao { get; set; } = null!;
    public string Categoria { get; set; } = null!;
    public int IdCliente { get; set; }
    public Cliente Cliente { get; set; } = null!;
    public bool StatusAlugado { get; set; }
    public virtual List<Chamado> Chamados { get; set; } = new List<Chamado>();
}
