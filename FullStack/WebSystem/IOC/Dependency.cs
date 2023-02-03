using ADataAccess.DBContext;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace IOC
{
    public static class Dependency
    {
        public static void dependencyInjection(this IServiceCollection services, IConfiguration configuration) 
        {
            services.AddDbContext<InventoryContext>(options => {
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            
            
            });
        }
    }
}
