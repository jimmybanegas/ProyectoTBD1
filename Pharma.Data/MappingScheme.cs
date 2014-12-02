using System;
using AcklenAvenue.Data;
using FluentNHibernate.Automapping;
using FluentNHibernate.Cfg;
using FluentNHibernate.Conventions.Helpers;
using NHibernate.Cfg.MappingSchema;
using Pharma.Domain.Entities;

namespace Pharma.Data
{
    public class MappingScheme : IDatabaseMappingScheme<MappingConfiguration>
    {
        public Action<MappingConfiguration> Mappings
        {
            get
            {
                /*AutoPersistenceModel autoPersistenceModel = AutoMap.Assemblies(typeof (IEntity).Assembly)
                    .Where(t => typeof (IEntity).IsAssignableFrom(t))
                    //.UseOverridesFromAssemblyOf<CompanyAutoMappingOverride>()
                    //.IncludeBase<LessonActionBase>()
                    .Conventions.Add(DefaultCascade.All());*/

                AutoPersistenceModel autoPersistenceModel = AutoMap.Assembly(System.Reflection.Assembly.GetCallingAssembly())
                   
                   .Where(t => t.Namespace == "Pharma.Domain.Entities")
                  // .Where(t => typeof(tipo_cliente).IsAssignableFrom(t))
                    //.UseOverridesFromAssemblyOf<CompanyAutoMappingOverride>()
                    //.IncludeBase<LessonActionBase>()
                   .Conventions.Add(DefaultCascade.All());
                   

                return x => x.AutoMappings.Add(autoPersistenceModel);
            }
        }
    }
}