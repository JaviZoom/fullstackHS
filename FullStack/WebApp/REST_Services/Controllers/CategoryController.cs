using BusinessLogic.Services.Contracts;
using DTO;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using REST_Services.Utility;

namespace REST_Services.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CategoryController : ControllerBase
    {
        private readonly ICategoryService _categoryService;

        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }

        [HttpGet]
        [Route("List")]
        public async Task<IActionResult> List() 
        {
            var rsp = new Response<List<CategoryDTO>>();
            try
            {
                rsp.status = true;
                rsp.value=await _categoryService.List();
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
