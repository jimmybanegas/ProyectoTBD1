﻿//------------------------------------------------------------------------------
// This is auto-generated code.
//------------------------------------------------------------------------------
// This code was generated by Entity Developer tool using NHibernate template.
// Code is generated on: 20/11/2014 01:30:03 p.m.
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
    /// There are no comments for Pharma.Domain.Entities.direcciones_clientes, Pharma.Domain in the schema.
    /// </summary>
    public partial class direcciones_clientes {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();

        public override bool Equals(object obj)
        {
          direcciones_clientes toCompare = obj as direcciones_clientes;
          if (toCompare == null)
          {
            return false;
          }

          if (!Object.Equals(this.id_direccioncliente, toCompare.id_direccioncliente))
            return false;
          if (!Object.Equals(this.direccion, toCompare.direccion))
            return false;
          if (!Object.Equals(this.id_cliente, toCompare.id_cliente))
            return false;
          
          return true;
        }

        public override int GetHashCode()
        {
          int hashCode = 13;
          hashCode = (hashCode * 7) + id_direccioncliente.GetHashCode();
          hashCode = (hashCode * 7) + direccion.GetHashCode();
          hashCode = (hashCode * 7) + id_cliente.GetHashCode();
          return hashCode;
        }
        
        #endregion
        /// <summary>
        /// There are no comments for direcciones_clientes constructor in the schema.
        /// </summary>
        public direcciones_clientes()
        {
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for id_direccioncliente in the schema.
        /// </summary>
        public virtual int id_direccioncliente
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for direccion in the schema.
        /// </summary>
        public virtual string direccion
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for id_cliente in the schema.
        /// </summary>
        public virtual int id_cliente
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
        public virtual clientes clientes
        {
            get;
            set;
        }
    }

}
