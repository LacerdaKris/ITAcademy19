using System;

class ContaCorrente {
    //contadores para posterior cálculo de média
    decimal acumulador = default;
    int contador = default;

    //atributos
    private decimal saldo;
    private string titular;
    private DateTime data;

    //construtor de conta
    public ContaCorrente(string nome, decimal valorInicial){
        saldo = valorInicial;
        titular = nome;
        data = DateTime.Now;
    }

    //métodos
    public void Depositar(decimal val){
        if(val < 0){
            Console.WriteLine("Não pode ser um número negativo");
        }else{
            saldo = saldo + val;
            acumulador += saldo;
            contador++;
        }
    }

    public void Sacar(decimal val){
        if(val < 0){
            Console.WriteLine("Não pode ser um número negativo");
        }else if(val <= saldo){
            saldo = saldo - val;
            acumulador += saldo;
            contador++;
        }else{
            Console.WriteLine("Saldo Insuficiente");
        }
    }

    //propriedades de retorno ao main com get para selecioar porém não alterar
    public string Saldo{
        get {
            string dados = "Titular: " + titular + "\nData de criação: " + data + "\nSaldo atual: " + saldo;
            return dados;
        }
    }

    public string Media{
        get {
            string saldoMedio = "Saldo médio: " + acumulador/contador;
            return saldoMedio;
        }
    }

}