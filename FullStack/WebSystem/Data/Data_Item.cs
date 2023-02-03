using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ADataAccess;
using ADataAccess.DBContext;
using ADataAccess.Models;

namespace Data
{
    public class Data_Item
    {
        InventoryContext context = new InventoryContext();

        #region metodos de seleccion
        //Mostrar todos los artículos
        public List<Item> seleccionarItems()
        {
            return context.Item.ToList();
        }
        //Mostrar artículo por codigo, sirve para verificar existencia o no del elemento para posteriormente eliminarlo
        public Item seleccionarItemPorCodigo(string idItem)
        {
            return context.Item.Where(a => a.CodeItem == idItem).SingleOrDefault();
        }
        #endregion

        #region metodos de accion
        //Insertar un nuevo artículo
        public Item insertarItem(Item nuevoItem)
        {
            context.Item.Add(nuevoItem);
            context.SaveChanges();
            return nuevoItem;
        }


        //Acualizar Item
        public Item actualizarItem(Item ItemActualizado)
        {
            Item ItemActual = seleccionarItemPorCodigo(ItemActualizado.CodeItem);
            if (ItemActual != null)
            {

                ItemActual.NameItem = ItemActualizado.NameItem;
                ItemActual.DescriptionItem = ItemActualizado.DescriptionItem;
                ItemActual.AmountItem = ItemActualizado.AmountItem;

            }
            context.SaveChanges();
            return ItemActual;
        }
        //Eliminar un artículo
        public void eliminarItem(string codigoItem)
        {
            Item ItemExiste = seleccionarItemPorCodigo(codigoItem);
            if (ItemExiste != null)
            {
                context.Item.Remove(ItemExiste);
                context.SaveChanges();
            }


        }
        #endregion
    }
}
