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
    [Route("api/interventions")]
    [ApiController]
    public class InterventionsController : ControllerBase
    {
        private readonly DatabaseContext _context;

        public InterventionsController(DatabaseContext context)
        {
            _context = context;
        }


        [HttpGet]
        public async Task<ActionResult<IEnumerable<Interventions>>> GetInterventions()
        {
            return await _context.Interventions.ToListAsync();
        }


        [HttpGet("{id}")]
        public async Task<ActionResult<Interventions>> GetInterventions(long id, string Status)
        {
            var Interventions = await _context.Interventions.FindAsync(id);

            if (Interventions == null)
            {
                return NotFound();
            }

            return Interventions;
        }



        [HttpGet("pending")]
        public async Task<ActionResult<List<Interventions>>> GetInterventionsList()
        {

          var list =  await _context.Interventions.ToListAsync();

               if (list == null)
            {
                return NotFound();
            }

     
        List<Interventions> listInterventions = new List<Interventions>();



        foreach (var intervention in list){

            if (intervention.status == "Pending" && intervention.intervention_start_time ==  null){
         
            listInterventions.Add(intervention);


            }
        }

             return listInterventions;

            }

//PUT: Changer le statut de la demande d’intervention à “InProgress” et ajouter une date et heure de début (Timestamp)
//PUT: Changer le statut de la demande d’intervention à “Completed” et ajouter une date et heure de fin (Timestamp)


   [HttpPut("inprogress/{id}")]
        public IActionResult PutInterventionstatusInProgress(long id, Interventions item)
        {
            var inter = _context.Interventions.Find(id); 
            if (inter == null)
            {
                return NotFound();
            }
            inter.status = item.status;
            inter.intervention_start_time = item.intervention_start_time;

            _context.Interventions.Update(inter);
            _context.SaveChanges();

            var jsonPut = new JObject ();
            jsonPut["Update"] = "Update done to Interventions id : " + id + " to the status : " + inter.status + " to the intervention_start_time : " + inter.intervention_start_time ;
    
            return Content  (jsonPut.ToString(), "application/json");
        
        }




   [HttpPut("completed/{id}")]
        public IActionResult PutInterventionstatusCompleted(long id, Interventions item)
        {
            var inter = _context.Interventions.Find(id); 
            if (inter == null)
            {
                return NotFound();
            }
            inter.status = item.status;
            inter.intervention_end_time = item.intervention_end_time;

            _context.Interventions.Update(inter);
            _context.SaveChanges();

            var jsonPut = new JObject ();
            jsonPut["Update"] = "Update done to Interventions id : " + id + " to the status : " + inter.status + " to the intervention_end_time : " + inter.intervention_end_time ;
    
            return Content  (jsonPut.ToString(), "application/json");
        
        }















        [HttpPost]
        public async Task<ActionResult<Interventions>> PostInterventions(Interventions Interventions)
        {
            _context.Interventions.Add(Interventions);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetInterventions", new { id = Interventions.id }, Interventions);
        }

        // DELETE: api/Interventions/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Interventions>> DeleteInterventions(long id)
        {
            var Interventions = await _context.Interventions.FindAsync(id);
            if (Interventions == null)
            {
                return NotFound();
            }

            _context.Interventions.Remove(Interventions);
            await _context.SaveChangesAsync();

            return Interventions;
        }

        private bool InterventionsExists(long id)
        {
            return _context.Interventions.Any(e => e.id == id);
        }
    


        [HttpGet("get/status/inactive")]

            public IEnumerable<Interventions> GetInterventionsInactive()
            {
            IQueryable<Interventions> Interventions =
            from col in _context.Interventions
            where col.status == "Inactive"
            select col;
            return Interventions.ToList();
            }

            [HttpGet("get/status/active")]
            public IEnumerable<Interventions> GetInterventionsActive()
            {
            IQueryable<Interventions> Interventions =
            from col in _context.Interventions
            where col.status == "Active"
            select col;
            return Interventions.ToList();
            }

            [HttpGet("get/status/intervention")]
            public IEnumerable<Interventions> GetInterventionsIntervention()
            {
            IQueryable<Interventions> Interventions =
            from col in _context.Interventions
            where col.status == "Intervention"
            select col;
            return Interventions.ToList();
            }

            [HttpGet("get/status/others")]
            public IEnumerable<Interventions> GetInterventionsOthers()
            {
            IQueryable<Interventions> Interventions =
            from col in _context.Interventions
            where col.status != "Active" && col.status != "Inactive" && col.status != "Intervention"
            select col;
            return Interventions.ToList();
            }




}
}