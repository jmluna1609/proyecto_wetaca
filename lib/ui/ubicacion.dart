import 'package:flutter/material.dart';

class Ubicacion extends StatefulWidget {
  const Ubicacion({Key? key}) : super(key: key);

  @override
  State<Ubicacion> createState() => _UbicacionState();
}

//esta clase es la que se encarga de crear el estado de la pagina

class _UbicacionState extends State<Ubicacion> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ubicacion"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Ubicacion"),
          ],
        ),
      ),
    );
  }
}
