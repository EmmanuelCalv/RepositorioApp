// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, unnecessary_new

import 'package:flutter/material.dart';
import 'package:productos_app/providers/login_form_provider.dart';

import 'package:productos_app/widgets/widgetss.dart';
import 'package:productos_app/ui/input_decoration.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AuthBackground(
          child: SingleChildScrollView(
        //Dentro de la columna nos permite meter widgets  encima de otro
        child: Column(
          //Dentro del children  nos permite poner varios widgets
          children: [
            SizedBox(height: 200),
            //Todo dentro de nuestro CardContainer estar denrtro del contenedor donde esta el Login y su formulario
            CardContainer(
              child: Column(
                //Recordar que cuando pónemos un Column  es poque vamos a poner Widgets  dentro de uno mismo
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text('A L V A R T ',
                      style: Theme.of(context).textTheme.headline4),
                  SizedBox(height: 30),

                  ChangeNotifierProvider(
                    //en el create pide el context y una instancia
                    create: (_) => LoginFormProvider(),
                    child: _LoginForm(),
                  ),

                  //Text('Formulario')
                ],
              ),
            ),
            //Fuera del CardContainer muestra  la opcion de Crear nueva cuenta
            SizedBox(height: 50),
            //podemos poner el logo en esta parte

            Container(
              width: 500,
              height: 300,
              //color: Colors.red,
              //ImagenLOGO EN  AL
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage(
                  "assets/somos.png",
                  // "assets/somos.png",
                ),
              )
                  //fit: BoxFit.contain),
                  ),
              child: Scaffold(
                backgroundColor: Colors.transparent,
              ),
            ),

            Text('',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            //este SizeBox agrega mas Scroll a la caja de Login
            SizedBox(height: 50)
          ],
        ),
      )),
    );
  }
}

//Clase de formulario del Login "Nombre" y correo
class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Creando esta instancia Final de loginForm tenemos acceso a todo LoginFormProvider.dart
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        //FORM//Mantener la referencia al KEY(llave principal para validar el formulario  de los campos de mail  y password)
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,

        //El Widget Form va a tener una referencai al estado completo que tienen sus widgets Internos
        child: Column(
          children: [
            //TextFormField() Muestra el Form para el texto y excribir en el con el teclado
            TextFormField(
              //en false le decimos que no nos autocorriga, ya que estio se usara en correos @
              autocorrect: false,
              //Nos permite poner el @ en el teclado
              keyboardType: TextInputType.emailAddress,
              //La decoracion de la linea del input se hace mas notable con un color diferente haciendolo mas personalisable
              //por esta razon se usa el InputDecoration()
              decoration: InputDecorations.authInputDecoration(
                hintText: '@unialvart.edu.mx',
                labelText: 'Correo Electronico',
                prefixIcon: Icons.alternate_email,
              ),
              //se le asigna el valor  de lo que se escriba en el valor de email
              onChanged: (value) => loginForm.email = value,
              //validador de valores XD  este regresa un String de bajo de la caja de texto del Correo Electronico, se Activa con el AutoValidateMode
              //validator: (value) => 'hola' ,
              validator: (value) {
                //Evalua la cadena de  expresiones regulares
                String pattern =
                    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                RegExp regExp = new RegExp(pattern);
                //vamos a usar regExp mediante un ternario ya que HasMatch hace que si la regExp hace Match con un valor de la expresion regular
                return regExp.hasMatch(value ?? '')
                    //? = entonces regreso un... null  ":" estos dos puntos siginifica(CASO CONTRARIO)
                    ? null
                    : 'El valor ingresado no luce como correo';
                //Entonces esta parte nos indica si intentamos escribir algo que no es un correo nos pondr un mensaje de "El valor o el correo no es correto"
              },
              //el InputDecorations es la clase creada en la caprte UI
              //en el input decoration hacemo referecnai a la clase que creamos y mandamos a llamra con .authInputDecoration totalmente la clase
            ),

            SizedBox(
              height: 30,
            ),

            TextFormField(
              autocorrect: false,
              //obscureText nos permite ocultar lo que la persona esta escribiendo
              obscureText: true,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock,
              ),
              //se le asigna el valor  de lo que se escriba en el valor de password
              onChanged: (value) => loginForm.password = value,
              //Copiamos de nuevo el validador en este TextFormField
              validator: (value) {
                //Le decimos que el valor debe ser diferente de null y el valor debe de ser mayor o igual a 6 caracteres
                return (value != null && value.length >= 6)
                    ? null
                    : 'La contraseña debe tener 6 caracteres especiales';
              },
            ),
            SizedBox(height: 30),

            //Crear boton y sus estilos desde los bordes, el texto
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.deepPurple,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                  child: Text(
                    //Esta parte de loginform  le estamos diciendo o preguntando  que si esta cargando.. ? entonces, 'Espere' : caso contrario 'Ingresar'
                    loginForm.isLoading ? 'Ingresando..' : 'Ingresar',
                    //
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                //funcion despues del Onpres:login.isloading = es para desactivar el boton
                onPressed: loginForm.isLoading
                    ? null
                    : () async {
                        //Focus hace la funcion de quitar el teclado al momento de dar click en el boton
                        FocusScope.of(context).unfocus();

                        // ignore: todo
                        //TODO:login Aqui llamamos a nuestro LoginForm o nuestra accion del formulario en el  btn
                        if (!loginForm.isValidForm()) return;
                        //en esta condicion le decimos que "Si es false se hara un return "
                        loginForm.isLoading = true;
                        //cuando le ponemos true activamos el 'Espere o la carga de datos'
                        //

                        //
                        //Duracion del delay
                        await Future.delayed(Duration(seconds: 2));
                        //
                        //Validacion del login
                        //Validar si el login es correcto(USO DE BACK-END)
                        loginForm.isLoading = false;
                        //
                        //si es true entonces accede a la pagina/pantalla  de Home
                        //PODEMOS CAMBIAR LA PAGINA DE CUANDO INICIE SESION MANDARLA A OTRA, HOME/LISTA PAGE, OTRAS PAGINAS
                        Navigator.pushReplacementNamed(context, 'home');
                      })
          ],
        ),
      ),
    );
  }
}
