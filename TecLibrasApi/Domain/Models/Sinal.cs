using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
namespace TecLibrasApi.Domain.Models

{
    public class Sinal
    {
        [Key]
        public int IdSinal { get; set; }

        [Required]
        public string TermoTi { get; set; }

        // Um sinal pode ter várias mídias
        public ICollection<Midia> Midias { get; set; }

        // Um sinal pode ter várias categorias
        public ICollection<SinalCategoria> SinalCategorias { get; set; }
    }
}