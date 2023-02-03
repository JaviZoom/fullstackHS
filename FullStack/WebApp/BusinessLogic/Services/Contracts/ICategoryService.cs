using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Services.Contracts
{
    public interface ICategoryService
    {
        Task<List<CategoryDTO>> List();

    }
}
