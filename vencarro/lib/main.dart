import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:vencarro/lista_veiculo.dart';
import 'package:vencarro/resumo.dart';

void main() {
  runApp(Splash());
}

class Splash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: SplashScreen(
        seconds: 10,
        title: const Text('Vencarro', style: TextStyle(fontSize: 20),),
        backgroundColor: Colors.white,
        photoSize: 120.0,
        navigateAfterSeconds: ListaVeiculos(),
        image: Image.network('https://cdn.pixabay.com/photo/2012/04/12/19/39/volga-30332_1280.png'),
      )
    );
  }

}