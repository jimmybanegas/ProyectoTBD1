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
    /// There are no comments for Pharma.Domain.Entities.cotizaciones, Pharma.Domain in the schema.
    /// </summary>
    public partial class cotizaciones {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();
        
        #endregion
        /// <summary>
        /// There are no comments for cotizaciones constructor in the schema.
        /// </summary>
        public cotizaciones()
        {
            this.detalle_cotizaciones = new HashSet<detalle_cotizaciones>();
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for id_cotizacion in the schema.
        /// </summary>
        public virtual int id_cotizacion
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for fecha in the schema.
        /// </summary>
        public virtual System.Nullable<System.DateTime> fecha
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for total in the schema.
        /// </summary>
        public virtual System.Nullable<double> total
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for fecha_crea in the schema.
        /// </summary>
        public virtual System.Nullable<System.DateTime> fecha_crea
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for fecha_actu in the schema.
        /// </summary>
        public virtual System.Nullable<System.DateTime> fecha_actu
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for usuario_crea in the schema.
        /// </summary>
        public virtual string usuario_crea
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for usuario_actu in the schema.
        /// </summary>
        public virtual string usuario_actu
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for id_proveedor in the schema.
        /// </summary>
        public virtual int id_proveedor
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for proveedores in the schema.
        /// </summary>
        public virtual proveedores proveedores
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for detalle_cotizaciones in the schema.
        /// </summary>
        public virtual ISet<detalle_cotizaciones> detalle_cotizaciones
        {
            get;
            set;
        }
    }

}
