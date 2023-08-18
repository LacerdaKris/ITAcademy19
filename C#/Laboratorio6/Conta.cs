public abstract class Conta {
    //atributos
    private decimal saldo;
    private string titular;

    //método construtor
    public Conta(string t) {
        titular = t;
    }

    //propriedades de leitura
    public decimal Saldo {
        get {return saldo;}
    }
    public string Titular {
        get {return titular;}
    }

    //propriedade abstrata de leitura que retorna identificador da conta
    //Esta propriedade será implementada pelas classes derivadas
    public abstract string Id {
        get;
    }

    //definir métodos virtuais para depositar e retirar valores
    public virtual void Depositar(decimal valor) {
        saldo += valor;
    }
    public virtual void Sacar(decimal valor) {
        saldo -= valor;
    }
}

