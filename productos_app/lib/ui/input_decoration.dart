//Decoracion de los inputs que se tengan

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class InputDecorations {
  //authInputDecoration es nuetro metodo estatico
  static InputDecoration authInputDecoration(
      {required String hintText,
      required String labelText,
      IconData? prefixIcon}) {
    return InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.deepPurple,
            width: 2,
          ),
        ),
        //hintText muestra el texto email de fondo en el input
        hintText: hintText,
        //label muetsra el ejemplo de  un correo
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: Colors.deepPurple)
            : null
        // Icon( Icons.alternate_email_sharp,
        //   color: Colors.deepPurple
        );
  }
}
