import { ByteLengthQueuingStrategy } from "stream/web";

let saudacao: string = "Alô, mundo";
console.log(saudacao);

//Imprimir os números pares definidos por um intervalo de valores inteiros não-negativos utilizando versões com for e while.
let numeros: number[] = [];
let contador: number = 0;
while (numeros.length < 10) {
  contador += 1;
  numeros.push(contador);
}

let pares: number[] = [];
for (let i = numeros[1]; i <= numeros.length; i += 2) {
  pares.push(i);
}
console.log(pares);

//Escreva uma função min(x,y) que devolve o menor entre dois números. Não use funções auxiliares de Math.
function minimo(x: number, y: number): number {
  if (x > y) {
    return y;
  } else {
    return x;
  }
}
console.log(minimo(2, 3));

//Escreva uma função pow(x,y) que calcula x elevado a potência y. x e y são números inteiros não negativos, e se y for 0 a potência de qqr numero fica =1.
const pow = function (x: number, y: number): number {
  if ((y = 0)) {
    return 1;
  } else {
    let acumulador: number = x;
    for (let i = y - 1; i > 0; i--) {
      acumulador *= x;
    }
    return acumulador;
  }
};
console.log(pow(3, 4));

//Escreva uma função toMaiusculaPrimeira(s) que recebe uma string e retorna a mesma string com a primeira letra em maiúscula
const toMaiusculaPrimeira = (palavra: string): string => {
  let letraMaiuscula = palavra[0].toUpperCase();
  let parteApos = palavra.slice(1);
  let alterada: string = letraMaiuscula + parteApos;
  return alterada;
};
console.log(toMaiusculaPrimeira("capivara"));

//Escreva uma função getMax(arr) que recebe um array de número inteiros e retorna o maior elemento encontrado no array. Não utilize funções auxiliares.
function getMax(array: Array<number>): number {
  let maior = array[0];
  for (let i = 1; i < array.length; i++) {
    if (array[i] > maior) {
      maior = array[i];
    }
  }
  return maior;
}
console.log(getMax(numeros));

//Escreva uma função que, utilizando objetos Map, calcule a frequência de cada número presente em um determinado array de números inteiros.
function frequencia(array: Array<number>): Map<number, number> {
  let qtdCada = new Map();
  for (let i = 0; i < array.length; i++) {
    const quantidade = array.filter((numero) => numero === array[i]).length;
    const existeChave = qtdCada.has(array[i]);
    if (existeChave) {
      continue;
    } else {
      qtdCada.set(array[i], quantidade);
    }
  }
  return qtdCada;
}
let inteiros: number[] = [2, 2, 3, 4, 5, 5, 5];
console.log(frequencia(inteiros));
