using Bedrock.Database.Model;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

namespace LegacyWeb.Pages
{
    public class HotelModel : PageModel
    {

        private readonly ILogger<HotelModel> _logger;
        private readonly LegacyDb db;

        public HotelModel(ILogger<HotelModel> logger, LegacyDb db)
        {
            _logger = logger;
            this.db = db;
        }

        public Hotel? Hotel { get; private set; }

        public IActionResult OnGet(int hotelId)
        {
            var hotel =
                db.Hotels
                .Include(h => h.Address)
                .ThenInclude(a => a.Country)
                .Include(h => h.HotelPictures)
                .Where(h => h.HotelId == hotelId)
                .FirstOrDefault();
            if (hotel == null)
            {
                RedirectToPage("/");
            }
            else { this.Hotel = hotel; }

            return Page();
        }
    }
}
