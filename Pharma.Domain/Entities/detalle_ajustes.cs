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
    /// There are no comments for Pharma.Domain.Entities.detalle_ajustes, Pharma.Domain in the schema.
    /// </summary>
    public partial class detalle_ajustes {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();

        public override bool Equals(object obj)
        {
          detalle_ajustes toCompare = obj as detalle_ajustes;
          if (toCompare == null)
          {
            return false;
          }

          if (!Object.Equals(this.num_detalle, toCompare.num_detalle))
            return false;
          if (!Object.Equals(this.id_ajuste, toCompare.id_ajuste))
            return false;
          
          return true;
        }

        public override int GetHashCode()
        {
          int hashCode = 13;
          hashCode = (hashCode * 7) + num_detalle.GetHashCode();
          hashCode = (hashCode * 7) + id_ajuste.GetHashCode();
          return hashCode;
        }
        
        #endregion
        /// <summary>
        /// There are no comments for detalle_ajustes constructor in the schema.
        /// </summary>
        public detalle_ajustes()
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
        /// There are no comments for id_ajuste in the schema.
        /// </summary>
        public virtual int id_ajuste
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
        /// There are no comments for cod_prod in the schema.
        /// </summary>
        public virtual string cod_prod
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for ajustes in the schema.
        /// </summary>
        public virtual ajustes ajustes
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
