import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(Mapa());
}

class Mapa extends StatefulWidget {

  @override
  State<Mapa> createState() => MapaState();
}

class MapaState extends State<Mapa> {

  Completer<GoogleMapController> controller = Completer();
  static final CameraPosition inicio = CameraPosition(target: LatLng(0, 0), zoom: 10.0);

  var maracadores = Set<Marker>();
  @override
  Widget build(BuildContext context) {
      return MaterialApp(title: 'Mapa',
      home: Scaffold(appBar: AppBar(title: Text('Mapa'),
      ),
        body: GoogleMap(
          onTap: ((param){
            var mAtual =  Marker(infoWindow: InfoWindow(title: "Local Atual", snippet: "Sua localização atual"),
                markerId: MarkerId(param.longitude.toString() + '-' + param.latitude.toString()),
                position: LatLng(param.latitude, param.longitude));

            setState(() {
              maracadores.add(mAtual);
            });
          }),
          markers: maracadores,
          initialCameraPosition: inicio,
          mapType: MapType.normal,
          onMapCreated: (GoogleMapController ctrl){
              controller.complete(ctrl);


          },
        ),
      ),
      );
  }
}
