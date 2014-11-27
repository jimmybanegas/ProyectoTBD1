namespace Pharma.Api.Models
{
    public class AccountRegisterResponseModel
    {
        public AccountRegisterResponseModel(string Email, string FirstName, int CaseNumber)
        {
            this.FirstName = FirstName;
            if (CaseNumber == 2)
            {
                Message = ("Tu cuenta ha sido registrada exitosamente bajo el correo: " + Email);
                Status = 2;
            }
            else if (CaseNumber == 0)
            {
                Message = (FirstName + "! Lo sentimos mucho ya existe un usuario registrado con el correo " + Email);
                Status = 0;
            }
        }
        public AccountRegisterResponseModel()
        {
            
        }
        public string FirstName { get; set; }
        public string Message { get; set; }
        public int Status { get; set; }
    }
}