// Importando o namespace para usar System.Drawing.Color
using System;
using System.Drawing;

//subclasse de CirculoColorido adicionando preenchimento
public class CirculoColoridoPreenchido : CirculoColorido
{
    private Color corPreenchimento;

    //construtores de subclasse
    public CirculoColoridoPreenchido() : base(){
        corPreenchimento = Color.Blue;
    }
    public CirculoColoridoPreenchido(double x, double y, double r, string c, Color p) : base(x, y, r, c){
        corPreenchimento = p;
    }

    //propriedade
    public Color corP{
        get{
            return corPreenchimento;
        }
        set{
            corPreenchimento = value;
        }
    }

    //sobrescrevendo método herdado
    public override string ToString(){
        return base.ToString() + " preenchimento=" + corP;
    }
}