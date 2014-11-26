using System.Text.RegularExpressions;
using Pharma.Api.Models;
using Pharma.Domain.Services;

namespace Pharma.Api.Controllers.AccountControllerHelpers
{
    public class RestorePassEmailValidator : IRegisterValidator<ChangePassModel>
    {
        public string Validate(ChangePassModel model)
        {
            return IsValidEmail(model.Email) ? "Formato de Correo Incorrecto" : "";
        }

        public static bool IsValidEmail(string strMailAddress)
        {
            // Return true if strMailAddress is invalid e-mail format.
            return Regex.IsMatch(strMailAddress,
            @"^(?("")("".+?""@)|(([0-9a-zA-Z]((\.(?!\.))
            |[-!#\$%&'\*\+/=\?\^`\{\}\|~\w])*)(?<=[0-9a-zA-Z])@))"
            + @"(?(\[)(\[(\d{1,3}\.){3}\d{1,3}\])|(([0-9a-zA-Z][-\w]*[0-9a-zA-Z]\.)
            +[a-zA-Z]{2,6}))$");
        }
    }
}