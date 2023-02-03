using ADataAccess.Models;
using Logic;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace REST_Services.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemController : ControllerBase
    {
        Logic_Item logic = new Logic_Item();
        // GET: api/<ItemController>
        [HttpGet]
        public List<Item> Get()
        {
            return logic.seleccionarItems();
        }

        // GET api/<ItemController>/5
        [HttpGet("{id}")]
        public Item Get(string id)
        {
            return logic.seleccionarItemPorCod(id);
        }

        // POST api/<ItemController>
        [HttpPost]
        public Item Post(Item nuevoArt)
        {
            return logic.insertarItem(nuevoArt);
        }

        // PUT api/<ItemController>/5
        [HttpPut("{id}")]
        public Item Put(Item actualizarArticulo)
        {
            return logic.actualizarItem(actualizarArticulo);
        }

        // DELETE api/<ItemController>/5
        [HttpDelete("{id}")]
        public void Delete(string id)
        {
            logic.eliminarItem(id);
        }
    }
}
