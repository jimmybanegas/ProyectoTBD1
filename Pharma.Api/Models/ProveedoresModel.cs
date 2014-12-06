using System;
using System.Collections.Generic;
using Pharma.Domain.Entities;

namespace Pharma.Api.Models
{
    public class ProveedoresModel
    {
        public int id_proveedor { get; set; }



        /// There are no comments for direccion in the schema.

        public string direccion { get; set; }



        /// There are no comments for telefono in the schema.

        public string telefono { get; set; }



        /// There are no comments for nombre in the schema.

        public string nombre { get; set; }



        /// There are no comments for contacto in the schema.

        public string contacto { get; set; }



        /// There are no comments for fecha_crea in the schema.

        public DateTime fecha_crea { get; set; }



        /// There are no comments for fecha_actu in the schema.

        public DateTime fecha_actu { get; set; }



        /// There are no comments for usuario_crea in the schema.

        public string usuario_crea { get; set; }



        /// There are no comments for usuario_actu in the schema.

        public string usuario_actu { get; set; }



        /// There are no comments for compras in the schema.

        public ICollection<ComprasModel> compras { get; set; }


        /// There are no comments for cotizaciones in the schema.

        public ICollection<CotizacionesModel> cotizaciones { get; set; }



        /// There are no comments for ordenes_de_compras in the schema.

        public ICollection<OrdenesCompraModel> ordenes_de_compras { get; set; }
    }
}