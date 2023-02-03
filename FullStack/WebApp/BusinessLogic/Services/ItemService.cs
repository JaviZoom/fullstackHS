using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using System.Threading.Tasks;

using ADataAccess.Models;
using ADataAccess.Repositories.Contracts;
using AutoMapper;
using BusinessLogic.Services.Contracts;
using DTO;
using Microsoft.EntityFrameworkCore;

namespace BusinessLogic.Services
{
    public class ItemService : IItemService
    {
        private readonly IGenericRepository<Item> _itemRepository;
        private readonly IMapper _mapper;

        public ItemService(IGenericRepository<Item> itemRepository, IMapper mapper)
        {
            _itemRepository = itemRepository;
            _mapper = mapper;
        }
        public async Task<List<ItemDTO>> List()
        {
            try
            {
                var queryItem = await _itemRepository.Consult();
                var listItems =queryItem.Include(category => category.IdCategoryNavigation).ToList();    

                return _mapper.Map<List<ItemDTO>>(listItems.ToList());  
            }
            catch (Exception)
            {

                throw;
            }
        }
        public async Task<ItemDTO> Create(ItemDTO model)
        {
            try
            {
                var createdItem = await _itemRepository.Create(_mapper.Map<Item>(model));
                if (createdItem.IdItem == 0)
                {
                    throw new TaskCanceledException("The Item could not be created.");
                }
                return _mapper.Map<ItemDTO>(createdItem);
            }
            catch (Exception)
            {

                throw;
            }
        }
        public async Task<bool> Update(ItemDTO model)
        {
            try
            {
                var itemModel = _mapper.Map<Item>(model);
                var itemFound = await _itemRepository.Get(u =>
                    u.IdItem == itemModel.IdItem
                    );
                if (itemFound == null) 
                {
                    throw new TaskCanceledException("The Item does not exist.");
                }

                itemFound.IdCategory = itemModel.IdCategory;
                itemFound.CodeItem= itemModel.CodeItem;
                itemFound.NameItem= itemModel.NameItem;
                itemFound.QuantityItem= itemModel.QuantityItem;

                bool answer = await _itemRepository.Update(itemFound);

                if (!answer)
                {
                    throw new TaskCanceledException("The Item could not be edited.");
                }
                return answer;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public async Task<bool> Delete(int id)
        {
            try
            {
                var itemFound = await _itemRepository.Get(i => i.IdItem == id);
                if (itemFound == null) 
                {
                    throw new TaskCanceledException("The Item does not exist.");
                }
                bool answer =await _itemRepository.Delete(itemFound);

                if (!answer)
                {
                    throw new TaskCanceledException("The Item could not be deleted.");
                }
                return answer;
            }
            catch (Exception)
            {

                throw;
            }
        }

        

        
    }
}
