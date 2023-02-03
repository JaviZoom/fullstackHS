using BusinessLogic.Services;
using BusinessLogic.Services.Contracts;
using DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using REST_Services.Utility;

namespace REST_Services.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ItemController : ControllerBase
    {
        private readonly IItemService _itemService;

        public ItemController(IItemService itemService)
        {
            _itemService = itemService;
        }
        [HttpGet]
        [Route("List")]
        public async Task<IActionResult> List()
        {
            var rsp = new Response<List<ItemDTO>>();
            try
            {
                rsp.status = true;
                rsp.value = await _itemService.List();
            }
            catch (Exception ex)
            {
                rsp.status = false;
                rsp.message = ex.Message;

            }
            return Ok(rsp);
        }
    }
}
