using Bedrock.Database.Model;
using Legacy.Desktop.Stores;
using Microsoft.Expression.Interactivity.Core;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;

namespace Legacy.Desktop.Admin.Users
{
	internal class UserManagementViewModel : BaseViewModel
	{
		private readonly LegacyDb db;
		private readonly NavigationStore navigationStore;
		private ObservableCollection<UserViewModel> users = new();
		private UserViewModel selectedUser;

		public ObservableCollection<UserViewModel> Users { get => users; set => PropertyChange(ref users, value); }

		public UserManagementViewModel(LegacyDb legacyDb, NavigationStore navigationStore)
		{
			db = legacyDb;
			this.navigationStore = navigationStore;
			LoadUsers();
		}

		private void LoadUsers()
		{
			var users =
			db.Users
			.Where(u => u.DeletedDate == null)
			.OrderBy(u => u.Username)
			.Select(u => new UserViewModel(u, db));
			foreach (var user in users)
			{
				Users.Add(user);
			}
		}

		public ICommand AddNewUserCommand { get => new ActionCommand(AddNewUserAction); }
		public UserViewModel SelectedUser { get => selectedUser; set => PropertyChange(ref selectedUser, value); }

		private void AddNewUserAction()
		{
			Users.Add(new UserViewModel(db));
			SelectedUser = Users.Last();
		}
	}
}
