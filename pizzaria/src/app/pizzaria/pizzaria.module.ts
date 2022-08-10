import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule, Routes } from '@angular/router';
import { CardapioComponent } from '../cardapio/cardapio.component';
import { PedidoComponent } from '../pedido/pedido.component';
import { HttpClientModule } from '@angular/common/http';

// definicao das rotas
const routes: Routes = [
  {
  path: 'cardapio',
  component: CardapioComponent
  },
  {
  path: 'pedido',
  component: PedidoComponent
  }
]; 

@NgModule({
  declarations: [CardapioComponent, PedidoComponent],
  exports: [CardapioComponent, PedidoComponent],
  imports: [
    CommonModule,
    RouterModule.forChild(routes),
    HttpClientModule
  ]
})
export class PizzariaModule { }
