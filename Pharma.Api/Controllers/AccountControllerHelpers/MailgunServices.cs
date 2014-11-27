using System;
using RestSharp;

namespace Pharma.Api.Controllers.AccountControllerHelpers
{
    public static class MailgunServices
    {
        public static void SendSingUpMessage(string firstName, string lastName, string email, string password)
        {
            var client = new RestClient
            {
                BaseUrl = new Uri("https://api.mailgun.net/v2"),
                Authenticator = new HttpBasicAuthenticator("api",
                    "key-5jhbf96xnkti09j87r5otj-ed4airyo9")
            };
            var request = new RestRequest();
            request.AddParameter("domain",
                "app463aac50f07a4a4b8093c3b4f9fd9445.mailgun.org", ParameterType.UrlSegment);
            request.Resource = "{domain}/messages";
            request.AddParameter("from", "SportLiga <postmaster@app463aac50f07a4a4b8093c3b4f9fd9445.mailgun.org>");
            request.AddParameter("to", firstName + " " + lastName + " <" + email + ">");
            request.AddParameter("bcc", "Jimmy Ramos <jimmy.ramos@unitec.edu>");
            request.AddParameter("subject", "Gracias por registrarse | SportLiga ");
            var message = "Felicidades " + firstName +
                             ", acabas de registrarte, ve a esta dirección (http://sportliga.apphb.com/login) e inicia el mundo de SporLiga.";
            request.AddParameter("html",
                "<html>" + message + "<BR><BR>User Mail: " + email + "<BR>Password: " + password +
                "<BR><BR>Saludos.<BR><BR>" );
            request.Method = Method.POST;
            client.Execute(request);
        }

        internal static void SendRestoreMessage(string firstName, string lastName, string email, string tempPass)
        {
            var client = new RestClient
            {
                BaseUrl = new Uri("https://api.mailgun.net/v2"),
                Authenticator = new HttpBasicAuthenticator("api",
                    "key-5jhbf96xnkti09j87r5otj-ed4airyo9")
            };
            var request = new RestRequest();
            request.AddParameter("domain",
                "app463aac50f07a4a4b8093c3b4f9fd9445.mailgun.org", ParameterType.UrlSegment);
            request.Resource = "{domain}/messages";
            request.AddParameter("from", "SportLiga <postmaster@app463aac50f07a4a4b8093c3b4f9fd9445.mailgun.org>");
            request.AddParameter("to", firstName + " " + lastName + " <" + email + ">");
            request.AddParameter("bcc", "jimmy.ramos@unitec.edu");
            request.AddParameter("subject", "Restablecer Contraseña| SportLiga");
            var message = "Estimado " + firstName +
                           ", ingresa a tu cuenta con esta contraseña: " + tempPass;
            request.AddParameter("html", "<html>" + message + "<BR><BR>Saludos.<BR><BR>");
          
            request.Method = Method.POST;
            client.Execute(request);
        }
    }
}