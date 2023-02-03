using ADataAccess.Context;
using ADataAccess.Repositories.Contracts;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ADataAccess.Repositories
{
    public class GenericRepository<TModel> : IGenericRepository<TModel> where TModel : class
    {
        private readonly InventoryContext _inventoryContext;

        public GenericRepository(InventoryContext inventoryContext)
        {
            _inventoryContext = inventoryContext;
        }
        public async Task<TModel> Get(Expression<Func<TModel, bool>> filter)
        {
            try
            {
                TModel model = await _inventoryContext.Set<TModel>().FirstOrDefaultAsync(filter);
                return model;
            }
            catch (Exception)
            {

                throw ;
            }
        }
        public async Task<TModel> Create(TModel model)
        {
            try
            {
                _inventoryContext.Set<TModel>().Add(model);
                await _inventoryContext.SaveChangesAsync();
                return model;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public async Task<bool> Update(TModel model)
        {
            try
            {
                _inventoryContext.Set<TModel>().Update(model);
                await _inventoryContext.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public async Task<bool> Delete(TModel model)
        {
            try
            {
                _inventoryContext.Set<TModel>().Remove(model);
                await _inventoryContext.SaveChangesAsync();
                return true;
            }
            catch (Exception)
            {

                throw;
            }
            
        }
        public async Task<IQueryable<TModel>> Consult(Expression<Func<TModel, bool>> filter = null)
        {
            try
            {
                IQueryable<TModel> queryModel = filter == null ? _inventoryContext.Set<TModel>() : _inventoryContext.Set<TModel>().Where(filter);
                return queryModel;
            }
            catch (Exception)
            {

                throw;
            }
        }

        

        

        

        
    }
}
