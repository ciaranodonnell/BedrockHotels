using Bedrock.Database.Model;

namespace Legacy.Desktop.Admin.Employees
{
	public class EmployeeAddressViewModel : BaseViewModel
	{
		private Employee e;

		public EmployeeAddressViewModel(Employee e)
		{
			this.e = e;
		}
	}
}
