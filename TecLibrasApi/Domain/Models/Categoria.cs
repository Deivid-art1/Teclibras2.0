using System.ComponentModel.DataAnnotations;

namespace TecLibrasApi.Domain.Models
{
    public class Categoria
    {
        [Key]
        public int IdCategoria { get; set; }

        [Required]
        public string NomeCategoria { get; set; } = null!;

        public ICollection<SinalCategoria> SinalCategorias { get; set; }
            = new List<SinalCategoria>();
    }
}