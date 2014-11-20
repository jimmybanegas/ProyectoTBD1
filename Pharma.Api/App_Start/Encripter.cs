using Encryptamajig;

namespace Pharma.Api
{
    public class Encripter
    {
        private const string key = "^#*GSdb38";

        public static string Encrypt(string plainText)
        {
            return AesEncryptamajig.Encrypt(plainText, key);
        }

        public static string Decrypt(string cipherText)
        {
            return AesEncryptamajig.Decrypt(cipherText, key);
        }
    }
}