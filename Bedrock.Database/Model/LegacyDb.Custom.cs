using Microsoft.EntityFrameworkCore;

namespace Bedrock.Database.Model
{
	public partial class LegacyDb
	{
		private string connectionString;

		public LegacyDb(string connectionString)
		{
			this.connectionString = connectionString;
		}

		public LegacyDb(string connectionString, DbContextOptions<LegacyDb> options)
			: base(options)
		{
			this.connectionString = connectionString;
		}

		protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder) => optionsBuilder.UseSqlServer(this.connectionString);

	}
}
