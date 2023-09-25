using InfoRental.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddDbContext<InfoRentalContext>(opcoes =>
{
    opcoes.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection"));
    opcoes.EnableSensitiveDataLogging().LogTo(Console.WriteLine);
});
builder.Services.AddScoped<IClienteRepository, ClientesRepositoryEF>();
builder.Services.AddScoped<IChamadoRepository, ChamadoRepositoryEF>();
builder.Services.AddScoped<IEquipamentoRepository, EquipamentoRepositoryEF>();
builder.Services.AddCors(options =>
{
    options.AddPolicy(
        "AcessoCors",
        policy =>
        {
            policy.AllowAnyOrigin().AllowAnyMethod().AllowAnyHeader();
        }
    );
    options.AddDefaultPolicy(
        
        policy =>
        {
            policy.WithOrigins("*")
            .WithMethods("GET", "POST", "PUT", "DELETE")
            .WithHeaders("*");
            
        });
});

builder.Services.AddControllers();

// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();


var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
app.UseHttpsRedirection();

app.UseCors();

app.UseAuthorization();

app.MapControllers();

app.Run("http://localhost:8080");
