import 'package:flutter/material.dart';

class HacerPedido extends StatefulWidget {
  const HacerPedido({Key? key}) : super(key: key);

  @override
  State<HacerPedido> createState() => _HacerPedidoState();
}

class _HacerPedidoState extends State<HacerPedido> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nuevo pedido"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Nuevo pedido"),
            Text("Segunda Línea"),
          ],
        ),
      ),
    );
  }
}
