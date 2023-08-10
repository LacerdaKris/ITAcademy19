using System;
using System.Drawing;

//classes e Herança

//usando classe base
Circulo circ1 = new Circulo();
Circulo circ2 = new Circulo(2.4, 5, 3);

//usando classe herdada
CirculoColorido circ3 = new CirculoColorido();
CirculoColorido circ4 = new CirculoColorido(1.5, 3.1, 1, "vermelho");

//usando classe herdada da subclasse
CirculoColoridoPreenchido circ5 = new CirculoColoridoPreenchido();
CirculoColoridoPreenchido circ6 = new CirculoColoridoPreenchido(1.5, 3.1, 1, "vermelho", Color.Green);
;

Circulo[] circulos = {circ1, circ2, circ3, circ4, circ5, circ6};
foreach (Circulo c in circulos)
{
    Console.WriteLine(c);
}