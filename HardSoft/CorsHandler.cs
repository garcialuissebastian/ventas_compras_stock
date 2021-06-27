﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Text;
using System.Threading;
using System.Threading.Tasks;

namespace HardSoft
{
    public class CorsHandler : DelegatingHandler
    {
        private const string AccessControlAllowHeaders
            = "Access-Control-Allow-Headers";
        private const string AccessControlAllowMethods
            = "Access-Control-Allow-Methods";
        private const string AccessControlAllowOrigin
            = "Access-Control-Allow-Origin";
        private const string AccessControlRequestHeaders
            = "Access-Control-Request-Headers";
        private const string AccessControlRequestMethod
            = "Access-Control-Request-Method";
        private const string Origin = "Origin";

        protected override Task<HttpResponseMessage> SendAsync(
            HttpRequestMessage request,
            CancellationToken cancellationToken)
    {
        var isCorsRequest = request.Headers.Contains(Origin);
        var isPreflightRequest = request.Method == HttpMethod.Options;
 
        if (isCorsRequest)
        {
            if (isPreflightRequest)
            {
                var response = new HttpResponseMessage(HttpStatusCode.OK);
 
                response.Headers.Add(
                    AccessControlAllowOrigin, 
                    request.Headers.GetValues(Origin).First());
 
                var accessControlRequestMethod = request.Headers.GetValues(
                    AccessControlRequestMethod).FirstOrDefault();
 
                if (accessControlRequestMethod != null)
                {
                    response.Headers.Add(
                        AccessControlAllowMethods, 
                        accessControlRequestMethod);
                }
 
                var requestedHeaders = String.Join(", ", 
                    request.Headers.GetValues(AccessControlRequestHeaders));
 
                if (!string.IsNullOrEmpty(requestedHeaders))
                {
                    response.Headers.Add(
                        AccessControlAllowHeaders, 
                        requestedHeaders);
                }
 
                var tcs = new TaskCompletionSource<HttpResponseMessage>();
                tcs.SetResult(response);
                return tcs.Task;
            }
            else
            {
                return base.SendAsync(
                    request, 
                    cancellationToken)
                    .ContinueWith<HttpResponseMessage>(t =>
                {
                    var resp = t.Result;
                    resp.Headers.Add(
                        AccessControlAllowOrigin, 
                        request.Headers.GetValues(Origin).First());
                    return resp;
                });
            }
        }
        else
        {
            return base.SendAsync(request, cancellationToken);
        }
    }
    }
}
