import 'package:flutter/material.dart';

class PlatoEditarAdmiPage extends StatefulWidget {
  const PlatoEditarAdmiPage({Key? key}) : super(key: key);

  @override
  _PlatoEditarAdmiPageState createState() => _PlatoEditarAdmiPageState();
}

class _PlatoEditarAdmiPageState extends State<PlatoEditarAdmiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
