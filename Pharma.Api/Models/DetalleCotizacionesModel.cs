namespace Pharma.Api.Models
{
    public class DetalleCotizacionesModel
    {
        public  int num_detalle { get; set; }


        public  int id_cotizacion { get; set; }


        public  int cantidad { get; set; }


        public  double precio_unit { get; set; }


        public  string cod_prod { get; set; }


        public  ProductosModel productos { get; set; }
    }
}