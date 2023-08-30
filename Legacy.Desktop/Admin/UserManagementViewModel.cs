using Legacy.Desktop.Model;
using Microsoft.EntityFrameworkCore;
using Microsoft.Expression.Interactivity.Core;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Input;

namespace Legacy.Desktop.Admin
{
    internal class UserManagementViewModel : BaseViewModel
    {
        private LegacyDb db;
        private ObservableCollection<UserViewModel> users = new();
        private UserViewModel selectedUser;

        public ObservableCollection<UserViewModel> Users { get => users; set => PropertyChange(ref users, value); }

        public UserManagementViewModel(LegacyDb legacyDb)
        {
            this.db = legacyDb;
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

        public ICommand AddNewUser { get => new ActionCommand(AddNewUserAction); }
        public UserViewModel SelectedUser { get => selectedUser; private set => PropertyChange(ref selectedUser , value); }

        private void AddNewUserAction()
        {
            Users.Add(new UserViewModel(db));
            SelectedUser = Users.Last();
        }
    }
}
