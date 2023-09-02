using Bedrock.Database.Model;
using Legacy.Desktop.Stores;
using Microsoft.Expression.Interactivity.Core;
using System.Collections.ObjectModel;
using System.Linq;
using System.Windows.Input;

namespace Legacy.Desktop.Admin.Employees
{
	public class EmployeeAdminViewModel : BaseViewModel
	{
		private readonly LegacyDb db;
		private readonly NavigationStore navigationStore;
		private ObservableCollection<EmployeeEditViewModel> employees = new();
		private EmployeeEditViewModel selectedEmployee;

		public ObservableCollection<EmployeeEditViewModel> Employees { get => employees; set => PropertyChange(ref employees, value); }

		public EmployeeAdminViewModel(LegacyDb legacyDb, NavigationStore navigationStore)
		{
			db = legacyDb;
			this.navigationStore = navigationStore;
			LoadEmployees();
		}

		private void LoadEmployees()
		{
			var employees =
			db.Employees
			.Where(u => u.LeaveDate == null)
			.OrderBy(u => u.LastName).ThenBy(u => u.FirstName).ThenBy(u => u.HiredDate)
			.Select(e => new EmployeeEditViewModel(e, db));
			foreach (var employee in employees)
			{
				Employees.Add(employee);
			}
		}

		public ICommand AddNewUserCommand { get => new ActionCommand(AddNewUserAction); }
		public EmployeeEditViewModel SelectedEmployee { get => selectedEmployee; set => PropertyChange(ref selectedEmployee, value); }

		private void AddNewUserAction()
		{
			Employees.Add(new EmployeeEditViewModel(db));
			SelectedEmployee = Employees.Last();
		}
	}
}
