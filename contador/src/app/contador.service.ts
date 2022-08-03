import { Injectable } from '@angular/core';

@Injectable({
  providedIn: 'root'
})
export class ContadorService {

  numeroAtual = 0

  constructor() { }

  incrementar() {
    this.numeroAtual++
  }
}
