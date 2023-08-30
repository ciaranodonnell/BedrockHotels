using Legacy.Desktop.Stores;

namespace Legacy.Desktop
{
	internal class MainViewModel : BaseViewModel
	{
		private readonly NavigationStore navigationStore;

		public MainViewModel(Stores.NavigationStore navigationStore)
		{
			this.navigationStore = navigationStore;
			navigationStore.Navigated += OnNavigated;
		}

		private void OnNavigated()
		{
			PropertyChange(CurrentViewModel, nameof(CurrentViewModel));
		}

		public BaseViewModel CurrentViewModel { get => navigationStore.CurrentViewModel; }


	}
}
