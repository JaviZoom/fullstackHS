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
        [HttpPost]
        [Route("Create")]
        public async Task<IActionResult> Create([FromBody] ItemDTO item) 
        {
            var rsp = new Response<ItemDTO>();
            try
            {
                rsp.status = true;
                rsp.value = await _itemService.Create(item);
            }
            catch (Exception ex)
            {
                rsp.status = false;
                rsp.message = ex.Message;

            }
            return Ok(rsp);
        }
        [HttpPut]
        [Route("Edit")]
        public async Task<IActionResult> Edit([FromBody] ItemDTO item)
        {
            var rsp = new Response<bool>();
            try
            {
                rsp.status = true;
                rsp.value = await _itemService.Update(item);
                 
            }
            catch (Exception ex)
            {
                rsp.status = false;
                rsp.message = ex.Message;

            }
            return Ok(rsp);
        }
        [HttpDelete]
        [Route("Delete/{id:int}")]
        public async Task<IActionResult> Delete(int id)
        {
            var rsp = new Response<bool>();
            try
            {
                rsp.status = true;
                rsp.value = await _itemService.Delete(id);

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
