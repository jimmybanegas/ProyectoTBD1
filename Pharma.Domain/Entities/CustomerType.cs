﻿//------------------------------------------------------------------------------
// This is auto-generated code.
//------------------------------------------------------------------------------
// This code was generated by Entity Developer tool using NHibernate template.
// Code is generated on: 12/7/2014 11:40:39 PM
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

namespace Pharma.Domain
{

    /// <summary>
    /// There are no comments for Pharma.Domain.CustomerType, Pharma.Domain in the schema.
    /// </summary>
    public partial class CustomerType {
    
        #region Extensibility Method Definitions
        
        /// <summary>
        /// There are no comments for OnCreated in the schema.
        /// </summary>
        partial void OnCreated();
        
        #endregion
        /// <summary>
        /// There are no comments for CustomerType constructor in the schema.
        /// </summary>
        public CustomerType()
        {
            this.TypeName = @"NULL";
            this.CreatedByUser = @"NULL";
            this.ModifiedByUser = @"NULL";
            this.Customers = new HashSet<Customer>();
            OnCreated();
        }

    
        /// <summary>
        /// There are no comments for CustomerTypeId in the schema.
        /// </summary>
        [System.ComponentModel.DataAnnotations.Key]
        [System.ComponentModel.DataAnnotations.Required()]
        public virtual int CustomerTypeId
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for TypeName in the schema.
        /// </summary>
        [System.ComponentModel.DataAnnotations.StringLength(25)]
        public virtual string TypeName
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for CreatedByUser in the schema.
        /// </summary>
        [System.ComponentModel.DataAnnotations.StringLength(25)]
        public virtual string CreatedByUser
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for ModifiedByUser in the schema.
        /// </summary>
        [System.ComponentModel.DataAnnotations.StringLength(25)]
        public virtual string ModifiedByUser
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for CreationDate in the schema.
        /// </summary>
        public virtual System.Nullable<System.DateTime> CreationDate
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for ModifyDate in the schema.
        /// </summary>
        public virtual System.Nullable<System.DateTime> ModifyDate
        {
            get;
            set;
        }

    
        /// <summary>
        /// There are no comments for Customers in the schema.
        /// </summary>
        public virtual ISet<Customer> Customers
        {
            get;
            set;
        }
    }

}