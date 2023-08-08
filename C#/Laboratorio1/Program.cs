// * * * 1 - Trabalhando com tipos-valor fundamentais byte, int e long * * * 
byte b;
b = byte.MaxValue;
Console.WriteLine("Valor máximo de byte: " + b);
//ou interpolação de strings ao invés de concatenação, conf. abaixo

int i;
i = int.MaxValue;
Console.WriteLine($"Valor máximo de int: {i}");

long l;
l = long.MaxValue;
Console.WriteLine($"Valor máximo de long: {l}");
Console.WriteLine("---------------------------------");

// * * * 2 e 3 - Trabalhando com strings e objetos do Framework * * * 
string strPrimeira = "Alo";
string strSegunda = "Mundo";
string strTerceira = strPrimeira + strSegunda;
Console.WriteLine(strTerceira);

int cchTamanho = strTerceira.Length;
string strQuarta = "Tamanho = " + cchTamanho.ToString(); 
Console.WriteLine(strQuarta);
Console.WriteLine($"Substring do índice 0 a 5: {strTerceira.Substring(0, 5)}");

DateTime dt = new DateTime(2015, 04, 23);
string strQuinta = dt.ToString();
Console.WriteLine("Data: " + strQuinta);
Console.WriteLine("---------------------------------");

// * * * 4 - Exercícios * * * 
//1 - Números com vírgula da menor p/maior precisão e bits
float numeroFloat = 3.14f;
double numeroDouble = 3.14;
decimal numeroDecimal = 3.14m;
float calculoFloat = numeroFloat / 3;
double calculoDouble = numeroDouble / 3;
decimal calculoDecimal = numeroDecimal / 3;
Console.WriteLine("Float: " + calculoFloat);
Console.WriteLine("Double: " + calculoDouble);
Console.WriteLine("Decimal: " + calculoDecimal);
Console.WriteLine("---------------------------------");

//4 - conversões de dados
int iConverte = 10;
float f = 0;
f = iConverte; //conversão implícita, sem perda de dados.
System.Console.WriteLine("Conversão implícita de int pra int: " + f);
f = 0.5F;
iConverte = (int) f; //conversão explícita, com perda de dados.
System.Console.WriteLine("Conversão explícita de float pra int: " + i);
Console.WriteLine("---------------------------------");

//5 - classe System.Convert do Framework p/ conversões
string stringInt = "123456789";
int valorStringInt = Convert.ToInt32(stringInt);
Console.WriteLine("Conversões com System.Convert do Framework: \nDe string p/ int32: " + valorStringInt);
Int64 valorInt64 = 123456789;
int valorInt = Convert.ToInt32(valorInt64);
Console.WriteLine("De int64 p/ int32: " + valorInt);
Console.WriteLine("---------------------------------");

//6 - Testando o método TryParse
string stringInteiro = "123456789";
int valorStringInteiro;
bool conversao1 = Int32.TryParse(stringInteiro, out valorStringInteiro);
Console.WriteLine("Conversão efetuada: " + conversao1 + " Valor: " + valorStringInteiro);

string stringInteiroGrande = "999999999999999999999999999999999999999999999";
int valorStringInteiroGrande;
bool conversao2 = Int32.TryParse(stringInteiroGrande, out valorStringInteiroGrande);
Console.WriteLine("Conversão efetuada: " + conversao2 + "  Valor: " + valorStringInteiroGrande);

string stringLetras = "abc";
double valorStringLetras;
bool conversao3 = Double.TryParse(stringLetras, out valorStringLetras);
Console.WriteLine("Conversão efetuada: " + conversao3 + "  Valor: " + valorStringLetras);
Console.WriteLine("---------------------------------");

//7 - Arredondamentos
double valorFracionado = 4.7;
int valorInteiro1 = (int) valorFracionado;
int valorInteiro2 = Convert.ToInt32(valorFracionado);
Console.WriteLine("Conversao explicita = " + valorInteiro1);
Console.WriteLine("Conversao metodo Convert = " + valorInteiro2);
Console.WriteLine("---------------------------------");

//8 - Formas de exibir valores de variáveis
int x = 10;
double y = 3.4;
Console.WriteLine("Exibição 1: {1} {0}",x,y);
Console.WriteLine($"Exibição 2: {x} {y}");

//2 e 3 - operações String e DateTime da biblioteca de classes
Console.WriteLine("Digite sua cor preferida: ");
string corUsuario = Console.ReadLine() ?? "nenhuma";
ClasseString cores = new ClasseString();
cores.Comparar(corUsuario);
cores.DataConsulta(DateTime.Today);
Console.WriteLine("---------------------------------");

public class ClasseString{
    public void Comparar(string cor)
    {
        string corPreferida = "ROSA";
        cor = cor.ToUpper();
        if (cor.Equals(corPreferida))
        {
            Console.WriteLine("Você gosta da mesma cor que eu!");
        }
        else
        {
            Console.WriteLine("Sua cor preferida não é rosa como a minha.");
        }
    }
    public void DataConsulta(DateTime hoje)
    {
        Console.WriteLine("Essa comparação de cor preferida foi feita em: " + hoje);
    }
}
