using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace TecLibrasApi.Domain.Models
{
    public class Midia
    {
        [Key]
        public int IdMidia { get; set; }

        [Required]
        public int IdSinal { get; set; }

        [Required]
        public string TipoMidia { get; set; }

        [Required]
        public string UrlArquivo { get; set; }

        public string NomeOriginal { get; set; }

        public string Formato { get; set; }

        public long TamanhoArquivo { get; set; }

        public DateTime DataUpload { get; set; }

        // Navegação
        [ForeignKey("IdSinal")]
        public Sinal Sinal { get; set; }
    }
}