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
    /// There are no comments for Pharma.Domain.Entities.tipo_cliente, Pharma.Domain in the schema.
    /// </summary>
    public partial class tipo_cliente {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();
        
        #endregion
        /// <summary>
        /// There are no comments for tipo_cliente constructor in the schema.
        /// </summary>
        public tipo_cliente()
        {
            this.clientes = new HashSet<clientes>();
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for id_tipocliente in the schema.
        /// </summary>
        public virtual int id_tipocliente
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for descripcion in the schema.
        /// </summary>
        public virtual string descripcion
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
        /// There are no comments for clientes in the schema.
        /// </summary>
        public virtual ISet<clientes> clientes
        {
            get;
            set;
        }
    }

}
