import 'package:flutter/material.dart';

class PlatoInfoPage extends StatefulWidget {
  const PlatoInfoPage({Key? key}) : super(key: key);

  @override
  _PlatoInfoPageState createState() => _PlatoInfoPageState();
}

class _PlatoInfoPageState extends State<PlatoInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Plato"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const Text("Nombre del plato"),
                const Text("Descripción"),
                const Text("Ingredientes"),
                const Text("Precio"),
                Row(
                  children: [
                    // Mediante un boton aumentar la cantidad de platos a pedir que inicialmente es 1
                    const Text("Cantidad"),
                    // Boton para agregar al carrito
                    ElevatedButton(
                      onPressed: () {
                        // BlocProvider.of<AppCubit>(context)
                        //     .login(_usernameController.text, _passwordController.text);
                      },
                      child: const Text("Agregar al carrito"),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
