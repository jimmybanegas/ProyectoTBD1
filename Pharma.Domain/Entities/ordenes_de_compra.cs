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
    /// There are no comments for Pharma.Domain.Entities.ordenes_de_compra, Pharma.Domain in the schema.
    /// </summary>
    public partial class ordenes_de_compra {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();
        
        #endregion
        /// <summary>
        /// There are no comments for ordenes_de_compra constructor in the schema.
        /// </summary>
        public ordenes_de_compra()
        {
            this.detalle_ocs = new HashSet<detalle_oc>();
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for id_ordencompra in the schema.
        /// </summary>
        public virtual int id_ordencompra
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
        /// There are no comments for id_proveedor in the schema.
        /// </summary>
        public virtual int id_proveedor
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for ejecutada in the schema.
        /// </summary>
        public virtual System.Nullable<bool> ejecutada
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for cancelada in the schema.
        /// </summary>
        public virtual System.Nullable<bool> cancelada
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for activa in the schema.
        /// </summary>
        public virtual System.Nullable<bool> activa
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
        /// There are no comments for detalle_ocs in the schema.
        /// </summary>
        public virtual ISet<detalle_oc> detalle_ocs
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
    }

}
