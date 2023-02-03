using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using AutoMapper;
using DTO;
using ADataAccess.Models;

namespace Utility
{
    public class AutoMapperProfile:Profile
    {
        public AutoMapperProfile()
        {
            #region Category
            CreateMap<Category,CategoryDTO>().ReverseMap();
            #endregion

            #region Item
            CreateMap<Item, ItemDTO>()
                .ForMember(destiny =>
                destiny.CategoryDescription,
                option => option.MapFrom(origin => origin.IdCategoryNavigation.NameCategory)
                );
            CreateMap<ItemDTO, Item>()
                .ForMember(destiny =>
                destiny.IdCategoryNavigation,
                option => option.Ignore()
                ); 
            #endregion

        }
    }
}
