using System;
using System.Collections.Generic;

namespace Pharma.Api.Models
{
    public class ProductosModel
    {
        public string cod_prod { get; set; }


        public int existencia { get; set; }



        public DateTime fecha_venc { get; set; }

        public double? costo { get; set; }


        public double precio_consumi { get; set; }

        public double precio_mayor { get; set; }

        public string nombre { get; set; }

        public int cod_presentacion { get; set; }

        public int existencia_min { get; set; }

        public int existencia_max { get; set; }

        public int porcentaje_m { get; set; }

        public DateTime fecha_crea { get; set; }


        public DateTime fecha_actu { get; set; }

        
        public string usuario_crea { get; set; }


        public string usuario_actu { get; set; }

        public PresentacionModel presentacion_productos { get; set; }

        public ICollection<CategoriasModel> productos_has_categoria_productos { get; set; }
    }
}
