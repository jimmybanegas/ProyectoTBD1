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
    /// There are no comments for Pharma.Domain.Entities.contactos_clientes, Pharma.Domain in the schema.
    /// </summary>
    public partial class contactos_clientes {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();

        public override bool Equals(object obj)
        {
          contactos_clientes toCompare = obj as contactos_clientes;
          if (toCompare == null)
          {
            return false;
          }

          if (!Object.Equals(this.id_contactocliente, toCompare.id_contactocliente))
            return false;
          if (!Object.Equals(this.nombre, toCompare.nombre))
            return false;
          if (!Object.Equals(this.correo, toCompare.correo))
            return false;
          if (!Object.Equals(this.telefono, toCompare.telefono))
            return false;
          if (!Object.Equals(this.id_cliente, toCompare.id_cliente))
            return false;
          
          return true;
        }

        public override int GetHashCode()
        {
          int hashCode = 13;
          hashCode = (hashCode * 7) + id_contactocliente.GetHashCode();
          hashCode = (hashCode * 7) + nombre.GetHashCode();
          hashCode = (hashCode * 7) + correo.GetHashCode();
          hashCode = (hashCode * 7) + telefono.GetHashCode();
          hashCode = (hashCode * 7) + id_cliente.GetHashCode();
          return hashCode;
        }
        
        #endregion
        /// <summary>
        /// There are no comments for contactos_clientes constructor in the schema.
        /// </summary>
        public contactos_clientes()
        {
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for id_contactocliente in the schema.
        /// </summary>
        public virtual int id_contactocliente
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for nombre in the schema.
        /// </summary>
        public virtual string nombre
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for correo in the schema.
        /// </summary>
        public virtual string correo
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for telefono in the schema.
        /// </summary>
        public virtual string telefono
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
