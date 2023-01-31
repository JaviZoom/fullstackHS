using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using WebSystem.DataAccessLayer.DBContext;

namespace WebSystem.InversionOfControl
{
    public static class Dependence
    {
        public static void DependencyInjection(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<InventoryContext>(options => {
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            
            });
        }
    }
}
