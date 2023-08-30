using Legacy.Desktop.Login;
using Legacy.Desktop.Model;
using Legacy.Desktop.Stores;
using Microsoft.Extensions.Configuration;
using System.Windows;

namespace Legacy.Desktop
{
	/// <summary>
	/// Interaction logic for App.xaml
	/// </summary>
	public partial class App : Application
	{
		private readonly NavigationStore navigationStore;

		public App()
		{
			this.navigationStore = new NavigationStore();
		}
		override protected void OnStartup(StartupEventArgs e)
		{
			base.OnStartup(e);
			var dbContext = GetDbContext();

			this.navigationStore.CurrentViewModel = new LoginViewModel(dbContext, this.navigationStore);

			var mainWindow = new MainWindow();
			var mainViewModel = new MainViewModel(dbContext, this.navigationStore);
			mainWindow.DataContext = mainViewModel;
			mainWindow.Show();
		}

		private static LegacyDb GetDbContext()
		{
			ConfigurationBuilder configurationBuilder = new ConfigurationBuilder();
			configurationBuilder.AddUserSecrets<App>();
			IConfigurationRoot configurationRoot = configurationBuilder.Build();
			string connectionString = configurationRoot.GetConnectionString("legacydb");
			LegacyDb dbContext = new LegacyDb(connectionString);
			return dbContext;
		}
	}
}
