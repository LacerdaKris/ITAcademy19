// CLASSES ABSTRATAS

//lista p/ armazenar os objetos
List<ContaPoupanca> listaContas = new List<ContaPoupanca>();

ContaPoupanca fulano = new ContaPoupanca(0.05M, new DateTime(2023, 7, 15), "Fulano");
fulano.Depositar(120);
fulano.Sacar(20);
fulano.AdicionarRendimento();
listaContas.Add(fulano);

ContaPoupanca kris = new ContaPoupanca(0.05M, new DateTime(2023, 8, 14), "Kris");
kris.Depositar(500);
kris.AdicionarRendimento();
listaContas.Add(kris);

// Iterar pela lista e exibe informações
foreach (ContaPoupanca conta in listaContas)
{
    Console.WriteLine($"Titular: {conta.Id} / Saldo: {conta.Saldo}");
}