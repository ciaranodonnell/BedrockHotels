using Legacy.Desktop.Model;
using Microsoft.Expression.Interactivity.Core;
using System;
using System.Windows.Input;

namespace Legacy.Desktop.Admin
{
	internal class UserViewModel : BaseViewModel
	{
		private readonly LegacyDb db;
		private User user;
		private string? passwordBuffer;
		public bool isEditing = false;

		public UserViewModel(LegacyDb legacyDb)
		{
			this.IsDirty = true;
			user = new User();
			this.isEditing = true;
			this.db = legacyDb;
		}

		public UserViewModel(User u, LegacyDb legacyDb)
		{
			this.user = u;
			this.db = legacyDb;
		}


		public bool IsDirty { get; set; }

		public string Username { get => user.Username; set { PropertyChange(user.Username = value); IsDirty = true; } }
		public string Name { get => user.Name; set { PropertyChange(user.Name = value); IsDirty = true; } }
		public string? Password { get => this.passwordBuffer; set { PropertyChange(ref passwordBuffer, value); IsDirty = true; } }
		public DateTime? DeletedDate { get => user.DeletedDate; set { PropertyChange(user.DeletedDate = value); IsDirty = true; } }


		public bool IsDeleted
		{
			get => user.DeletedDate.HasValue; set
			{
				PropertyChange(user.DeletedDate = value ? DateTime.Now : null);
				IsDirty = true;
				if (value)
				{
					DeletedDate = DateTime.Now;
				}
				else
				{
					DeletedDate = null;
				}
			}
		}




		public bool CanSave
		{
			get =>
				!string.IsNullOrEmpty(this.Username) && !string.IsNullOrEmpty(this.Name) && IsDirty;
		}


		public bool IsEditing { get => isEditing; set => PropertyChange(isEditing = value); }

		public ICommand SaveCommand { get => new ActionCommand(Save); }

		private void Save()
		{
			if (this.IsDirty)
			{
				if (user.UserId == 0)
				{
					user.Password = Convert.ToBase64String(User.HashPassword(this.Password!));
					db.Users.Add(user);
				}
				else
				{
					if (!string.IsNullOrEmpty(this.Password))
					{
						user.Password = Convert.ToBase64String(User.HashPassword(this.Password));
					}
				}
				db.SaveChanges();
				this.IsDirty = false;
				this.IsEditing = false;
				passwordBuffer = null;
			}
		}

		public ICommand CancelEditingCommand { get => new ActionCommand(CancelEditing); }
		public void CancelEditing()
		{
			if (user.UserId == 0)
			{
				db.Users.Remove(user);
			}
			else
			{
				db.Entry(user).Reload();
			}
			this.IsEditing = false;
			this.IsDirty = false;
			passwordBuffer = null;
		}

		public ICommand EditCommand { get => new ActionCommand(Edit); }

		private void Edit()
		{
			this.IsEditing = true;
		}

	}
}