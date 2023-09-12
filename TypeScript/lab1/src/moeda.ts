export class Moeda {
  valor: number;
  nome: string;

  constructor(valor: number, nome: string) {
    this.valor = valor;
    this.nome = nome;
  }

  getValor(): string {
    return `${this.valor} ${this.nome}`;
  }
}