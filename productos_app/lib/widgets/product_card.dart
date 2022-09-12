// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables, sized_box_for_whitespace

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        margin: EdgeInsets.only(top: 30, bottom: 50),
        width: double.infinity,
        height: 400,
        decoration: _cardBorders(),
        child: Stack(
          //la proppiedad Aligment nos permite mover  la parte de los detalles en el lugar que nosostro queremos mostrar algo diferente
          alignment: Alignment.bottomLeft,
          children: [
            _BackGroundImage(),
            _ProductDetails(),
            //
            Positioned(
              top: 0,
              right: 0,
              //
              child: _PriceTag(),
            ),
            //Disponibilidad Mostrarar unna condicional
            Positioned(
              top: 0,
              left: 0,
              //
              child: _NotAvailable(),
            ),
          ],
        ),
      ),
    );
  }

  //box de las tarjetas de los productos
  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(31, 61, 50, 112),
              //offset(x,y)
              offset: Offset(0, 5),
              blurRadius: 10,
            )
          ]);
}

//NOTAVAILABLE Disponibilidad del producto
class _NotAvailable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: FittedBox(
        fit: BoxFit.contain,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            'No disponible',
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
        ),
      ),
      width: 100,
      height: 70,
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 175, 169, 109),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25), bottomRight: Radius.circular(25))),
    );
  }
}
//

//PriceTag
class _PriceTag extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // Detalle de Precio en la parte inferior derecha del contenedor
      child: FittedBox(
        //eL FittedBox nos permite hacer que se adapte o como queremos se de adapte el texto o Widget Interno
        fit: BoxFit.contain,
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            //precio de los productos  child: Text('\$134.00',
            child: Text('N°..',
                style: TextStyle(color: Colors.white, fontSize: 20))),
      ),
      //_________________________________Contador de N°alumnos color de la caja
      width: 90,
      height: 70,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 140, 181, 63),
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      ),
    );
  }
}
//

/// Detalles del producto, que esta pososionada con un Aligment en la parte inferior de los boxes

class _ProductDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //el padding lo que crea con el only en right , esque le demos esa separacion de la caja azul(indigo) mas personalizado
      padding: EdgeInsets.only(right: 50),
      child: Container(
        //margenes marcados a dstacia tanto en H como V
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        width: double.infinity,
        height: 70,
        //color: Colors.indigo,
        //
        decoration: _buildBoxDecoration(),
        //
        //Ocuparemos Columna para poner los textos o la infromacion en forma de Columna
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              //primer nombre de la caja del card
              'LICENCIATURA..',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              maxLines: 1,
              //este overFlow es por si llega a salir de la linea de texto
              overflow: TextOverflow.ellipsis,
            ),
            Text(
              //descripcion
              'Grado:°  Grupo: " " ',
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      ),
    );
  }

  // Decoration de la caja de detalles
  BoxDecoration _buildBoxDecoration() => BoxDecoration(
      color: Color.fromARGB(255, 192, 15, 15),
      borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25), topRight: Radius.circular(25)));
  //
}

///
///Imagenes DE PRODUCTOS
class _BackGroundImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      //el hijo de ClipRRect para los bordes de las imagenes usamos borderRadius
      borderRadius: BorderRadius.circular(25),
      child: Container(
          color: Color.fromARGB(255, 0, 0, 0),
          width: double.infinity,
          height: 500,
          //color: Colors.red,
          child: FadeInImage(
            placeholder: AssetImage('assets/jar-loading.gif'),
            image: AssetImage("assets/Loading-alvart.gif"),

            //fit es para establecer el tamaño de la imagen conforme eel tamaño del box
            //fit: BoxFit.cover,
          )),
    );
  }
}
