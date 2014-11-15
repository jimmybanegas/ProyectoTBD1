using System.Collections.Generic;
using Pharma.Domain.Services;
using RestSharp;

namespace Pharma.Infrastructure
{
    public class MailGunEmailService : IEmailService
    {
        /// <summary>
        /// 
        /// </summary>
        /// <param name="toList">The list of recipients. Should be inthe format "Name &lt;email@somewhere.com&gt;"</param>
        /// <param name="from">The sender. Should be inthe format "Name &lt;email@somewhere.com&gt;"</param>
        /// <param name="subject"></param>
        /// <param name="message"></param>
        public void SendEmail(List<string> toList, string from, string subject, string message)
        {
            SendMessage(toList, from, subject, message);
        }

        public static IRestResponse SendMessage(List<string> to, string from, string subject, string mesage)
        {
            RestClient client = new RestClient();
            client.BaseUrl = "https://api.mailgun.net/v2";
            client.Authenticator =
                   new HttpBasicAuthenticator("api",
                                              "key-782c692a05e48feea869b745b5033f5c");
            RestRequest request = new RestRequest();
            request.AddParameter("domain",
                                "sandbox20ebb2e60de0413d8d2ba4e806f6b318.mailgun.org", ParameterType.UrlSegment);
            request.Resource = "{domain}/messages";
            request.AddParameter("from", from);
            foreach (string destin in to)
            {
                request.AddParameter("to", destin);
            }

            request.AddParameter("subject", subject);
            request.AddParameter("text", mesage);
            request.Method = Method.POST;
            return client.Execute(request);
        }
    }
}
