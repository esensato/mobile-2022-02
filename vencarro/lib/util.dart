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

  static Future<List<Veiculo>> obterModelos(String idMarca, String marca) async {
    var urlModelo = 'https://parallelum.com.br/fipe/api/v1/carros/marcas/${idMarca}/modelos';
    print(urlModelo);
    var ret = List<Veiculo>.empty(growable: true);
    var res = await http.get(Uri.parse(urlModelo));
    jsonDecode(res.body)['modelos'].forEach((item) {
      ret.add(Veiculo(idMarca: idMarca, marca: marca, idModelo: item['codigo'].toString(), modelo: item['nome']));
    });
    return ret;
  }

  static Future<List<Veiculo>> obterAnos(String idMarca, String marca, String idModelo, String modelo) async {
    var urlAno = 'https://parallelum.com.br/fipe/api/v1/carros/marcas/${idMarca}/modelos/${idModelo}/anos';
    var ret = List<Veiculo>.empty(growable: true);
    var res = await http.get(Uri.parse(urlAno));
    jsonDecode(res.body).forEach((item) {
      ret.add(Veiculo(idMarca: idMarca, marca: marca, idModelo: idModelo, modelo: modelo,
                      idAno: item['codigo'], ano: item['nome']));
    });
    return ret;
  }
}