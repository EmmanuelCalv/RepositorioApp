// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace, unnecessary_this

//import 'dart:js';

import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  final Widget child;

  const AuthBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color de fondo
      //color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack(
        children: [
          _ContenedorMorado(),
          //contenedor de division
          //SafeArea hace una divicion  extra para el notch
          //HeaderIcon se convierte o se extrae en un nievo metodo
          _HeaderIcon(),

          //child Stack
          this.child,
        ],
      ),
    );
  }
}

//Se extrae el widget para que quede el codigo mas limpio
class _HeaderIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        width: double.infinity,
        //margen del icono debajo del noch para celulares con noch
        margin: EdgeInsets.only(top: 30),
        child: Icon(
          Icons.person_pin,
          color: Colors.white,
          size: 100,
        ),
        // color: Colors.red,
      ),
    );
  }
}

class _ContenedorMorado extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpleBackground(),
      // ignore: duplicate_ignore
      child: Stack(
        children: [
          Positioned(
            //1
            child: _Bubble(),
            top: 90,
            left: 30,
          ),
          //Posisionamiendo del diseño de los circulos
          Positioned(
            //2
            child: _Bubble(),
            top: -40,
            left: -30,
          ),
          Positioned(
            //3
            child: _Bubble(),
            top: -50,
            right: -20,
          ),
          Positioned(
            //4
            child: _Bubble(),
            bottom: -50,
            left: 10,
          ),
          Positioned(
            //5
            child: _Bubble(),
            bottom: 120,
            right: 20,
          )
        ],
      ),
    );
  }

  BoxDecoration _purpleBackground() => BoxDecoration(
          gradient: LinearGradient(colors: [
        Color.fromRGBO(63, 63, 156, 1),
        Color.fromRGBO(90, 70, 178, 1)
      ]));
}

class _Bubble extends StatelessWidget {
  const _Bubble({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Color.fromRGBO(255, 255, 255, 0.05),
          //LOGOS FLOTANTES
          image: DecorationImage(
              image: AssetImage('assets/screen.png'), fit: BoxFit.cover)),
    );
  }
}
