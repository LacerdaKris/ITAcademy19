namespace InfoRental.Services;

using Microsoft.EntityFrameworkCore;
using InfoRental.Models;

public class InfoRentalContext : DbContext
{
    public DbSet<Cliente> Clientes { get; set; } = null!;
    public DbSet<Equipamento> Equipamentos { get; set; } = null!;
    public DbSet<Chamado> Chamados { get; set; } = null!;

    public InfoRentalContext() { }

    public InfoRentalContext(DbContextOptions<InfoRentalContext> opcoes)
        : base(opcoes)
    {
        AdicionarDadosIniciais();
    }

    private void AdicionarDadosIniciais()
    {
        if (Clientes.Count() > 0)
        {
            return;
        }
        // Adicionando clientes iniciais
        var cliente1 = new Cliente { Nome = "Floricultura", Cnpj = "12345678901234" };
        var cliente2 = new Cliente { Nome = "Dell", Cnpj = "56789012345678" };
        var cliente3 = new Cliente { Nome = "Pucrs", Cnpj = "35268359062345" };
        var cliente4 = new Cliente { Nome = "Apple", Cnpj = "62850165834536" };
        var cliente5 = new Cliente { Nome = "InovaTec", Cnpj = "84017345926456" };

        Clientes.AddRange(cliente1, cliente2, cliente3, cliente4, cliente5);

        // Adicionando equipamentos iniciais
        var equip1cli1 = new Equipamento
        {
            NSerie = "11111",
            Descricao = "Computador Dell I5",
            Categoria = "Computador",
            IdCliente = 1
        };
        var equip2cli1 = new Equipamento
        {
            NSerie = "22222",
            Descricao = "Impressora 1",
            Categoria = "Impressora",
            IdCliente = 1
        };
        var equip3cli1 = new Equipamento
        {
            NSerie = "33333",
            Descricao = "Equipamento 3",
            Categoria = "Notebook",
            IdCliente = 1
        };
        var equip1cli2 = new Equipamento
        {
            NSerie = "44444",
            Descricao = "Notebook Dell I5",
            Categoria = "Notebook",
            IdCliente = 2
        };
        var equip2cli2 = new Equipamento
        {
            NSerie = "55555",
            Descricao = "Impressora",
            Categoria = "Impressora",
            IdCliente = 2
        };
        var equip3cli2 = new Equipamento
        {
            NSerie = "66666",
            Descricao = "Roteador 1",
            Categoria = "Roteador",
            IdCliente = 2
        };
        var equip1cli3 = new Equipamento
        {
            NSerie = "77777",
            Descricao = "Tablet 1",
            Categoria = "Tablet",
            IdCliente = 3
        };
        var equip2cli3 = new Equipamento
        {
            NSerie = "88888",
            Descricao = "Computador",
            Categoria = "Computador",
            IdCliente = 3
        };
        var equip3cli3 = new Equipamento
        {
            NSerie = "99999",
            Descricao = "Notebook",
            Categoria = "Notebook",
            IdCliente = 3
        };
        var equip1cli4 = new Equipamento
        {
            NSerie = "12222",
            Descricao = "Teclado",
            Categoria = "Teclado",
            IdCliente = 4
        };
        var equip2cli4 = new Equipamento
        {
            NSerie = "13333",
            Descricao = "Mouse",
            Categoria = "Mouse",
            IdCliente = 4
        };
        var equip3cli4 = new Equipamento
        {
            NSerie = "14444",
            Descricao = "Impressora 2",
            Categoria = "Impressora",
            IdCliente = 4
        };
        var equip1cli5 = new Equipamento
        {
            NSerie = "15555",
            Descricao = "Roteador 2",
            Categoria = "Roteador",
            IdCliente = 5
        };
        var equip2cli5 = new Equipamento
        {
            NSerie = "16666",
            Descricao = "Tablet 2",
            Categoria = "Tablet",
            IdCliente = 5
        };
        var equip3cli5 = new Equipamento
        {
            NSerie = "17777",
            Descricao = "Computador",
            Categoria = "Computador",
            IdCliente = 5
        };

        Equipamentos.AddRange(
            equip1cli1,
            equip2cli1,
            equip3cli1,
            equip1cli2,
            equip2cli2,
            equip2cli3,
            equip1cli3,
            equip2cli3,
            equip3cli3,
            equip1cli4,
            equip2cli4,
            equip3cli4,
            equip1cli5,
            equip2cli5,
            equip3cli5
        );

        var chamado1 = new Chamado
        {
            NSerie = "17777",
            DescProblema = "A tela parou de funcionar"
        };

        var chamado2 = new Chamado
        {
            NSerie = "16666",
            DescProblema = "A bateria não está carregando"
        };

        var chamado3 = new Chamado
        {
            NSerie = "14444",
            DescProblema = "A impressora não está imprimindo colorido"
        };

        var chamado4 = new Chamado
        {
            NSerie = "33333",
            DescProblema = "A tela está piscando"
        };

        Chamados.AddRange(
            chamado1,
            chamado2,
            chamado3,
            chamado4
        );

        // Salvando as alterações no banco de dados
        SaveChanges();
    }

    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        base.OnModelCreating(modelBuilder);
        modelBuilder.Entity<Cliente>(entityBuilder =>
        {
            entityBuilder.ToTable("Cliente");
            entityBuilder.Property(e => e.Nome).HasMaxLength(30);
            entityBuilder.Property(e => e.Cnpj).HasMaxLength(14);
            entityBuilder.HasIndex(c => c.Cnpj).IsUnique();
            entityBuilder.HasKey(c => c.Id);
        });

        modelBuilder.Entity<Equipamento>(entityBuilder =>
        {
            entityBuilder.ToTable("Equipamento");
            entityBuilder.Property(e => e.NSerie).HasMaxLength(10);
            entityBuilder.Property(e => e.Descricao).HasMaxLength(200);
            entityBuilder.Property(e => e.Categoria).HasMaxLength(20);
            entityBuilder.HasKey(e => e.NSerie);
            entityBuilder
                .HasOne(equipamento => equipamento.Cliente)
                .WithMany(cliente => cliente.Alugueis)
                .HasForeignKey(e => e.IdCliente)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Equipamento_Cliente");
        });

        modelBuilder.Entity<Chamado>(entityBuilder =>
        {
            entityBuilder.ToTable("Chamado");
            entityBuilder.Property(e => e.DataAbertura).HasColumnType("date");
            entityBuilder.Property(e => e.DataFechamento).HasColumnType("date");
            entityBuilder
                .HasOne(chamado => chamado.Equip)
                .WithMany(e => e.Chamados)
                .HasForeignKey(c => c.NSerie)
                .OnDelete(DeleteBehavior.ClientSetNull)
                .HasConstraintName("FK_Chamado_Equipamento");
            entityBuilder.HasKey(c => c.Id);
        });
    }
}
