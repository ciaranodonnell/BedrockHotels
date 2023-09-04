using Bedrock.Database.Model;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace LegacyWeb.Pages
{
    public class IndexModel : PageModel
    {
        private readonly ILogger<IndexModel> _logger;
        private readonly LegacyDb db;

        public IndexModel(ILogger<IndexModel> logger, LegacyDb db)
        {
            _logger = logger;
            this.db = db;
        }

        public List<Hotel> Hotels { get; set; } = new List<Hotel>();


        public void OnGet()
        {
            this.Hotels.AddRange(db.Hotels
                .Include(h => h.Address)
                .ThenInclude(a => a.Country)
                .Where(h => h.CloseDate == null));
        }


    }
}