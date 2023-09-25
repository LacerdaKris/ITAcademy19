export class Chamado {
  constructor(
    public id: number,
    public Cnpj: string,
    public DataAbertura: Date,
    public DataFechamento: Date | null,
    public Equip: string,
    public DescProblema: string,
    public DescSolucao: string | null,
    public Status: boolean
  ) {}
}
