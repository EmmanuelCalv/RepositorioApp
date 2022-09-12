// ignore_for_file: use_key_in_widget_constructors, unnecessary_this, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class CardContainer extends StatelessWidget {
  //este child, es nuestro widget Interno y nos permite quitar o bloquear el height del container del Padding
  final Widget child;

  const CardContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        width: double.infinity,
        //el pading se encarga de poner un espacio dentro del Widget Child en .all  le decimos que en todos los bordes aplique un espacio
        padding: EdgeInsets.all(20),
        //height: 250, podemos quitarlo cuando creamos nuestro widget  inetrno llamado child en el final Widget

        //color: Colors.red,
        //colocacion de una decoracion
        decoration: _createCardShape(),
        child: this.child,
      ),
    );
  }

  BoxDecoration _createCardShape() {
    return BoxDecoration(
      //Redondeado de los bordes de la caja de login
      color: Colors.white, borderRadius: BorderRadius.circular(25),
      boxShadow: [
        BoxShadow(
            color: Colors.black12,
            blurRadius: 15,

            //Offset (Mueve el sombreado de derecha a izquierda 0, Muve el sombredo de arriba  y abajo)
            offset: Offset(0, 5))
      ],
    );
  }
}
