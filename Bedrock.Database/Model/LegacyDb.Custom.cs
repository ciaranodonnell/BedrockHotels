using Microsoft.EntityFrameworkCore;

namespace Bedrock.Database.Model
{
	public partial class LegacyDb
	{
		private string connectionString;

		public LegacyDb(string connectionString)
			: base(new DbContextOptionsBuilder<LegacyDb>().UseSqlServer(connectionString).Options)
		{

		}

		public LegacyDb(DbContextOptions<LegacyDb> options)
			: base(options)
		{

		}



	}
}
