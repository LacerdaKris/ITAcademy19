//subclasse de Circulo
public class CirculoColorido : Circulo
{
    public string minhaCor;

    //construtores de subclasse
    public CirculoColorido(){
        minhaCor = "preto";
    }
    public CirculoColorido(double x, double y, double r, string c) : base(x, y, r){
        minhaCor = c;
    }

    //propriedade
    public string Cor{
        get{
            return minhaCor;
        }
        set{
            minhaCor = value;
        }
    }

    //sobrescrevendo método herdado
    public override string ToString(){
        return base.ToString() + " cor=" + Cor;
    }
}