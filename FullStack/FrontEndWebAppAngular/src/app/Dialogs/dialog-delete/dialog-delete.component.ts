import { Component, OnInit, Inject } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Item } from 'src/app/Interfaces/item';

@Component({
  selector: 'app-dialog-delete',
  templateUrl: './dialog-delete.component.html',
  styleUrls: ['./dialog-delete.component.css']
})
export class DialogDeleteComponent implements OnInit {

  constructor(
    private dialogReference:MatDialogRef<DialogDeleteComponent>,
    @Inject(MAT_DIALOG_DATA) public itemDelete:Item 
  ){}
  ngOnInit(): void {
    
  }

  confirmDelete(){
    if(this.itemDelete){
      this.dialogReference.close("delete");
    }
  }
}
