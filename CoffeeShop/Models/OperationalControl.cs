using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Configuration;
using System.IO;
using System;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;

namespace CoffeeShop.Models
{
    public class OperationalControl : ActionFilterAttribute
    {
        public static readonly IConfiguration _config;
        public static IServiceProvider ServiceProvider { get; }
        static OperationalControl()
        {
            var builder = new ConfigurationBuilder()
          .SetBasePath(Directory.GetCurrentDirectory())
          .AddJsonFile("appsettings.json", false, true)
          .AddEnvironmentVariables();
            _config = builder.Build();
        }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            var loginData = context.HttpContext.Session.GetString("Userdetails");
            var admins = context.HttpContext.Session.GetString("admins");
            if (loginData.ToLower() != null)
            {

                //string[] adminList = _config.GetSection("AdminRights").GetSection("admins").Value.Split(';');
                var adminList = admins;
                //string[] adminList2 = _config["AdminRights"].Split(';');

                bool access = false;

                if (string.IsNullOrEmpty(adminList))
                {
                    if (loginData == adminList)
                    {
                        access = true;
                        return;
                    }
                    else
                    {
                        var redirectTarget = new RouteValueDictionary { { "Controller", "Logins" }, { "Action", "AccessDenied" } };
                        context.Result = new RedirectToRouteResult(redirectTarget);
                        return;
                    }
                }
            }
        }
    }
}
