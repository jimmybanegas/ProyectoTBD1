﻿//------------------------------------------------------------------------------
// This is auto-generated code.
//------------------------------------------------------------------------------
// This code was generated by Entity Developer tool using NHibernate template.
// Code is generated on: 14/11/2014 06:38:23 p.m.
//
// Changes to this file may cause incorrect behavior and will be lost if
// the code is regenerated.
//------------------------------------------------------------------------------

namespace Pharma.Domain.Entities
{

    /// <summary>
    /// There are no comments for Pharma.Domain.kardex, Pharma.Domain in the schema.
    /// </summary>
    public partial class kardex {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();
        
        #endregion
        /// <summary>
        /// There are no comments for kardex constructor in the schema.
        /// </summary>
        public kardex()
        {
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for id_operacion in the schema.
        /// </summary>
        public virtual int id_operacion
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
        /// There are no comments for costo in the schema.
        /// </summary>
        public virtual System.Nullable<double> costo
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for inv_antes in the schema.
        /// </summary>
        public virtual System.Nullable<int> inv_antes
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for inv_despues in the schema.
        /// </summary>
        public virtual System.Nullable<int> inv_despues
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
        /// There are no comments for usuario_crea in the schema.
        /// </summary>
        public virtual string usuario_crea
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for precio in the schema.
        /// </summary>
        public virtual System.Nullable<double> precio
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for id_tipotran in the schema.
        /// </summary>
        public virtual int id_tipotran
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for tipo_transacciones in the schema.
        /// </summary>
        public virtual tipo_transacciones tipo_transacciones
        {
            get;
            set;
        }
    }

}
