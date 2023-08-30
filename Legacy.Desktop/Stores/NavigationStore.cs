namespace Legacy.Desktop.Stores
{
	public class NavigationStore
	{
		private BaseViewModel currentViewModel;

		public BaseViewModel CurrentViewModel
		{ get => currentViewModel; set { currentViewModel = value; OnCurrentViewModelChanged(); } }
	}
}
}
