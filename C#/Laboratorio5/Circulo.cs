//superclasse
public class Circulo
{
    private double coordX;
    private double coordY;
    private double raio;

    //construtor replicado caso a chamada não tenha parâmetros
    public Circulo() : this(0, 0, 1){
    }
    //construtor passando parâmetros
    public Circulo(double x, double y, double r){
        coordX = x;
        coordY = y;
        raio = Math.Abs(r);
    }

    //propriedades alterando os valores com set
    //e com get passando de volta aos atributos
    public double CentroX{
        get{
            return coordX;
        }
        set{
            coordX = value;
        }
    }
    public double CentroY{
        get{
            return coordY;
        }
        set{
            coordY = value;
        }
    }
    public double Raio{
        get{
            return raio;
        }
        set{
            raio = value;
        }
    }

    //implementação personalizada para o método ToString da classe base (System.Object)
    public override string ToString(){
        return "(" + string.Format("{0:F2}", CentroX) + ";"
        + string.Format("{0:F2}", CentroY) + ")"
        + " raio=" + string.Format("{0:F2}", Raio);
    }
}
