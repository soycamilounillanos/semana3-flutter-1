import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/models/articulo.model.dart';
import 'package:flutter_share/flutter_share.dart';


class DetallePage extends StatelessWidget {
  final Articulo articulo;
  const DetallePage({required this.articulo});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Noticias"),
        ),
        body: _body());
  }

  _body() {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(18, 20, 0, 20),
          child: Row(
            children: [
              Text(DateFormat("dd-MM-yyyy").format(articulo.publishedAt))
            ],
          ),
        ),
        GestureDetector(
          onTap: share,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [Icon(Icons.share)],
          )
        ),
        articulo.urlToImage == ''
            ? Image(image: AssetImage("assets/no-image.png"))
            : FadeInImage(
                placeholder: AssetImage("assets/loading.gif"),
                image: NetworkImage(articulo.urlToImage)),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(articulo.title),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Autor: ${articulo.author}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Titulo: ${articulo.title}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(articulo.description),
        ),
      ],
    );
  }

  Future<void> share() async {
    await FlutterShare.share(
        title: articulo.title,
        text: articulo.description,
        linkUrl: articulo.url,
        chooserTitle: articulo.title
    );
  }

}
