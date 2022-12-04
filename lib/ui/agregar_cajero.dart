import 'package:flutter/material.dart';

//esta clase es la que se encarga de crear el estado de la pagina
class AgregarCajero extends StatefulWidget {
  const AgregarCajero({Key? key}) : super(key: key);

  @override
  State<AgregarCajero> createState() => _AgregarCajeroState();
}

class _AgregarCajeroState extends State<AgregarCajero> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Agregar Cajero"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Agregar Cajero"),
          ],
        ),
      ),
    );
  }
}
