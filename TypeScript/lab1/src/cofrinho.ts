import { stopCoverage } from "v8";
import { Moeda } from "./moeda";

export class Cofrinho extends Moeda {
  static moedas: Moeda[] = [];

  static adicionar(m: Moeda): void {
    this.moedas.push(m);
  }

  static calcularTotal(): number {
    let total = 0;
    for (const moeda of this.moedas) {
      const valorMoeda = moeda.getValor();
      //parseFloat converte a string em um número de ponto flutuante
      total += parseFloat(valorMoeda);
    }
    return total;
  }

  static menorMoeda(moedas: { valor: number; nome: string }[]): number | null {
    if (moedas.length === 0) {
      return null;
    }

    const valoresMoedas = moedas.map((moeda) => moeda.valor);
    return Math.min(...valoresMoedas);
  }

  static qtdMoedas(_moedas: any): Record<string, number> {
    const qtds: Record<string, number> = {};

    for (const moeda of this.moedas) {
      const m = moeda.valor;

      if (qtds[m]) {
        qtds[m]++;
      } else {
        qtds[m] = 1;
      }
    }

    return qtds;
  }
}
