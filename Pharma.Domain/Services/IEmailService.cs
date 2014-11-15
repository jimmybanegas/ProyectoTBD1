using System.Collections.Generic;

namespace Pharma.Domain.Services
{
    public interface IEmailService
    {
        void SendEmail(List<string> toList, string from, string subject, string message);
    }
}