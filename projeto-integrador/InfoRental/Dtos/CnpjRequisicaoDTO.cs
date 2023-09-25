namespace InfoRental.Controllers;

 

using System.ComponentModel.DataAnnotations;

 

public class CnpjRequisicaoDTO

{
    [Required(ErrorMessage = "CnpjCliente é obrigatório")]
    public string cnpjCliente {get;set;}
}