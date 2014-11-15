using System.Configuration;
namespace Pharma.Infrastructure
{
    public class ConnectionStrings
    {
        public static string Get()
        {
            var local = ConfigurationManager.ConnectionStrings["local"].ToString();
            var apphb = ConfigurationManager.ConnectionStrings["apphb"].ToString();
            //Other two connections here

            var environment = (ConfigurationManager.AppSettings["Environment"] ?? "").ToLower();
            var connectionStringToUse = local;

            if (environment == "qa" || environment == "remote")
            {
                connectionStringToUse = apphb;
            }
            else if (environment == "production")
            {
                connectionStringToUse = string.Empty;
            }

            return connectionStringToUse;
        }
    }
}
