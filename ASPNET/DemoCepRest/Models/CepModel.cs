//define modelos (entidades) que representam o núcleo do domínio. Guarda a lógica do negócio e retorna as informações escolhidas

using DemoCepRest.DTOs;

namespace DemoCepRest.Models;

//define a estrutura de dados de um objeto CEP
public class CepModel
{
    public string Cep {get;set;} = null!;
    public string Estado {get;set;} = null!;
    public string Cidade {get;set;} = null!;
    public string Bairro {get;set;} = null!;
    public string Logradouro {get;set;} = null!;

    //converte objetos model para DTO
    public static CepDTO ParaDTO(CepModel model)
    {
        return new CepDTO {
            Cep = model.Cep,
            Estado = model.Estado,
            Cidade = model.Cidade,
            Bairro = model.Bairro,
            Logradouro = model.Logradouro
        };
    }

    //converte objetos DTO para Model
    public static CepModel ParaModel(CepDTO dto)
    {
        return new CepModel {
            Cep = dto.Cep,
            Estado = dto.Estado,
            Cidade = dto.Cidade,
            Bairro = dto.Bairro,
            Logradouro = dto.Logradouro
        };
    }
}