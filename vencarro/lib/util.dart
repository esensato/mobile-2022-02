import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vencarro/Veiculo.dart';

class Util {

  static Future<List<Veiculo>> obterMarcas() async {
    const urlMarca = 'https://parallelum.com.br/fipe/api/v1/carros/marcas';
    var ret = List<Veiculo>.empty(growable: true);
    var res = await http.get(Uri.parse(urlMarca));
      jsonDecode(res.body).forEach((item) {
        ret.add(Veiculo(idMarca: item['codigo'], marca: item['nome']));
      });
      return ret;
  }

}