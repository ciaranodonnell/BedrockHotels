using Legacy.Desktop.Login;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Legacy.Desktop.Home
{
    internal class HomeViewModel : BaseViewModel
    {
        private LoginViewModel login;
        private bool isLoggedIn;

        public HomeViewModel(LoginViewModel login)
        {
            this.login = login;
            this.login.PropertyChanged += Login_PropertyChanged;  
        }

        private void Login_PropertyChanged(object? sender, PropertyChangedEventArgs e)
        {
            if (e.PropertyName == nameof(LoginViewModel.IsLoggedIn))
            {
                this.IsLoggedIn = login.IsLoggedIn;
            }
        }

        public LoginViewModel Login { get => login; private set => PropertyChange(login = value); }
        public bool IsLoggedIn { get => isLoggedIn; private set => PropertyChange(isLoggedIn = value); }
    }
}
