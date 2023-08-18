
// ARRAYS
int[] array = new int[5] { 10, 20, 30, 40, 50 };
int i;
for (i = 0; i < 5; i++)
{
    Console.WriteLine("Indice = " + i + " & Valor = " + array[i]);
}
Console.WriteLine("- - - - - - - - - - - -");

string[] str = new string[3];
int iStr;
str[0] = "Um";
str[1] = "Dois";
str[2] = "Tres";
for (iStr = 0; iStr < 3; iStr++)
{
    Console.WriteLine("Indice = " + iStr + " & Valor = " + str[iStr]);
}
Console.WriteLine("- - - - - - - - - - - -");

DateTime[] dt = new DateTime[2];
int iDate;
dt[0] = new DateTime(2002, 5, 1);
dt[1] = new DateTime(2002, 6, 1);
for (iDate = 0; iDate < 2; iDate++)
{
    Console.WriteLine("Indice = " + iDate + " & Data = " + dt[iDate].ToShortDateString());
}
Console.WriteLine("- - - - - - - - - - - -");

//CÓPIA DE UM ARRAY P/ O OUTRO utilizando System.Linq
int[] arraySequenciais = Enumerable.Range(1, 100).ToArray();
int[] arrayCopiado = new int[100];
//de onde copiar, pra onde, quais itens copiar (nesse caso todo comprimento)
Array.Copy(arraySequenciais, arrayCopiado, arraySequenciais.Length);
foreach (int numero in arrayCopiado){
    Console.Write(numero + " ");
}
Console.WriteLine("- - - - - - - - - - - -");

//MATRIZ Multidimensional
int[,] matriz = new int[5, 5]{
    { 1, 2, 3, 4, 5 },
    { 6, 7, 8, 9, 10 },
    { 11, 12, 13, 14, 15 },
    { 16, 17, 18, 19, 20 },
    { 21, 22, 23, 24, 25 }
};
for (int coluna = 0; coluna < matriz.GetLength(1); coluna++){
    int acumulador = 0;
    for (int linha = 0; linha < matriz.GetLength(0); linha++){
        acumulador += matriz[linha, coluna];
    }
    Console.WriteLine($"Soma da coluna {coluna + 1}= {acumulador}");
}
Console.WriteLine("- - - - - - - - - - - -");

//MATRIZ Jagged
int[][] matrizJagged = new int[5][]{
    new int[] { 1, 6, 11, 16, 21 },
    new int[] { 2, 7, 12, 17, 22 },
    new int[] { 3, 8, 13, 18, 23 },
    new int[] { 4, 9, 14, 19, 24 },
    new int[] { 5, 10, 15, 20, 25 }    
};
for (int col = 0; col < matrizJagged[0].Length; col++){
    int somaColuna = 0;
    for (int lin = 0; lin < matrizJagged.Length; lin++){
        somaColuna += matrizJagged[lin][col];
    }
    Console.WriteLine($"Soma da coluna {col + 1}= {somaColuna}");
}