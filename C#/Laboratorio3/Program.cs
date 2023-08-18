//Coleções Genéricas

//LISTA
List<string> listaStrings = new List<string>();
listaStrings.Add("Um");
listaStrings.Add("Hello");
listaStrings.Add("World");
Console.WriteLine(listaStrings[0]);
Console.WriteLine(listaStrings[1]);
Console.WriteLine(listaStrings[2]);
Console.WriteLine("- - - - - - - - - -");

//QUEUE
Queue<Object> q = new Queue<Object>();
q.Enqueue(".Net Framework");
q.Enqueue(new Decimal(123.456));
q.Enqueue(654);
Console.WriteLine(q.Dequeue());
Console.WriteLine(q.Dequeue());
Console.WriteLine(q.Dequeue());
Console.WriteLine("- - - - - - - - - -");

//FILA
Queue<int> minhaFila = new Queue<int>();
minhaFila.Enqueue(10);
minhaFila.Enqueue(200);
minhaFila.Enqueue(1000);
Console.WriteLine(minhaFila.Dequeue());
Console.WriteLine(minhaFila.Dequeue());
Console.WriteLine(minhaFila.Dequeue());
Console.WriteLine("- - - - - - - - - -");

//DICIONÁRIO
Dictionary<int, string> paises = new Dictionary<int, string>();
paises[44] = "Reino Unido";
paises[33] = "França";
paises[55] = "Brasil";
foreach (var item in paises)
{
 int codigo = item.Key;
 string pais = item.Value;
 Console.WriteLine("Código {0} = {1}", codigo, pais);
}
//procurar chave no dicionário pelo valor
string paisProcurado = "França";
var codigoDDI = paises.FirstOrDefault(pais => pais.Value == paisProcurado).Key;
if (codigoDDI != 0){
    Console.WriteLine("O código DDI para {0} é {1}", paisProcurado, codigoDDI);
} else {
    Console.WriteLine("País não encontrado no dicionário.");
}
Console.WriteLine("- - - - - - - - - -");
//calcular nº de elementos com valores maiores que a média e retornar uma nova lista com esses valores
List<double> numeros = new List<double> { 10.5, 7.2, 12.8, 5.4, 9.6 };
double media = numeros.Average();
List<double> acimaMedia = new List<double>();
Console.WriteLine($"A média da lista de numeros é: {media}");
foreach (double numero in numeros){
    if (numero > media){
        acimaMedia.Add(numero);
        Console.WriteLine($"o número {numero} está acima da média");
    }
}
Console.WriteLine($"Número de elementos acima da média: {acimaMedia.Count}");