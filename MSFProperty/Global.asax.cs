﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Routing;
using System.Web.UI;

namespace MSFProperty
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
            //string JQueryVer = "1.7.1";
            //ScriptManager.ScriptResourceMapping.AddDefinition("jquery", new ScriptResourceDefinition
            //{
            //    Path = "~/Scripts/jquery-" + JQueryVer + ".min.js",
            //    DebugPath = "~/Scripts/jquery-" + JQueryVer + ".js",
            //    CdnPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".min.js",
            //    CdnDebugPath = "http://ajax.aspnetcdn.com/ajax/jQuery/jquery-" + JQueryVer + ".js",
            //    CdnSupportsSecureConnection = true,
            //    LoadSuccessExpression = "window.jQuery"
            //});
        }
    }
}