using Legacy.Desktop.Home;
using Legacy.Desktop.Login;
using Legacy.Desktop.Model;
using Legacy.Desktop.Stores;

namespace Legacy.Desktop
{
	internal class MainViewModel : BaseViewModel
	{
		private readonly LegacyDb db;
		private readonly NavigationStore navigationStore;

		public MainViewModel(LegacyDb dbContext, Stores.NavigationStore navigationStore)
		{
			this.db = dbContext;
			this.navigationStore = navigationStore;
			this.Login = new LoginViewModel(dbContext);
			this.Home = new HomeViewModel(Login);
		}
		public LoginViewModel Login { get; private set; }

		public HomeViewModel Home { get; private set; }

		public BaseViewModel CurrentViewModel { get => navigationStore.CurrentViewModel; }

	}
}
