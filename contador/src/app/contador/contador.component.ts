import { Component, OnInit } from '@angular/core';
import { ContadorService } from '../contador.service';

@Component({
  selector: 'app-contador',
  templateUrl: './contador.component.html',
  styleUrls: ['./contador.component.scss'],
})
export class ContadorComponent implements OnInit {

  constructor(private contadorService : ContadorService) { }

  ngOnInit() {}

  onClick() {
    
    this.contadorService.incrementar()

  }

}
