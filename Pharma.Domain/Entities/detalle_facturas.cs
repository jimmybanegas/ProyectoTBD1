﻿//------------------------------------------------------------------------------
// This is auto-generated code.
//------------------------------------------------------------------------------
// This code was generated by Entity Developer tool using NHibernate template.
// Code is generated on: 01/12/2014 11:21:37 p.m.
//
// Changes to this file may cause incorrect behavior and will be lost if
// the code is regenerated.
//------------------------------------------------------------------------------

using System;
using System.Collections;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Collections.Generic;

namespace Pharma.Domain.Entities
{

    /// <summary>
    /// There are no comments for Pharma.Domain.Entities.detalle_facturas, Pharma.Domain in the schema.
    /// </summary>
    public partial class detalle_facturas {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();

        public override bool Equals(object obj)
        {
          detalle_facturas toCompare = obj as detalle_facturas;
          if (toCompare == null)
          {
            return false;
          }

          if (!Object.Equals(this.num_detalle, toCompare.num_detalle))
            return false;
          if (!Object.Equals(this.num_factura, toCompare.num_factura))
            return false;
          
          return true;
        }

        public override int GetHashCode()
        {
          int hashCode = 13;
          hashCode = (hashCode * 7) + num_detalle.GetHashCode();
          hashCode = (hashCode * 7) + num_factura.GetHashCode();
          return hashCode;
        }
        
        #endregion
        /// <summary>
        /// There are no comments for detalle_facturas constructor in the schema.
        /// </summary>
        public detalle_facturas()
        {
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for num_detalle in the schema.
        /// </summary>
        public virtual int num_detalle
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for num_factura in the schema.
        /// </summary>
        public virtual int num_factura
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for precio_venta in the schema.
        /// </summary>
        public virtual System.Nullable<double> precio_venta
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for cantidad in the schema.
        /// </summary>
        public virtual System.Nullable<int> cantidad
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for subtotal in the schema.
        /// </summary>
        public virtual System.Nullable<double> subtotal
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for cod_prod in the schema.
        /// </summary>
        public virtual string cod_prod
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for facturas in the schema.
        /// </summary>
        public virtual facturas facturas
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for productos in the schema.
        /// </summary>
        public virtual productos productos
        {
            get;
            set;
        }
    }

}
