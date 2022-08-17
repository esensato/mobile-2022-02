import { HttpClient } from '@angular/common/http';
import { Component, OnInit } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';

@Component({
  selector: 'app-pedido',
  templateUrl: './pedido.component.html',
  styleUrls: ['./pedido.component.scss'],
})
export class PedidoComponent implements OnInit {

  pizzaSelecionada: any
  bebidaSelecionada: any
  quantidade = 1
  total = 0

constructor(private route: ActivatedRoute, private router: Router, private http:HttpClient) {
  this.route.queryParams.subscribe(params => {
    if (this.router.getCurrentNavigation().extras.state) {
      this.pizzaSelecionada = this.router.getCurrentNavigation().extras.state.pizzaSelecionada;
      this.bebidaSelecionada = this.router.getCurrentNavigation().extras.state.bebidaSelecionada;
      this.recalcular(1)
    }
  });
}

  ngOnInit() {}

  recalcular(novoValor) {
    this.total = this.pizzaSelecionada.preco + this.bebidaSelecionada.preco * novoValor
  }

  queijoExtra(novoValor) {
    if (novoValor === true) {
      this.total += 10
    } else {
      this.total -= 10
    }
  }
  
  salvarPedido() {

    let URL = 'https://us-south.functions.appdomain.cloud/api/v1/web/edson.sensato%40espm.br_dev/default/GravarPedido'

    this.http.post(URL, {pedido: {pizza: this.pizzaSelecionada, 
                                  bebida: this.bebidaSelecionada, 
                                  quantidade: this.quantidade,
                                  total: this.total}}).subscribe((ret) => {

    })

  }

}
