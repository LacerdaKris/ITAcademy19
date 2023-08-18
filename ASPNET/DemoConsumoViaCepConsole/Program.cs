//consulta a url https://viacep.com.br/ws + CEP com retorno em formato json

try {
    // await espera o retorno p/ depois seguir o codigo
    var resultado = await ViaCepConsumidor.ConsultarV1("91350120");
    Console.WriteLine("Requisição deu certo? " + resultado.IsSuccessStatusCode);
    Console.WriteLine("Status com base no código dele: " + resultado.StatusCode);
    var dados = await resultado.Content.ReadAsStringAsync();
    Console.WriteLine("ConsultarV1: " + dados);

    var resultadoV2 = await ViaCepConsumidor.ConsultarV2("91350120");
    Console.WriteLine("ConsultarV2: " + resultadoV2);

    var resultadoV3 = await ViaCepConsumidor.ConsultarV3("91350120");
    Console.WriteLine("ConsultarV3:");
    if (resultadoV3 != null) {
        Console.WriteLine("Cep: " + resultadoV3.Cep);
        Console.WriteLine("Bairro: " + resultadoV3.Bairro);
        Console.WriteLine("Uf: " + resultadoV3.Uf);
    }
}
catch (Exception e) {
    Console.WriteLine("Falha: " + e.Message);
}


