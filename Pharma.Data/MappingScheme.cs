﻿using System;
using AcklenAvenue.Data;
using FluentNHibernate.Automapping;
using FluentNHibernate.Cfg;
using FluentNHibernate.Conventions.Helpers;
using Pharma.Domain.Entities;

namespace Pharma.Data
{
    public class MappingScheme : IDatabaseMappingScheme<MappingConfiguration>
    {
        public Action<MappingConfiguration> Mappings
        {
            get
            {
                AutoPersistenceModel autoPersistenceModel = AutoMap.Assemblies(typeof (IEntity).Assembly)
                    .Where(t => typeof (IEntity).IsAssignableFrom(t))
                    //.UseOverridesFromAssemblyOf<CompanyAutoMappingOverride>()
                    //.IncludeBase<LessonActionBase>()
                    .Conventions.Add(DefaultCascade.All());

                return x => x.AutoMappings.Add(autoPersistenceModel);
            }
        }
    }
}