import 'package:flutter/material.dart';
import 'package:wetaca/ui/menu_lateral.dart';
import 'package:url_launcher/url_launcher.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  _MenuPrincipalState createState() => _MenuPrincipalState();
}

class _MenuPrincipalState extends State<MenuPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        // En la Appbar colocamos un IconButton en el lado derecho
        // que al presionarlo lleve a otra pantalla
        appBar: AppBar(
          title: Text('Menu Principal'),
          actions: [
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            )
          ],
        ),
        /*
        appBar: AppBar(
          title: Text('Menu Principal'),
        ),*/
        drawer: MenuLateral(),
        body: Center(
            child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Center(
              child: const Text("SUSCRIBETE GRATIS",
                  style: TextStyle(
                      color: Color.fromARGB(255, 103, 103, 103),
                      fontSize: 30,
                      fontWeight: FontWeight.bold)),
            ),
            // Agregamos SizedBox para separar los elementos
            SizedBox(height: 30),
            // Centramos un imagen de la carpeta assets
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/imagen_menu_principal.jpg"),
                      fit: BoxFit.cover)),
            ),
            // Agregar SizedBox para separar los elementos
            SizedBox(height: 20),
            // Colocar al texto una negrita
            // hacer salto de linea con \n

            Text(
              'No te preocupes por preparar tu comida, \n   WETACA lo prepara por ti. ',
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 8),

            Text(
              'SUSCRIBETE Y HAZ TU PEDIDO',
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),

            // Agregamos SizedBox para separar los elementos
            SizedBox(height: 35),
            // Se ingresa un boton para Iniciar Sesion

            // despues colocamos un boton que ocupe todo el ancho y este pegado a la parte inferior
            // este te dirigira al navegador web con la url http://www.energym.com.bo/
            // para esto se debe importar la libreria url_launcher
            // y agregar en el pubspec.yaml
            // url_launcher: ^6.0.9
            // y luego ejecutar flutter pub get
            Container(
              height: 100,
              width: 400,
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  child: Text('ESPACIO PUBLICITARIO'),
                  onPressed: () {
                    _launchURL();
                  },
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }
}

void _launchURL() async {
  launch("http://www.energym.com.bo/");
}
