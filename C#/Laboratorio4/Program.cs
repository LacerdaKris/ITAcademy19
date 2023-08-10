ContaCorrente minhaConta = new ContaCorrente("Kris", 300m);

Console.WriteLine("*Saldo inicial*\n" + minhaConta.Saldo);
minhaConta.Depositar(100);
Console.WriteLine("- - - - - - - - - -");
Console.WriteLine("*Após depósito*\n" + minhaConta.Saldo);
minhaConta.Sacar(50);
Console.WriteLine("- - - - - - - - - -");
Console.WriteLine("*Após saque*\n" + minhaConta.Saldo);
Console.WriteLine("- - - - - - - - - -");
Console.WriteLine(minhaConta.Media);

ContaCorrente qualquerConta = new ContaCorrente("Fulano de tal", 10m);

Console.WriteLine("*Saldo inicial*\n" + qualquerConta.Saldo);
qualquerConta.Depositar(990);
Console.WriteLine("- - - - - - - - - -");
Console.WriteLine("*Após depósito*\n" + qualquerConta.Saldo);
qualquerConta.Sacar(300);
qualquerConta.Sacar(200);
Console.WriteLine("- - - - - - - - - -");
Console.WriteLine("*Após saques*\n" + qualquerConta.Saldo);
Console.WriteLine("- - - - - - - - - -");
Console.WriteLine(qualquerConta.Media);