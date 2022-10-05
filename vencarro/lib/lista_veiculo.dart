import 'package:flutter/material.dart';
import 'package:vencarro/Veiculo.dart';
import 'package:vencarro/resumo.dart';
import 'package:vencarro/util.dart';

class ListaVeiculos extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    return MaterialApp( routes: {'/resumo': (context) => Resumo()},
      title: 'VenCarro',
      home: Scaffold(
        appBar: AppBar(title: Text('VenCarro')),
        body: _ListaVeiculoStateful()
      ),
    );
  }

}

class _ListaVeiculoStateful extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ListaVeiculoState();
}

class _ListaVeiculoState extends State<_ListaVeiculoStateful>{

  List<Veiculo> _listaVeiculos = List<Veiculo>.empty(growable: true);
  var _veiculoSelecionado = Veiculo();

  @override
  void initState() {
    super.initState();
    // value = conteudo de Future<List<Veiculo>>
    Util.obterMarcas().then((marcas) {
      // indica que a interface grafica deve ser atualizada
      setState(() {
        _listaVeiculos.addAll(marcas);
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    return ListView.builder(itemBuilder: (cts, idx){
      return ListTile(title: Column(children: [Text(_listaVeiculos.elementAt(idx).marca),
        Text(_listaVeiculos.elementAt(idx).modelo),
        Text(_listaVeiculos.elementAt(idx).ano)],),
      leading: const Icon(Icons.car_rental),
      trailing: const Icon(Icons.arrow_right_outlined),
      tileColor: idx % 2 == 0 ? Colors.blueAccent : Colors.white,
      onTap: () {
        // atualiza veiculo selecionado
        _veiculoSelecionado = _listaVeiculos.elementAt(idx);

        if (_veiculoSelecionado.idModelo == '') {
          Util.obterModelos(_listaVeiculos.elementAt(idx).idMarca, _listaVeiculos.elementAt(idx).marca).then((modelos) {
            setState(() {
              _listaVeiculos.clear();
              _listaVeiculos.addAll(modelos);
            });
          });
        } else if (_veiculoSelecionado.idModelo != '' && _veiculoSelecionado.idAno == '') {
          Util.obterAnos(_listaVeiculos.elementAt(idx).idMarca, _listaVeiculos.elementAt(idx).marca,
              _listaVeiculos.elementAt(idx).idModelo, _listaVeiculos.elementAt(idx).modelo).then((anos) {
            setState(() {
              _listaVeiculos.clear();
              _listaVeiculos.addAll(anos);
            });
          });
        } else if (_veiculoSelecionado.idModelo != '' && _veiculoSelecionado.idAno != '') {
          Util.obterPreco(_listaVeiculos.elementAt(idx).idMarca, _listaVeiculos.elementAt(idx).marca,
              _listaVeiculos.elementAt(idx).idModelo, _listaVeiculos.elementAt(idx).modelo,
              _listaVeiculos.elementAt(idx).idAno,
              _listaVeiculos.elementAt(idx).ano).then((preco) {
                _veiculoSelecionado.preco = preco.preco;
                // navegar para a tela de resumo...
                Navigator.of(context).pushNamed('/resumo', arguments: _veiculoSelecionado);
          });
        }

      },);
    },
    itemCount: _listaVeiculos.length,);

  }
}
