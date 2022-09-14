import 'package:flutter/material.dart';

class Principal extends StatelessWidget{

  Widget criarBotao() {
    return FloatingActionButton(child: const Icon(Icons.account_circle_outlined),
      onPressed: () {
        print('OK');
      },);
  }

  Widget getTexto(String texto) {
    return Container(child: Text(texto, style: TextStyle(color: Colors.white, fontSize: 18),), margin: EdgeInsets.all(10), decoration: BoxDecoration(
        border: Border.all(color: Colors.white)
    ), padding: EdgeInsets.all(10),);
  }
@override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(appBar: AppBar(title: const Text('Meu App'),
    ),
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          getTexto('Item 1'),
          getTexto('Item 2'),
          Row(mainAxisAlignment: MainAxisAlignment.center,
            children: [getTexto('Col 1'), getTexto('Col 2')],)
      ],)),
      floatingActionButton: criarBotao(),
      bottomNavigationBar: BottomAppBar(child: Text('Aqui embaixo!')),
      persistentFooterButtons: [IconButton(onPressed: (){ print ('Acorda!'); },
          icon: Icon(Icons.access_alarm_rounded)),
        IconButton(onPressed: (){ print ('Ajuda!'); },
            icon: Icon(Icons.accessibility))],
      backgroundColor: Colors.amber,
    ),
    );
  }

}
