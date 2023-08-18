using System.ComponentModel.DataAnnotations;

namespace DemoAloMundoRest.DTOs;

public class Pessoa{
    [StringLength(50, ErrorMessage = "Máximo 50 caracteres")]
    public string Nome {get; set;} = null!;
    
    [Required(ErrorMessage = "Idade é obrigatória")]
    //validador do tipo range
    [Range(0, 120, ErrorMessage = "A idade deve ser entre 0 e 120 anos")]
    public int? Idade {get; set;}
}