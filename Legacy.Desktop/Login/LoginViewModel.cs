using Legacy.Desktop.Model;
using Legacy.Desktop.Stores;
using Microsoft.Expression.Interactivity.Core;
using System;
using System.Linq;
using System.Security;
using System.Windows.Input;

namespace Legacy.Desktop.Login
{
	internal class LoginViewModel : BaseViewModel
	{
		private readonly LegacyDb db;
		private SecureString password = new SecureString();
		private string username;
		private string error;
		private bool isLoggedIn;
		private User? loggedInUser;
		private NavigationStore navigationStore;


		public LoginViewModel(LegacyDb dbContext, NavigationStore navigationStore)
		{
			this.db = dbContext;
			this.navigationStore = navigationStore;
		}

		public string Username { get => username; set => PropertyChange(username = value); }
		public SecureString Password { private get => password; set => PropertyChange(password = value); }
		public ICommand LoginCommand => new ActionCommand(Login);

		private void Login()
		{

			try
			{
				this.LoggedInUser = db.Users.Where(u => u.Username == Username && u.Password == Convert.ToBase64String(User.HashPassword(Password.ToString()))).FirstOrDefault();
				if (LoggedInUser == null)
				{
					//TODO: Remove this code - it inserts new users for testing if the user doesn't exist
					if (db.Users.Where(u => u.Username == Username).Count() == 0)
					{
						var user = db.Users.Add(new User { Username = this.username, Password = Convert.ToBase64String(User.HashPassword(this.Password.ToString())), Name = "New User" });
						db.SaveChanges();
						this.LoggedInUser = user.Entity;
						this.IsLoggedIn = true;
					}
					else
					{
						this.Error = "Invalid username or password";
					}
				}
				else
				{
					this.Error = string.Empty;
					this.IsLoggedIn = true;
					navigationStore.GoBack();
				}
			}
			catch (Exception ex)
			{
				this.Error = "An Error Occurred";
			}
		}

		public User? LoggedInUser { get => loggedInUser; set => PropertyChange(loggedInUser = value); }

		public ICommand CancelCommand => new ActionCommand(Cancel);

		public string Error { get => error; private set => PropertyChange(error = value); }
		public bool IsLoggedIn { get => isLoggedIn; private set => PropertyChange(isLoggedIn = value); }

		public void Cancel()
		{
			Username = string.Empty;
			Password = new SecureString();
			Error = string.Empty;
		}
	}
}
