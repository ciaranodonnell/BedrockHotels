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

        public UserViewModel(LegacyDb legacyDb)
        {
            this.IsDirty = true;
            user = new User();
            this.db = legacyDb;
        }

        public UserViewModel(User u, LegacyDb legacyDb)
        {
            this.user = u;
            this.db = legacyDb;
        }


        public bool IsDirty { get; set; }

        public string Username { get => user.Username; set => PropertyChange(user.Username = value); }
        public string Name { get => user.Name; set => PropertyChange(user.Name =value); }
        public string? Password { get => this.passwordBuffer; set => PropertyChange(ref passwordBuffer, value); }
        public bool IsDeleted { get => user.DeletedDate.HasValue; set => PropertyChange(user.DeletedDate = value ? DateTime.Now : null); }


        public bool CanSave { get => 
                !string.IsNullOrEmpty(this.Username) && !string.IsNullOrEmpty(this.Name) && IsDirty;
        }

        public ICommand SaveCommand { get => new ActionCommand(Save); }

        private void Save()
        {
            if (this.IsDirty)
            {
                if (user.UserId == 0)
                {
                    user.Password = Convert.ToBase64String( User.HashPassword(this.Password!));
                    db.Users.Add(user);
                }
                else
                {
                    if (!string.IsNullOrEmpty(this.Password))
                        user.Password = Convert.ToBase64String(User.HashPassword(this.Password));
                }
                db.SaveChanges();
                this.IsDirty = false;
                passwordBuffer = null;
            }
        }

    }
}