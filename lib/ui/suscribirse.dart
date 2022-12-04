import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

//esta laparte donde se suscribe el cliente nuevo
class Suscribirse extends StatefulWidget {
  const Suscribirse({Key? key}) : super(key: key);
  @override
  _SuscribirseState createState() => _SuscribirseState();
}

class _SuscribirseState extends State<Suscribirse> {
  final _fullNameController = TextEditingController(); //nombre
  final _fullLastNameController = TextEditingController(); //apellido
  final _fullEmailController = TextEditingController(); //email
  final _usernameController = TextEditingController(); //usuario
  final _passwordController = TextEditingController(); //contraseña
  final _passwordConfirmController =
      TextEditingController(); //confirmar contraseña
  final _phoneController = TextEditingController(); //telefono

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SUSCRIPCIÓN"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("INGRESE SUS DATOS"),
            //nombre
            TextField(
              controller: _fullNameController,
              decoration: const InputDecoration(
                hintText: "Nombres",
              ),
            ),
            //apellido
            TextField(
              controller: _fullLastNameController,
              decoration: const InputDecoration(
                hintText: "Apellidos",
              ),
            ),
            //email
            TextField(
              controller: _fullEmailController,
              decoration: const InputDecoration(
                hintText: "Correo",
              ),
            ),
            //usuario
            TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                hintText: "Nombre de usuario",
              ),
            ),
            //contraseña
            TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                hintText: "Contraseña",
              ),
            ),
            //confirmar contraseña
            TextField(
              controller: _passwordConfirmController,
              decoration: const InputDecoration(
                hintText: "Confirmar contraseña",
              ),
            ),
            //telefono
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(
                hintText: "Telefono",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    onPressed: () {
                      // BlocProvider.of<AppCubit>(context)
                      //     .login(_usernameController.text, _passwordController.text);
                    },
                    child: const Text("Crear cuenta")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      Navigator.pushNamed(context, "/");
                    },
                    child: const Text("Cancelar"))
              ],
            )
          ],
        ),
      ),
    );
  }
}
