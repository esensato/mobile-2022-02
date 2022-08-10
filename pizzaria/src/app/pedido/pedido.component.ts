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

constructor(private route: ActivatedRoute, private router: Router) {
  this.route.queryParams.subscribe(params => {
    if (this.router.getCurrentNavigation().extras.state) {
      this.pizzaSelecionada = this.router.getCurrentNavigation().extras.state.pizzaSelecionada;
      this.bebidaSelecionada = this.router.getCurrentNavigation().extras.state.bebidaSelecionada;
    }
  });
}

  ngOnInit() {}

}
