using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RestApiFoundation.Models;
using Newtonsoft.Json.Linq;

namespace RestApiFoundation.Controllers
{
    [Route("api/batteries")]
    [ApiController]
    public class BatteriesController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public BatteriesController(DatabaseContext context)
        {
            _context = context;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<Batteries>>> GetBatteries()
        {
            return await _context.Batteries.ToListAsync();
        }



        [HttpGet("{id}")]
        public async Task<ActionResult<Batteries>> GetBatteries(long id, string Status)
        {
            var batteries = await _context.Batteries.FindAsync(id);

            if (batteries == null)
            {
                return NotFound();
            }

            var jsonGet = new JObject ();
            jsonGet["status"] = batteries.status;
            return Content  (jsonGet.ToString(), "application/json");
        }



   [HttpPut("{id}")]
        public IActionResult PutBatteryStatus(long id, Batteries item)
        {
            var bat = _context.Batteries.Find(id); 
            if (bat == null)
            {
                return NotFound();
            }
            bat.status = item.status;

            _context.Batteries.Update(bat);
            _context.SaveChanges();
    
            var jsonPut = new JObject ();
            jsonPut["Update"] = "Update done to battery id : " + id + " to the status : " + bat.status;
            return Content  (jsonPut.ToString(), "application/json");
        
        }


        [HttpPost]
        public async Task<ActionResult<Batteries>> PostBatteries(Batteries batteries)
        {
            _context.Batteries.Add(batteries);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetBatteries", new { id = batteries.id }, batteries);
        }

   
        [HttpDelete("{id}")]
        public async Task<ActionResult<Batteries>> DeleteBatteries(long id)
        {
            var batteries = await _context.Batteries.FindAsync(id);
            if (batteries == null)
            {
                return NotFound();
            }

            _context.Batteries.Remove(batteries);
            await _context.SaveChangesAsync();

            return batteries;
        }

        private bool BatteriesExists(long id)
        {
            return _context.Batteries.Any(e => e.id == id);
        }
    }
}
