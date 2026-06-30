namespace TecLibrasApi.Domain.Models
{
    public class SinalCategoria
    {
    public int IdSinal { get; set; }
    public Sinal Sinal { get; set; } = null!;

    public int IdCategoria { get; set; }
    public Categoria Categoria { get; set; } = null!;
    }
}