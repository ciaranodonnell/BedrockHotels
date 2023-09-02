using System.Text;

namespace Bedrock.Database.Model
{
	public partial class User
	{

		public static byte[] HashPassword(string password)
		{
			return System.Security.Cryptography.SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(password));
		}
	}
}
