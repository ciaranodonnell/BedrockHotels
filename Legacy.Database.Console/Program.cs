using DbUp;
using System.Configuration;
using System.Reflection;

namespace Legacy.Database.Updater
{
    internal class Program
    {
        
        public static void Main(string[] args)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["localdb"].ConnectionString;

            var runner = DeployChanges.To.SqlDatabase(connectionString)
                .WithScriptsEmbeddedInAssembly(Assembly.GetExecutingAssembly())
                .LogToConsole()
                .Build();

            var result = runner.PerformUpgrade();

            if (!result.Successful)
            {
                Console.BackgroundColor = ConsoleColor.Red;
                Console.WriteLine(result.Error);
                Console.ResetColor();
            }
            else
            {
                Console.WriteLine("Scripts deployed successfully");
            }
            Console.ReadLine();
        }
    }
}