//define as operações que uma classe de repositório de CEP deve implementar

namespace DemoCepRest.Services;

using DemoCepRest.Models;

public interface ICepRepository
{
    //métodos p/ implementação
    IEnumerable<CepModel> ConsultarTodos();
    CepModel? ConsultarPorCodigoCep(string codigoCep);
    CepModel Cadastrar(CepModel cepModel);
}