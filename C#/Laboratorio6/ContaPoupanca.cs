public class ContaPoupanca : Conta {
    //atributos adicionais, além dos herdados da classe "Conta"
    private decimal taxaJuros;
    private DateTime dataAniversario;

    //método construtor, fazendo referência ao construtor da classe base:
    public ContaPoupanca(decimal j, DateTime d, string t) : base(t) {
        taxaJuros = j;
        dataAniversario = d;
    }
    
    //propriedades adicionais
    public decimal Juros {
        get { return taxaJuros; }
        set { taxaJuros = value; }
    }
    public DateTime DataAniversario {
        get { return dataAniversario; }
    }
    
    //método adicional para a aplicação do rendimento da conta:
    public void AdicionarRendimento() {
        DateTime hoje = DateTime.Now;
        if (hoje.Day >= dataAniversario.Day && hoje.Month > dataAniversario.Month) {
            decimal rendimento = this.Saldo * taxaJuros;
            this.Depositar(rendimento);
        }
    }
    
    //implementa a propriedade abstrata herdada da classe base:
    public override string Id {
        get { return this.Titular + "(CP)"; }
    }

}