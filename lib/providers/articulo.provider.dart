import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'package:semana3noticias/models/articulo.model.dart';

class ArticuloProvider {
  Future<List<Articulo>> getArticulos() async {
    List<Articulo> articulos = [];
    Map<String, String> parametros = {
      'q': 'tesla',
      'from': '2021-09-17',
      'sortBy': 'publishedAt',
      'apiKey': '82ee7f9d408b473baffcf5400ca035c2'
    };
    var url = Uri.https('newsapi.org', '/v2/everything', parametros);

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      jsonResponse['articles']
          .forEach((value) => {articulos.add(Articulo.fromJson(value))});
      print(articulos);
      var itemCount = jsonResponse['totalItems'];
      print('Number of books about http: $itemCount.');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return articulos;
  }
}
