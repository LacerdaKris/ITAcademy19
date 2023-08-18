using System.Net.Http.Json;

public class ViaCepConsumidor {
    //atributos
    public const string URI_BASE = "https://viacep.com.br/ws";
    private static readonly HttpClient cliente = new HttpClient(); //p enviar consulta ao endereço do webservice

    //metodos
    public static Task<HttpResponseMessage> ConsultarV1 (string cep) {
        string uri = $"{URI_BASE}/{cep}/json";
        return cliente.GetAsync(uri);
    }
    public static Task<string> ConsultarV2 (string cep) {
        string uri = $"{URI_BASE}/{cep}/json";
        return cliente.GetStringAsync(uri);
    }
    public static Task<ViaCepDTO?> ConsultarV3 (string cep) {
        string uri = $"{URI_BASE}/{cep}/json";
        return cliente.GetFromJsonAsync<ViaCepDTO>(uri);
    }
}

//propriedades com os dados que eu quero retirar do json para o objeto
public class ViaCepDTO {
    public string? Cep {get; set;}
    public string? Logradouro {get; set;}
    public string? Complemento {get; set;}
    public string? Bairro {get; set;}
    public string? Localidade {get; set;}
    public string? Uf {get; set;}
}
