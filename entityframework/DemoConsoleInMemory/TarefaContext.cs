using Microsoft.EntityFrameworkCore;

//configuração do contexto do banco de dados (tipo, porta de acesso, nome, etc)
public class TarefaContext : DbContext
{
    protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
    {
        base.OnConfiguring(optionsBuilder);
        optionsBuilder.UseInMemoryDatabase("TarefasBD");
        //mostrar todas td q acontecer no processamento
        optionsBuilder.EnableSensitiveDataLogging().LogTo(Console.WriteLine);
    }

    //configurar entidades que serão expostas
    public DbSet<Tarefa> Tarefas {get; set;} = null!;

}