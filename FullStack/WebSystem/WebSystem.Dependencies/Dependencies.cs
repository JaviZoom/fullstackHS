using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using WebSystem.DataAccess.DBContext;
using Microsoft.EntityFrameworkCore;


namespace WebSystem.Dependencies
{
    public static class Dependencies
    {
        public static void InjectDependency(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<InventoryContext>(options =>
            {
                options.UseSqlServer(configuration.GetConnectionString("DefaultConnection"));
            }); //connection reference
        }
    }
}
