import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { NavigationExtras, Router } from '@angular/router';

@Component({
  selector: 'app-cardapio',
  templateUrl: './cardapio.component.html',
  styleUrls: ['./cardapio.component.scss'],
})
export class CardapioComponent implements OnInit {

  cardapio: any = []
  pizzaSelecionada: any
  bebidaSelecionada: any
  ocultarCardapio: boolean = false

  constructor(private router:Router, private http:HttpClient) { }

  ngOnInit() {


    this.http.get('https://raw.githubusercontent.com/esensato/mobile-2022-01/main/services/lista-pizza.json').subscribe((ret) => {

      console.log(ret)
      this.cardapio = ret

    })

    //this.cardapio = {"pizzas": [{"id": "1", "nome": "Quatro Queijos", "preco": 30.0},
    //                            {"id": "2", "nome": "Frango com Catupiry", "preco": 35.0 }]};

  }

  selPizza(pizza) {
    this.pizzaSelecionada = pizza
    this.ocultarCardapio = true
  }

  selBebida(bebida) {
    this.bebidaSelecionada = bebida

    let itens: NavigationExtras = {
      state: {
        pizzaSelecionada: this.pizzaSelecionada,
        bebidaSelecionada: this.bebidaSelecionada
      }
      };

    this.router.navigate(['pizzaria/pedido'], itens)
  }

}
