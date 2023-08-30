using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Legacy.Desktop.Model
{
    public partial class User
    {

        public static byte[] HashPassword(string password)
        {
			return System.Security.Cryptography.SHA256.Create().ComputeHash(Encoding.UTF8.GetBytes(password));
		}
    }
}
