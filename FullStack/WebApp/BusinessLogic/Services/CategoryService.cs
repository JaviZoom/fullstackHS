using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using ADataAccess.Models;
using ADataAccess.Repositories.Contracts;
using AutoMapper;
using BusinessLogic.Services.Contracts;
using DTO;

namespace BusinessLogic.Services
{
    public class CategoryService : ICategoryService
    {
        private readonly IGenericRepository<Category> _categoryRepository;
        private readonly IMapper _mapper;

        public CategoryService(IGenericRepository<Category> categoryRepository, IMapper mapper)
        {
            _categoryRepository = categoryRepository;
            _mapper = mapper;
        }

        public async Task<List<CategoryDTO>> List()
        {
            try
            {
                var listCategory = await _categoryRepository.Consult();
                return _mapper.Map<List<CategoryDTO>>(listCategory.ToList());    
            }
            catch (Exception)
            {

                throw;
            }
        }
    }
}
