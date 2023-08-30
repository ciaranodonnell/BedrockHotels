using Microsoft.Expression.Interactivity.Core;
using System;
using System.Collections.Generic;
using System.Windows.Input;

namespace Legacy.Desktop.Stores
{
	public class NavigationStore
	{


		private readonly Stack<BaseViewModel> navigationStack = new();

		public BaseViewModel CurrentViewModel
		{
			get => navigationStack.Peek();
		}

		public ICommand GoBackCommand { get => new ActionCommand(GoBack); }

		/// <summary>
		/// Call this method to go back to the previous view model
		/// </summary>
		public void GoBack()
		{
			if (navigationStack.Count > 1)
			{
				navigationStack.Pop();
				OnNavigated();
			}
		}


		/// <summary>
		/// Call this method to navigate to a new view model
		/// </summary>
		/// <param name="newViewModel"></param>
		public void NavigateTo(BaseViewModel newViewModel)
		{
			navigationStack.Push(newViewModel);
			OnNavigated();
		}


		/// <summary>
		/// Call this method to navigate to a new view model in place of this viewModel
		/// </summary>
		/// <param name="newViewModel"></param>
		public void TransferTo(BaseViewModel newViewModel)
		{
			navigationStack.Pop();
			navigationStack.Push(newViewModel);
			OnNavigated();
		}

		private void OnNavigated()
		{
			this.Navigated?.Invoke();
		}

		public event Action? Navigated;
	}
}

