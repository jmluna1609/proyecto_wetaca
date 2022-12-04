import 'package:flutter/material.dart';

class OlvidoPassword extends StatefulWidget {
  const OlvidoPassword({Key? key}) : super(key: key);
  @override
  State<OlvidoPassword> createState() => _OlvidoPasswordState();
}

//esta clase es la que se encarga de crear el estado de la pagina
class _OlvidoPasswordState extends State<OlvidoPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Olvido Password"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Olvido Password"),
          ],
        ),
      ),
    );
  }
}
