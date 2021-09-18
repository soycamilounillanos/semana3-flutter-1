import 'package:flutter/material.dart';
import 'package:semana3noticias/models/articulo.model.dart';
import 'package:semana3noticias/providers/articulo.provider.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ArticuloProvider articuloProvider = ArticuloProvider();

  Future<List<Articulo>> articulos = Future.value([]);

  @override
  void initState() {
    articulos = articuloProvider.getArticulos();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Noticias"),
      ),
      body: _body(),
    );
  }

  _body() {
    return FutureBuilder(
        future: articulos,
        builder: (BuildContext buildContext, AsyncSnapshot asyncSnapshot) {
          if (asyncSnapshot.hasData) {
            List<Widget> list = [];
            asyncSnapshot.data.forEach((item) => {
              list.add(Text(item.author))
            });
            return ListView(children: list);
          }
          return Text("Buscando");
        });
  }
}
