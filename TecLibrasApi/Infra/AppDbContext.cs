using Microsoft.EntityFrameworkCore;
using TecLibrasApi.Domain.Models;

namespace TecLibrasApi.Infra
{
    public class AppDbContext : DbContext
    {
        public AppDbContext(DbContextOptions<AppDbContext> options)
            : base(options)
        {
        }

        public DbSet<Sinal> Sinais { get; set; }

        public DbSet<Midia> Midias { get; set; }

        public DbSet<Categoria> Categorias { get; set; }

        public DbSet<SinalCategoria> SinalCategorias { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<SinalCategoria>()
                .HasKey(sc => new { sc.IdSinal, sc.IdCategoria });
        }
    }
}