import 'package:flutter/material.dart';
import 'package:vencarro/Veiculo.dart';

class Resumo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

      Veiculo param = ModalRoute.of(context)?.settings.arguments as Veiculo;
      print (param);
    return MaterialApp(
      title: "Resumo",
    home: Scaffold(appBar: AppBar(title: const Text('Resumo')),
      body: Column(
      children: [Row(children: [Container(padding: EdgeInsets.all(10), width: 100,child: const Text('Marca: ')), Text(param.marca)],),
        Row(children: [Container(padding: EdgeInsets.all(10), width: 100,child: Text('Modelo: ')), Text(param.modelo)],),
        Row(children: [Container(padding: EdgeInsets.all(10), width: 100,child: Text('Ano: ')), Text(param.ano)],),
        Row(children: [Container(padding: EdgeInsets.all(10), width: 100,child: Text('Preço: ')), Text(param.preco)],),
        Flexible(child: Image.network('https://cdn.pixabay.com/photo/2012/04/12/19/39/volga-30332_1280.png'))
      ],
    ),
    floatingActionButton: FloatingActionButton(onPressed: ()  {
    }, child: Icon(Icons.photo_camera)),),
    );
  }

}
