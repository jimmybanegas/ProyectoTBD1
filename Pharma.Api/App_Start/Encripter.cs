namespace Pharma.Api
{
    public class Encripter
    {
        const string key = "^#*GSdb38";

        public static string Encrypt(string plainText)
        {
            return Encryptamajig.AesEncryptamajig.Encrypt(plainText, key);
        }

        public static string Decrypt(string cipherText)
        {
            return Encryptamajig.AesEncryptamajig.Decrypt(cipherText, key);
        }
    }
}