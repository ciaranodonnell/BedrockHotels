using Legacy.Desktop.Admin;
using Legacy.Desktop.Login;
using Legacy.Desktop.Model;
using Legacy.Desktop.Stores;
using Microsoft.Expression.Interactivity.Core;
using System.Windows.Input;

namespace Legacy.Desktop.Home
{
	internal class HomeViewModel : BaseViewModel
	{
		private LoginViewModel login;
		private bool isLoggedIn;
		private LegacyDb dbContext;
		private NavigationStore navigationStore;

		public HomeViewModel(LegacyDb dbContext, NavigationStore navigationStore)
		{
			this.dbContext = dbContext;
			this.navigationStore = navigationStore;
		}

		public ICommand UserAdminCommand { get => new ActionCommand(() => navigationStore.NavigateTo(new UserManagementViewModel(dbContext, navigationStore))); }




	}
}
