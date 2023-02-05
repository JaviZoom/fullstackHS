
import {AfterViewInit, Component, ViewChild, OnInit} from '@angular/core';
import {MatPaginator} from '@angular/material/paginator';
import {MatTableDataSource} from '@angular/material/table';

import { Item } from './Interfaces/item';
import { ItemService } from './Services/item.service';
import {MatDialog} from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { DialogAddEditComponent } from './Dialogs/dialog-add-edit/dialog-add-edit.component';
import { DialogDeleteComponent } from './Dialogs/dialog-delete/dialog-delete.component';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements AfterViewInit, OnInit{
  displayedColumns: string[] = ['ID', 'CODE', 'NAME', 'CATEGORY', 'QUANTITY', 'ACTIONS' ];
  dataItem = new MatTableDataSource<Item>();

  constructor(
    private _snackbar:MatSnackBar,
    private _itemService:ItemService,
    public dialog: MatDialog
  ){}

  ngOnInit(): void {
    this.showItems();
  }


  @ViewChild(MatPaginator) paginator!: MatPaginator;

  ngAfterViewInit() {
    this.dataItem.paginator = this.paginator;
  }
  applyFilter(event:Event){
    const filterValue =(event.target as HTMLInputElement).value;
    this.dataItem.filter = filterValue.trim().toLowerCase();
  }

  showItems(){
    this._itemService.getList().subscribe({
      next:(data)=>{
        //console.log(data)
        if(data.status){
          this.dataItem.data=data.value;
        }
      },
      error:(e)=>{}
    })
  }
  dialogNewItem() {
    this.dialog.open(DialogAddEditComponent,{
      disableClose:true,
      width:"350px"
    }).afterClosed().subscribe(result =>{
      if(result==="created"){
        this.showItems();
      }
    })
  }
  dialogEditItem(item:Item) {
    this.dialog.open(DialogAddEditComponent,{
      disableClose:true,
      data:item,
      width:"350px"
    }).afterClosed().subscribe(result =>{
      if(result==="edited"){
        this.showItems();
      }
    })
  }

  showAlert(msg:string, title:string){
    this._snackbar.open(msg,title,{
      horizontalPosition:"end",
      verticalPosition:"top",
      duration:3000
    })
  }

  dialogDeleteItem(item:Item){
    this.dialog.open(DialogDeleteComponent,{
      disableClose:true,
      data:item      
    }).afterClosed().subscribe(result =>{
      if(result==="delete"){
        this._itemService.delete(item.idItem).subscribe({
          next:(data)=>{
            if(data.status)
            {
              this.showAlert("Item was deleted","success");
              this.showItems();
            }else {
              this.showAlert("Item could not be deleted","Error");
            }
          }, 
          error:(e)=>{}
        })
        
      }
    });

  }
}