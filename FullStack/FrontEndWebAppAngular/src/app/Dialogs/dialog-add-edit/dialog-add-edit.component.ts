import { Component, OnInit, Inject } from '@angular/core';
import { FormBuilder, FormGroup, Validators } from '@angular/forms';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { MatSnackBar } from '@angular/material/snack-bar';
import { Category } from 'src/app/Interfaces/category';
import { Item } from 'src/app/Interfaces/item';
import { CategoryService } from 'src/app/Services/category.service';
import { ItemService } from 'src/app/Services/item.service';
import { ThisReceiver } from '@angular/compiler';


@Component({
  selector: 'app-dialog-add-edit',
  templateUrl: './dialog-add-edit.component.html',
  styleUrls: ['./dialog-add-edit.component.css']
})
export class DialogAddEditComponent implements OnInit {
  formItem:FormGroup;
  actionTitle:string="Add";
  actionButton:string="Save";
  listCategory: Category[]=[];

  constructor(
    private dialogReference: MatDialogRef<DialogAddEditComponent>,
    @Inject(MAT_DIALOG_DATA) public itemData:Item,
    private fb:FormBuilder,
    private _snackBar:MatSnackBar,
    private _categoryService:CategoryService,
    private _itemService:ItemService
  ){
    this.formItem=this.fb.group({
      idItem:['',Validators.required],
      idCategory:['',Validators.required],
      codeItem:['',Validators.required],
      nameItem:['',Validators.required],
      quantityItem:['',Validators.required]
    })
    this._categoryService.getList().subscribe({
      next:(data)=>{
        if(data.status){
          this.listCategory=data.value;
        }

      },
      error:(e)=>{}
    })

  }

  ngOnInit(): void {
    if(this.itemData){
      this.formItem.patchValue({
        idItem:this.itemData.idItem,
        idCategory:this.itemData.idCategory,
        codeItem:this.itemData.codeItem,
        nameItem:this.itemData.nameItem,
        quantityItem:this.itemData.quantityItem
        
      })
      this.actionTitle="Edit";
      this.actionButton="Update";
    }
  }
  showAlert(msg:string, title:string){
    this._snackBar.open(msg,title,{
      horizontalPosition:"end",
      verticalPosition:"top",
      duration:3000
    });
  }

  addEditItem(){
    console.log(this.formItem)
    console.log(this.formItem.value)
    const model:Item={
      idItem:this.formItem.value.idItem,
      idCategory:this.formItem.value.idCategory,
      codeItem:this.formItem.value.codeItem,
      nameItem:this.formItem.value.nameItem,
      quantityItem:this.formItem.value.quantityItem
    }

    if(this.itemData == null)
    {
      this._itemService.add(model).subscribe({
        next:(data)=>{
          if(data.status){
            this.showAlert("Item was created","success");
            this.dialogReference.close('created');
          }else
            this.showAlert("Item could not be created","Error");
  
        },
        error:(e)=>{}
      });

    }else {
      this._itemService.update(model).subscribe({
        next:(data)=>{
          if(data.status){
            this.showAlert("Item was edited","success");
            this.dialogReference.close('edited');
          }else
            this.showAlert("Item could not be edited","Error");
  
        },
        error:(e)=>{}
      });
    }
    
  }

}
