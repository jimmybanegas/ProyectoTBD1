﻿//------------------------------------------------------------------------------
// This is auto-generated code.
//------------------------------------------------------------------------------
// This code was generated by Entity Developer tool using NHibernate template.
// Code is generated on: 28/11/2014 03:52:58 p.m.
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
    /// There are no comments for Pharma.Domain.Entities.compras, Pharma.Domain in the schema.
    /// </summary>
    public partial class compras {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();
        
        #endregion
        /// <summary>
        /// There are no comments for compras constructor in the schema.
        /// </summary>
        public compras()
        {
            this.detalle_compras = new HashSet<detalle_compras>();
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for id_compra in the schema.
        /// </summary>
        public virtual int id_compra
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
        /// There are no comments for detalle_compras in the schema.
        /// </summary>
        public virtual ISet<detalle_compras> detalle_compras
        {
            get;
            set;
        }
    }

}
