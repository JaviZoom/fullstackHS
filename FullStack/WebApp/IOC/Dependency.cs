using ADataAccess.Context;
using ADataAccess.Repositories;
using ADataAccess.Repositories.Contracts;
using BusinessLogic.Services;
using BusinessLogic.Services.Contracts;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Utility;

namespace IOC
{
    public static class Dependency
    {
        public static void DependencyInjection(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<InventoryContext>(options =>{
                options.UseSqlServer(configuration.GetConnectionString("ConnectionString"));
            });
            services.AddTransient(typeof(IGenericRepository<>),typeof(GenericRepository<>));

            services.AddAutoMapper(typeof(AutoMapperProfile));

            services.AddScoped<ICategoryService, CategoryService>();
            services.AddScoped<IItemService,ItemService>(); 


        }
    }
}
