import 'package:flutter/material.dart';
import 'package:semana3noticias/models/articulo.model.dart';
import 'package:intl/intl.dart';
import 'package:semana3noticias/pages/detalle.page.dart';

class CardWidget extends StatelessWidget {
  final Articulo articulo;

  const CardWidget({required this.articulo});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context, 
          MaterialPageRoute(
            builder: (context) => DetallePage(articulo: articulo)
          )
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(color: Colors.black26),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(18, 20, 0, 20),
                  child: Row(
                    children: [
                      Text(
                          DateFormat("dd-MM-yyyy").format(articulo.publishedAt))
                    ],
                  ),
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
              ],
            )
        ),
      ),
    );
  }
}
