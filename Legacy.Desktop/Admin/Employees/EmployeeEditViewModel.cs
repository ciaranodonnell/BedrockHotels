using Bedrock.Database.Model;
using Microsoft.Expression.Interactivity.Core;
using System;
using System.Windows.Input;

namespace Legacy.Desktop.Admin.Employees
{
	public class EmployeeEditViewModel : BaseViewModel
	{
		private readonly LegacyDb db;
		private Employee employee;
		private EmployeeAddressViewModel address;
		public bool isEditing = false;

		public EmployeeEditViewModel(LegacyDb legacyDb)
		{
			IsDirty = true;
			employee = new Employee();
			this.address = new EmployeeAddressViewModel(employee);
			isEditing = true;
			db = legacyDb;
		}

		public EmployeeEditViewModel(Employee e, LegacyDb legacyDb)
		{
			employee = e;
			this.address = new EmployeeAddressViewModel(employee);
			db = legacyDb;
		}


		public bool IsDirty { get; set; }

		public string? Firstname { get => employee.FirstName; set { PropertyChange(employee.FirstName = value); IsDirty = true; } }
		public string? Lastname { get => employee.LastName; set { PropertyChange(employee.LastName = value); IsDirty = true; } }

		public DateTime? HiredDate { get => employee.HiredDate; set { PropertyChange(employee.HiredDate = value); IsDirty = true; } }
		public DateTime? LeaveDate { get => employee.LeaveDate; set { PropertyChange(employee.LeaveDate = value); IsDirty = true; } }

		public DateTime? DateOfBirth { get => employee.DateOfBirth; set { PropertyChange(employee.DateOfBirth = value); IsDirty = true; } }
		public string? EmailAddress { get => employee.EmailAddress; set { PropertyChange(employee.EmailAddress = value); IsDirty = true; } }
		public string? JobTitle { get => employee.JobTitle; set { PropertyChange(employee.JobTitle = value); IsDirty = true; } }
		public EmployeeAddressViewModel Address { get => address; }


		public bool CanSave
		{
			get =>
				!string.IsNullOrEmpty(Lastname) && !string.IsNullOrEmpty(Firstname) && !(HiredDate is null) && !(DateOfBirth is null) && IsDirty;
		}


		public bool IsEditing { get => isEditing; set => PropertyChange(isEditing = value); }

		public ICommand SaveCommand { get => new ActionCommand(Save); }

		private void Save()
		{
			if (IsDirty)
			{
				if (employee.EmployeeId == 0)
				{
					db.Employees.Add(employee);
				}
				db.SaveChanges();
				IsDirty = false;
				IsEditing = false;

			}
		}

		public ICommand CancelEditingCommand { get => new ActionCommand(CancelEditing); }
		public void CancelEditing()
		{
			if (employee.EmployeeId == 0)
			{
				db.Employees.Remove(employee);
			}
			else
			{
				db.Entry(employee).Reload();
			}
			IsEditing = false;
			IsDirty = false;
		}

		public ICommand EditCommand { get => new ActionCommand(Edit); }

		private void Edit()
		{
			IsEditing = true;
		}

	}
}