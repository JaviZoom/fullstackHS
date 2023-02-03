using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ADataAccess.Repositories.Contracts
{
    public interface IGenericRepository<TModel> where TModel : class
    {
        Task<TModel>Get(Expression<Func<TModel, bool>> filter);
        Task<TModel> Create(TModel model);
        Task<bool> Update(TModel model);  
        Task<bool> Delete(TModel model);  
        Task<IQueryable<TModel>> Consult(Expression<Func<TModel, bool>>filter = null);
    }
}
