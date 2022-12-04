import 'package:flutter/material.dart';

class ListaPlatosAdmiPage extends StatefulWidget {
  const ListaPlatosAdmiPage({Key? key}) : super(key: key);

  @override
  _ListaPlatosAdmiPageState createState() => _ListaPlatosAdmiPageState();
}

class _ListaPlatosAdmiPageState extends State<ListaPlatosAdmiPage> {
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
              children: [],
            ),
          ],
        ),
      ),
    );
  }
}
