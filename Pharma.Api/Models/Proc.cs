using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Pharma.Api.Models
{
    public class Proc
    {
        public string descripcion { get; set; }
        public DateTime fecha_crea { get; set; }
        public DateTime fecha_actu { get; set; }
        public string usuario_crea { get; set; }
        public string usuario_actu { get; set; }

    }
}