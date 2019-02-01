using System;
using System.Diagnostics;
using System.IO;
using MSFProperty.Admin.EF;

namespace MSFProperty
{
    //TODO add log into a database 

    public class LogWriter
    {
        private string _mExePath = string.Empty;

        public LogWriter(string logMessage, string location)
        {
            LogWrite(logMessage, location);
        }

        public void LogWrite(string logMessage, string location)
        {
            _mExePath = location;

            try
            {
                using (var w = File.AppendText(_mExePath + "\\" + "log.txt"))
                {
                    Log(logMessage, w);
                }
            }
            catch (Exception ex)
            {
                using (var db = new Model1())
                {
                    var error = new ErrorReporting
                    {
                        Error = logMessage,
                        File = ex.ToString(),
                        Date = DateTime.Now
                    };

                    db.ErrorReportings.Add(error);
                    db.SaveChanges();
                }
            }
        }

        public void Log(string logMessage, TextWriter txtWriter)
        {
            try
            {
                txtWriter.Write("\r\nLog Entry : ");
                txtWriter.WriteLine("{0} {1}", DateTime.Now.ToLongTimeString(),
                    DateTime.Now.ToLongDateString());
                txtWriter.WriteLine("  :");
                txtWriter.WriteLine("  :{0}", logMessage);
                txtWriter.WriteLine("-------------------------------");
                var ae = new StackTrace();
                using (var db = new Model1())
                {
                    var error = new ErrorReporting
                    {
                        Error = logMessage,
                        File = ae.ToString(),
                        Date = DateTime.Now
                    };

                    db.ErrorReportings.Add(error);
                    db.SaveChanges();
                }
            }
            catch (Exception ex)
            {
                using (var db = new Model1())
                {
                    var error = new ErrorReporting
                    {
                        Error = logMessage,
                        File = ex.ToString(),
                        Date = DateTime.Now
                    };

                    db.ErrorReportings.Add(error);
                    db.SaveChanges();
                }
            }
        }
    }
}