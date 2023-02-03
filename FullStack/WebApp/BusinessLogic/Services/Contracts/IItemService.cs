using DTO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLogic.Services.Contracts
{
    public interface IItemService
    {
        Task<List<ItemDTO>> List();
        Task<ItemDTO> Create(ItemDTO model);
        Task<bool> Update(ItemDTO model);
        Task<bool> Delete(int id);
    }
}
