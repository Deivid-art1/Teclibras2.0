using Microsoft.EntityFrameworkCore;
using TecLibrasApi.Infra;

var builder = WebApplication.CreateBuilder(args);

// Controllers da API
builder.Services.AddControllers();

// Conexão banco / serviços
builder.Services.AddDbContext<AppDbContext>(options =>
    options.UseMySql(builder.Configuration.GetConnectionString("DefaultConnection"),
    ServerVersion.AutoDetect(
    builder.Configuration.GetConnectionString("DefaultConnection")
)));

var app = builder.Build();

// Middleware
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
    app.UseHsts();
}

app.UseHttpsRedirection();

// Permitir acesso arquivos wwwroot
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

// Mapear controllers API
app.MapControllers();

app.Run();