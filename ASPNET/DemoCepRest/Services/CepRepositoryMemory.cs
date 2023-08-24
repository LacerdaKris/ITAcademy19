//implementa a interface que gerencia a capacidade de realizar operações relacionadas a CEPs

using DemoCepRest.Models;
using System.Collections.Concurrent;

namespace DemoCepRest.Services;

//define um conjunto de ações que uma classe deve fornecer, mas não especifica como (diferentes classes forneçam implementações diferentes para a mesma interface)
public class CepRepositoryMemory : ICepRepository
{
    //ConcurrentDictionary cria estrutura armazena pares chave-valor, onde a chave é a string CEP e o valor é um objeto CepModel. Atribui a variável 'dados'
    private readonly ConcurrentDictionary<string, CepModel> dados =
        new ConcurrentDictionary<string, CepModel>();

    //construtor com entradas iniciais p/ preencher o repositório
    public CepRepositoryMemory()
    {
        //'TryAdd' tenta adicionar um novo par à coleção e se a chave já existir não realiza nada
        dados.TryAdd("90619900", new CepModel{
            Cep = "90619900",
            Estado = "RS",
            Cidade = "Porto Alegre",
            Bairro = "Partenon",
            Logradouro = "Av. Ipiranga, 6681"
        });
        dados.TryAdd("01001000", new CepModel{
            Cep = "01001000",
            Estado = "SP",
            Cidade = "São Paulo",
            Bairro = "Sé",
            Logradouro = "Praça da Sé"
        });
    }

    //método recebe um objeto CepModel e tenta adicionar ao repositório
    public CepModel Cadastrar(CepModel cepModel)
    {
        dados.TryAdd(cepModel.Cep, cepModel);
        return cepModel;
    }

    //método retorna o objeto CepModel correspondente ao código CEP fornecido (ou null se não encontrado)
    public CepModel? ConsultarPorCodigoCep(string codigoCep)
    {
        CepModel? model;
        dados.TryGetValue(codigoCep, out model);
        return model;
    }

    //método retorna coleção de todos os objetos CepModel no repositório
    public IEnumerable<CepModel> ConsultarTodos()
    {
        return dados.Values;
    }
}