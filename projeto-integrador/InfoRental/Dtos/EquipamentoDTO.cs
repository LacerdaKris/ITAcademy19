namespace InfoRental.Dtos;

using InfoRental.Models;

public class EquipamentoDTO
{
    public string NSerie { get; set; } = null!;
    public string Descricao { get; set; } = null!;
    public string Categoria { get; set; } = null!;
    public bool StatusAlugado { get; set; }
    public ClienteDTO Cliente { get; set; } = null!;
    public int IdCliente { get; set; } //rever propriedade

    public static EquipamentoDTO DeModelParaDTO(Equipamento equip)
    {
        return new EquipamentoDTO
        {
            NSerie = equip.NSerie,
            Descricao = equip.Descricao,
            Categoria = equip.Categoria,
            StatusAlugado = equip.StatusAlugado,
            Cliente = ClienteDTO.DeModelParaDTOSemAlugueis(equip.Cliente), //antes era semalugueis
            IdCliente = equip.IdCliente
        };
    }

    public static Equipamento DeDtoParaModel(EquipamentoDTO equip)
    {
        return new Equipamento
        {
            NSerie = equip.NSerie,
            Descricao = equip.Descricao,
            Categoria = equip.Categoria,
            StatusAlugado = equip.StatusAlugado,
            IdCliente = equip.IdCliente
        };
    }
}
