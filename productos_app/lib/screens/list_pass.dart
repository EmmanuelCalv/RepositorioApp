// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';

class ListaPage extends StatelessWidget {
  const ListaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 500,
      height: 200,
      color: Colors.red,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: new Text('Cargando perfil....'),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Color.fromARGB(255, 39, 36, 36),
      ),
    );
  }
}
