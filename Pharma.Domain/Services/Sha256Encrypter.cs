using System;
using System.Security.Cryptography;
using System.Text;

namespace Pharma.Domain.Services
{
    public class Sha256Encrypter : IEncryption
    {
        public string Encrypt(string content)
        {
            SHA256Managed hasher = new SHA256Managed();
            byte[] textWithSaltBytes = Encoding.UTF8.GetBytes(string.Concat(content, "ultraSafeSalt"));
            byte[] hashedBytes = hasher.ComputeHash(textWithSaltBytes);
            hasher.Clear();
            return Convert.ToBase64String(hashedBytes);
        }
    }
}
