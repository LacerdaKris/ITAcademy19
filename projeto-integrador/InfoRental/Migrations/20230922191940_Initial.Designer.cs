﻿// <auto-generated />
using System;
using InfoRental.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace InfoRental.Migrations
{
    [DbContext(typeof(InfoRentalContext))]
    [Migration("20230922191940_Initial")]
    partial class Initial
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.11")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("InfoRental.Models.Chamado", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<DateTime>("DataAbertura")
                        .HasColumnType("date");

                    b.Property<DateTime?>("DataFechamento")
                        .HasColumnType("date");

                    b.Property<string>("DescProblema")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("DescSolucao")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("NSerie")
                        .IsRequired()
                        .HasColumnType("nvarchar(10)");

                    b.Property<bool>("Status")
                        .HasColumnType("bit");

                    b.HasKey("Id");

                    b.HasIndex("NSerie");

                    b.ToTable("Chamado", (string)null);
                });

            modelBuilder.Entity("InfoRental.Models.Cliente", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<string>("Cnpj")
                        .IsRequired()
                        .HasMaxLength(14)
                        .HasColumnType("nvarchar(14)");

                    b.Property<string>("Nome")
                        .IsRequired()
                        .HasMaxLength(30)
                        .HasColumnType("nvarchar(30)");

                    b.HasKey("Id");

                    b.HasIndex("Cnpj")
                        .IsUnique();

                    b.ToTable("Cliente", (string)null);
                });

            modelBuilder.Entity("InfoRental.Models.Equipamento", b =>
                {
                    b.Property<string>("NSerie")
                        .HasMaxLength(10)
                        .HasColumnType("nvarchar(10)");

                    b.Property<string>("Categoria")
                        .IsRequired()
                        .HasMaxLength(20)
                        .HasColumnType("nvarchar(20)");

                    b.Property<string>("Descricao")
                        .IsRequired()
                        .HasMaxLength(200)
                        .HasColumnType("nvarchar(200)");

                    b.Property<int>("IdCliente")
                        .HasColumnType("int");

                    b.Property<bool>("StatusAlugado")
                        .HasColumnType("bit");

                    b.HasKey("NSerie");

                    b.HasIndex("IdCliente");

                    b.ToTable("Equipamento", (string)null);
                });

            modelBuilder.Entity("InfoRental.Models.Chamado", b =>
                {
                    b.HasOne("InfoRental.Models.Equipamento", "Equip")
                        .WithMany("Chamados")
                        .HasForeignKey("NSerie")
                        .IsRequired()
                        .HasConstraintName("FK_Chamado_Equipamento");

                    b.Navigation("Equip");
                });

            modelBuilder.Entity("InfoRental.Models.Equipamento", b =>
                {
                    b.HasOne("InfoRental.Models.Cliente", "Cliente")
                        .WithMany("Alugueis")
                        .HasForeignKey("IdCliente")
                        .IsRequired()
                        .HasConstraintName("FK_Equipamento_Cliente");

                    b.Navigation("Cliente");
                });

            modelBuilder.Entity("InfoRental.Models.Cliente", b =>
                {
                    b.Navigation("Alugueis");
                });

            modelBuilder.Entity("InfoRental.Models.Equipamento", b =>
                {
                    b.Navigation("Chamados");
                });
#pragma warning restore 612, 618
        }
    }
}
