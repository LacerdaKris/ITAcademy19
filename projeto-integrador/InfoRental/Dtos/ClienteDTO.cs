namespace InfoRental.Dtos;

using InfoRental.Models;

public class ClienteDTO
{
    public int? Id { get; set; }
    public string Cnpj { get; set; } = null!;
    public string Nome { get; set; } = null!;

    //relacionamento 1-N com Equipamento
    public List<EquipamentoDTO> Alugueis { get; set; } = null!;

    public static ClienteDTO DeModelParaDTO(Cliente cliente)
    {
        ClienteDTO clienteDTO = new ClienteDTO
        {
            Id = cliente.Id,
            Cnpj = cliente.Cnpj,
            Nome = cliente.Nome
        };


        return clienteDTO;
    }

        public static ClienteDTO DeModelParaDTOComAlugueis(Cliente cliente)
    {
        ClienteDTO clienteDTO = new ClienteDTO
        {
            Id = cliente.Id,
            Cnpj = cliente.Cnpj,
            Nome = cliente.Nome
        };

        List<EquipamentoDTO> equipamentosAlugados = cliente.Alugueis != null
            ? cliente.Alugueis.Select(aluguel => EquipamentoDTO.DeModelParaDTO(aluguel)).ToList()
            : new List<EquipamentoDTO>();

        clienteDTO.Alugueis = equipamentosAlugados;

        return clienteDTO;
    }

    public static ClienteDTO DeModelParaDTOSemAlugueis(Cliente cliente)
    {
        return new ClienteDTO
        {
            Id = cliente.Id,
            Cnpj = cliente.Cnpj,
            Nome = cliente.Nome
        };
    }
}
