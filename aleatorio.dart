import 'dart:math';

import 'package:flutter/material.dart';

class Aleatorio extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Aleatório',
    home: AleatorioStateful(),);
  }
}

class AleatorioStateful extends StatefulWidget{

  @override
  State<AleatorioStateful> createState() => AleatorioState();
}

class AleatorioState extends State<AleatorioStateful> {

  var aleatorio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: const Text('Aleatório'),),
      body: Center(child: Text('$aleatorio',
        style: const TextStyle(color: Colors.amber, fontSize: 30),),
      ),
      floatingActionButton: FloatingActionButton(child: const Icon(Icons.refresh),
      onPressed: (){
          var rnd = Random();
          setState(() {
            aleatorio = rnd.nextInt(6) + 1;
          });
      },),
    );
  }

}
