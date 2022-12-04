import 'package:flutter/material.dart';

import 'menu_lateral.dart';

class ListaPlatosPage extends StatefulWidget {
  const ListaPlatosPage({Key? key}) : super(key: key);

  @override
  _ListaPlatosPageState createState() => _ListaPlatosPageState();
}

class _ListaPlatosPageState extends State<ListaPlatosPage> {
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
      drawer: MenuLateral(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
