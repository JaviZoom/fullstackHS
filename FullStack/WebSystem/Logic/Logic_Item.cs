using Data;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ADataAccess.Models;

namespace Logic
{
    public class Logic_Item
    {
        Data_Item data = new Data_Item();
        //Mostrar todos los Items
        public List<Item> seleccionarItems()
        {
            return data.seleccionarItems();
        }
        public Item seleccionarItemPorCod(string idItem)
        {
            return data.seleccionarItems().Where(a => a.CodeItem == idItem).SingleOrDefault();
        }


        //Insertar Item
        public Item insertarItem(Item nuevoAr)
        {
            return data.insertarItem(nuevoAr);
        }
        //Actualizar Item
        public Item actualizarItem(Item ItemActualizado)
        {
            return data.actualizarItem(ItemActualizado);
        }
        //Eliminar Item
        public void eliminarItem(string codigoItem)
        {
            data.eliminarItem(codigoItem);
        }
    }
}
