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
            Text(
              'SUSCRIBETE GRATIS',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),
            // Agregamos SizedBox para separar los elementos
            SizedBox(height: 20),
            // Centramos un imagen de la carpeta assets
            Image.asset('assets/imagen1.jpg'),
            // Agregar SizedBox para separar los elementos
            SizedBox(height: 20),
            // Colocar al texto una negrita
            // hacer salto de linea con \n

            Text(
              'No te preocupes por preparar \ntu comida, WETACA lo \n prepara por ti\n ',
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),

            Text(
              'SUSCRIBETE Y HAZ TU PEDIDO',
              style: TextStyle(fontSize: 30, color: Colors.black),
            ),

            // Agregamos SizedBox para separar los elementos
            SizedBox(height: 20),
            // Se ingresa un boton para Iniciar Sesion
            ElevatedButton(
              child: Text('Iniciar Sesion'),
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
            ),

            // despues colocamos un boton que ocupe todo el ancho y este pegado a la parte inferior
            // este te dirigira al navegador web con la url http://www.energym.com.bo/
            // para esto se debe importar la libreria url_launcher
            // y agregar en el pubspec.yaml
            // url_launcher: ^6.0.9
            // y luego ejecutar flutter pub get
            Expanded(
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
