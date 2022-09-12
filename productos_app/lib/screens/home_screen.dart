// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:productos_app/widgets/widgetss.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          //Centrado del Appbar titulo
          // ignore: unnecessary_new
          title: new Center(
        child: Text(
          'PASE DE LISTA',
          textAlign: TextAlign.center,
        ),
      )),
      //
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) => ProductCard(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.person),
        onPressed: () {},
      ),
    );
  }
}
