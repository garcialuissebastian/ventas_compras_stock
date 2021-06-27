using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace HardSoft
{
    public class ContentTypeHandler : DelegatingHandler
    {
        protected override Task<HttpResponseMessage> SendAsync(
            HttpRequestMessage request,
            CancellationToken cancellationToken)
        {
            if (request.Method == HttpMethod.Post
                && request.Content.Headers.ContentType == null)
            {
                request.Content.Headers.ContentType
                    = new MediaTypeHeaderValue("application/json");
            }

            return base.SendAsync(request, cancellationToken);
        }
    }
}
