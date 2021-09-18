import 'package:flutter/material.dart';

import './pages/home.page.dart';

main() {
  runApp(MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Aplicacion de noticias",
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
