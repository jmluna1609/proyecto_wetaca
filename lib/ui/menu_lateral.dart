import 'package:flutter/material.dart';
import 'package:wetaca/ui/profile_page.dart';

class MenuLateral extends StatelessWidget {
  const MenuLateral({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // cambiamos el color de fondo del menu lateral sin cambiar el codigo que esta
    return Drawer(
      child: Container(
        color: Colors.black87,
        child: ListView(
          children: [
            ListTile(
              title: Text(
                'INICIO',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/home");
              },
            ),
            ListTile(
              title: Text(
                'SUSCRIBETE',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/register");
              },
            ),
            ListTile(
              title: Text(
                'MENU ',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/home");
              },
            ),
            ListTile(
              title: Text(
                '¿COMO FUNCIONA? ',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/comoFunciona");
              },
            ),
            ListTile(
              title: Text(
                'CREAR PLATOS',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/registerPlato");
              },
            ),
            ListTile(
              title: Text(
                'PERFIL USUARIO',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.pushNamed(context, "/profile");
              },
            ),
          ],
        ),
      ),
    );
  }
  //class imagen
}
