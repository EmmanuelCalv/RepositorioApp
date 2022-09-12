//Formulario de Login con Provider(que basicamente se encarga de ser nuestro provedor)
// ignore_for_file: unnecessary_new, avoid_print

import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  // El GlobalKey nos permite jugar con los Key que se colocaran en el Form del LoginSc.dart
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();
  //

  //El ChangeNotifier nos permirte colocar esta clase en un multiProvider o en un Nofifier
  //
  //valores
  String email = '';
  String password = '';

  //new propiedad  "no reactiva"
  bool _isLoading = false;
  //Propiedad
  bool get isLoading => _isLoading;
  //
  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  //Cuando queremos que una variable redibuje el widget  necesitamos variables  reactivas en de nuestra clase como por ejemplo el valor (bool)
  //bool isLoading;

  bool isValidForm() {
    //Forma de validar los campos por separado
    print('$email - $password');

    //print(formKey.currentState?.validate()); forma de validar los dos campos al mismo tiempo

    return formKey.currentState?.validate() ?? false;
    //true = si el formulario es valido, false = si no es  valido
  }
}
