import 'package:flutter/material.dart';

import 'menu_lateral.dart';

class ComoFuncionaPage extends StatelessWidget {
  const ComoFuncionaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            '¿COMO FUNCIONA?',
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
          actions: [
            IconButton(
              // icono de carrito de compras
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
        // colocar en el body un Scroll

        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 20,
            ),
            const Text(
                'Tu eres quien decide que comer, nosotros \n nosotros cocinamos y te lo enviamos a casa\n',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(
                'Opcion 1. Pide a la carta\n Elige la variedad de platos, postres, tu haces tu menú',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 10,
            ),
            const Text(
                'Tú decides cuando hacer tu pedido, que dias y que platos elegir\n ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(
                'Cada semana tendras que dedicar tiempo a pedir y elegir tus platos\n',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(
                'Cada semana pagaras un importe distinto, segun los platos que elijas',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 20,
            ),
            const Text(
                'Opcion 2. SUSCRIBETE\n Elije los platos del menu que desees\n',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text('Podras cancelar o editar cuando quieras. Tú mandas',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const Text(
                'Tendras un precio maximo, si no haces cambios nunca pagaras por demas',
                style: TextStyle(fontWeight: FontWeight.bold)),
          ]),
        ));
  }
}
