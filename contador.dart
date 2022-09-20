import 'package:flutter/material.dart';

class ContadorStateless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Contador',
    home: Scaffold (body: Center(child: ContadorStateful()
    ),),
    );
  }
}

class ContadorStateful extends StatefulWidget {

  @override
  State<ContadorStateful> createState() => ContadorState();

}

class ContadorState extends State<ContadorStateful> {

  var contador = 0;
  var txtValor = TextEditingController();

  Widget contadorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: () {
          setState(() {
            contador++;
          });
        }, icon: Icon(Icons.plus_one)),
        Text('$contador', style: TextStyle(color: Colors.blue, fontSize: 30),),
        IconButton(onPressed: (){
          setState(() {
            contador--;
          });

        }, icon: Icon(Icons.exposure_minus_1))
      ],);
  }

  Widget novoValorWidget() {
    return Row(mainAxisAlignment: MainAxisAlignment.center,
    children: [
      TextField(controller: txtValor,decoration: InputDecoration(constraints: BoxConstraints(maxWidth: 200),
        border: OutlineInputBorder(),
    hintText: 'Enter a search term',
    ),),
      IconButton(onPressed: (){
        setState((){
          contador = int.parse(txtValor.text);
        });
      }, icon: Icon(Icons.check))
    ],);
  }
  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [contadorWidget(), novoValorWidget()],);

  }
}

