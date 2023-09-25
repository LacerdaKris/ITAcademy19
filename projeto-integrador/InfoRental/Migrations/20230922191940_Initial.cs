using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace InfoRental.Migrations
{
    /// <inheritdoc />
    public partial class Initial : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Cliente",
                columns: table =>
                    new
                    {
                        Id = table
                            .Column<int>(type: "int", nullable: false)
                            .Annotation("SqlServer:Identity", "1, 1"),
                        Cnpj = table.Column<string>(
                            type: "nvarchar(14)",
                            maxLength: 14,
                            nullable: false
                        ),
                        Nome = table.Column<string>(
                            type: "nvarchar(30)",
                            maxLength: 30,
                            nullable: false
                        )
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Cliente", x => x.Id);
                }
            );

            migrationBuilder.CreateTable(
                name: "Equipamento",
                columns: table =>
                    new
                    {
                        NSerie = table.Column<string>(
                            type: "nvarchar(10)",
                            maxLength: 10,
                            nullable: false
                        ),
                        Descricao = table.Column<string>(
                            type: "nvarchar(200)",
                            maxLength: 200,
                            nullable: false
                        ),
                        Categoria = table.Column<string>(
                            type: "nvarchar(20)",
                            maxLength: 20,
                            nullable: false
                        ),
                        IdCliente = table.Column<int>(type: "int", nullable: false),
                        StatusAlugado = table.Column<bool>(type: "bit", nullable: false)
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Equipamento", x => x.NSerie);
                    table.ForeignKey(
                        name: "FK_Equipamento_Cliente",
                        column: x => x.IdCliente,
                        principalTable: "Cliente",
                        principalColumn: "Id"
                    );
                }
            );

            migrationBuilder.CreateTable(
                name: "Chamado",
                columns: table =>
                    new
                    {
                        Id = table
                            .Column<int>(type: "int", nullable: false)
                            .Annotation("SqlServer:Identity", "1, 1"),
                        DataAbertura = table.Column<DateTime>(type: "date", nullable: false),
                        DataFechamento = table.Column<DateTime>(type: "date", nullable: true),
                        NSerie = table.Column<string>(type: "nvarchar(10)", nullable: false),
                        DescProblema = table.Column<string>(type: "nvarchar(max)", nullable: false),
                        DescSolucao = table.Column<string>(type: "nvarchar(max)", nullable: true),
                        Status = table.Column<bool>(type: "bit", nullable: false)
                    },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Chamado", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Chamado_Equipamento",
                        column: x => x.NSerie,
                        principalTable: "Equipamento",
                        principalColumn: "NSerie"
                    );
                }
            );

            migrationBuilder.CreateIndex(
                name: "IX_Chamado_NSerie",
                table: "Chamado",
                column: "NSerie"
            );

            migrationBuilder.CreateIndex(
                name: "IX_Cliente_Cnpj",
                table: "Cliente",
                column: "Cnpj",
                unique: true
            );

            migrationBuilder.CreateIndex(
                name: "IX_Equipamento_IdCliente",
                table: "Equipamento",
                column: "IdCliente"
            );
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(name: "Chamado");

            migrationBuilder.DropTable(name: "Equipamento");

            migrationBuilder.DropTable(name: "Cliente");
        }
    }
}
