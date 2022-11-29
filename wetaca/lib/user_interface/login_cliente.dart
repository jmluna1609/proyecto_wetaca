//creamos la clase login_cliente
// esto es solamente el diseño de la interfaz

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCliente extends StatefulWidget {
  const LoginCliente({Key? key}) : super(key: key); //constructor
  @override
  State<LoginCliente> createState() => _LoginClienteState();
}

//creamos la clase _LoginClienteState
class _LoginClienteState extends State<LoginCliente> {
  final _usernametextcontroller =
      TextEditingController(); //controlador de texto para el usuario
  final _passwordtextcontroller = TextEditingController();

  @override
  Widget build(BuildContext contexto1) {
    return BlocProvider(
      create: (context) => LoginClienteBloc(), //creamos el bloc
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login Cliente'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Iniciar Sesión',
                style: TextStyle(fontSize: 30),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _usernametextcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Usuario',
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                controller: _passwordtextcontroller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Contraseña',
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  BlocProvider.of<LoginClienteBloc>(context).add(
                    LoginClienteButtonPressed(
                      username: _usernametextcontroller.text,
                      password: _passwordtextcontroller.text,
                    ),
                  );
                },
                child: const Text('Iniciar Sesión'),
              ),
            ],
          ),
        ),
      ),
    );
  } //controlador de texto para la contraseña

}
