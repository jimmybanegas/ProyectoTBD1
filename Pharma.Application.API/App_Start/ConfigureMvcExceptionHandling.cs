using System.Collections.Generic;
using System.Web.Mvc;
using Pharma.Application.API.App_Start;

namespace Pharma.Application.API
{
    public class ConfigureMvcExceptionHandling : IBootstrapperTask
    {
        readonly List<IExceptionFilter> _exceptionFilters = new List<IExceptionFilter>();

        #region IBootstrapperTask Members

        public void Run()
        {
            _exceptionFilters.ForEach(x => GlobalFilters.Filters.Add(x));
        }

        #endregion

        public ConfigureMvcExceptionHandling WithWebApiExceptionFilter(IExceptionFilter filter)
        {
            _exceptionFilters.Add(filter);
            return this;
        }
    }
}