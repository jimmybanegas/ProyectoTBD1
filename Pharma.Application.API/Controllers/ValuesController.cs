using System.Collections.Generic;
using System.Web.Http;
using AttributeRouting.Web.Http;

namespace Pharma.Application.API.Controllers
{
    public class ValuesController : ApiController
    {
        // GET api/values
        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("api/values")]
        public IEnumerable<string> Get()
        {
            return new string[] { "value1", "value2" };
        }

        // GET api/values/5
        [HttpGet]
        [AcceptVerbs("GET", "HEAD")]
        [GET("api/values/{id}")]
        public string Get(int id)
        {
            return "value";
        }

        // POST api/values
        [HttpPost]
        [AcceptVerbs("POST", "HEAD")]
        [POST("api/values")]
        public void Post([FromBody]string value)
        {
        }

        // PUT api/values/5
        [HttpPut]
        [AcceptVerbs("PUT", "HEAD")]
        [PUT("api/values/{id}")]
        public void Put(int id, [FromBody]string value)
        {
        }

        // DELETE api/values/5
        [HttpDelete]
        [AcceptVerbs("DELETE", "HEAD")]
        [DELETE("api/values/{id}")]
        public void Delete(int id)
        {
        }
    }
}