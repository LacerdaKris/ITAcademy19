Console.WriteLine("Iniciando a conexão com BD");
using(var context = new TarefaContext())
{
    Console.WriteLine("Inserindo dados");
    context.Tarefas.Add(new Tarefa{
        Nome = "Estudar .NET",
        Descricao = "Ler o material Learn Microsoft",
        Completa = false
    });
    context.Tarefas.Add(new Tarefa{
        Nome = "Lavar louça",
        Completa = true
    });
    context.SaveChanges();

    Console.WriteLine("Consultando dados");
    var todasTarefas = context.Tarefas.ToList();
    todasTarefas.ForEach(t => Console.WriteLine($"Id={t.Id}  Nome={t.Nome}  Descrição={t.Descricao}  Completa={t.Completa}"));

    Console.WriteLine("Alterando dados");
    //busca pela chave primaria
    var umaTarefa = context.Tarefas.Find(1L);
    if (umaTarefa != null)
    {
        umaTarefa.Completa = true;
    }
    context.SaveChanges();
    todasTarefas = context.Tarefas.ToList();
    todasTarefas.ForEach(t => Console.WriteLine($"Id={t.Id}  Nome={t.Nome}  Descrição={t.Descricao}  Completa={t.Completa}"));

    Console.WriteLine("Removendo dados");
    umaTarefa = context.Tarefas.Find(2L);
    if (umaTarefa != null)
    {
        context.Tarefas.Remove(umaTarefa);
    }
    context.SaveChanges();
    todasTarefas = context.Tarefas.ToList();
    todasTarefas.ForEach(t => Console.WriteLine($"Id={t.Id}  Nome={t.Nome}  Descrição={t.Descricao}  Completa={t.Completa}"));
}//coontext.Dispose() para liberar a memoria no final do uso do bd
Console.WriteLine("Fim");
