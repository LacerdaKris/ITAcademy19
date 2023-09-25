namespace InfoRental.Dtos;

using InfoRental.Models;

public class ChamadoDTO
{
    public int Id { get; set; }
    public string Cnpj { get; set; } = null!;
    public DateTime DataAbertura { get; set; }
    public DateTime? DataFechamento { get; set; }
    public EquipamentoDTO Equip { get; set; } = null!;
    public string DescProblema { get; set; } = null!;
    public string? DescSolucao { get; set; }
    public bool Status { get; set; }

    public static ChamadoDTO DeModelParaDTO(Chamado chamado)
    {
        ChamadoDTO chamadoDTO = new ChamadoDTO
        {
            Id = chamado.Id,
            DataAbertura = chamado.DataAbertura,
            DataFechamento = chamado.DataFechamento,
            Equip = EquipamentoDTO.DeModelParaDTO(chamado.Equip),
            DescProblema = chamado.DescProblema,
            DescSolucao = chamado.DescSolucao,
            Status = chamado.Status
        };
        chamadoDTO.Cnpj = chamadoDTO.Equip.Cliente.Cnpj;
        return chamadoDTO;
    }

    public static Chamado DeDtoParaModel(ChamadoDTO chamado)
    {
        return new Chamado
        {
            Id = chamado.Id,
            DataAbertura = chamado.DataAbertura,
            DataFechamento = chamado.DataFechamento,
            NSerie = chamado.Equip.NSerie,
            Equip = EquipamentoDTO.DeDtoParaModel(chamado.Equip),
            DescProblema = chamado.DescProblema,
            DescSolucao = chamado.DescSolucao,
            Status = chamado.Status
        };
    }
}
