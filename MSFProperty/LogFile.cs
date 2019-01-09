namespace MSFProperty
{
    using System;
    using System.IO;
    using System.Reflection;


    public class LogWriter
    {
        private string m_exePath = string.Empty;
        public LogWriter(string logMessage, string location)
        {
            LogWrite(logMessage, location);
        }
        public void LogWrite(string logMessage, string location)
        {
            m_exePath = location;

            try
            {
                using (StreamWriter w = File.AppendText(m_exePath + "\\" + "log.txt"))
                {
                    Log(logMessage, w);
                }
            }
            catch (Exception ex)
            {
                //TODO add exception
              
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
            }
            catch (Exception ex)
            {
                //TODO add exception
              
            }
        }
    }
}