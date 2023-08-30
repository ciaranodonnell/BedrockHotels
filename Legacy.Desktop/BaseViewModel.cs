using System;
using System.ComponentModel;
using System.Linq.Expressions;
using System.Runtime.CompilerServices;

namespace Legacy.Desktop
{
	internal class BaseViewModel : INotifyPropertyChanged
	{
		protected void PropertyChange<T>(ref T oldValue, T newValue, [CallerMemberName] string? propertyName = null)
		{
			if ((oldValue is null && newValue != null) || !(oldValue?.Equals(newValue) ?? false))
			{
				oldValue = newValue;
				this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));

			}

		}

		protected void PropertyChange<T>(T newValue, [CallerMemberName] string? propertyName = null)
		{
			this.PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(propertyName));
		}

		public event PropertyChangedEventHandler? PropertyChanged;


		/// <summary>
		/// Gets property name using lambda expressions.
		/// </summary>
		internal class PropertyName
		{
			public static string For<T>(
				Expression<Func<T, object>> expression)
			{
				Expression body = expression.Body;
				return GetMemberName(body);
			}

			public static string For(
				Expression<Func<object>> expression)
			{
				Expression body = expression.Body;
				return GetMemberName(body);
			}

			public static string GetMemberName(
				Expression expression)
			{
				if (expression is MemberExpression)
				{
					var memberExpression = (MemberExpression)expression;

					if (memberExpression.Expression.NodeType ==
						ExpressionType.MemberAccess)
					{
						return GetMemberName(memberExpression.Expression)
							+ "."
							+ memberExpression.Member.Name;
					}
					return memberExpression.Member.Name;
				}

				if (expression is UnaryExpression)
				{
					var unaryExpression = (UnaryExpression)expression;

					if (unaryExpression.NodeType != ExpressionType.Convert)
					{
						throw new Exception(string.Format(
							"Cannot interpret member from {0}",
							expression));
					}

					return GetMemberName(unaryExpression.Operand);
				}

				throw new Exception(string.Format(
					"Could not determine member from {0}",
					expression));
			}
		}
	}
}
