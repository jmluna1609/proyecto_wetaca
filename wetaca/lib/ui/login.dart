// ignore_for_file: deprecated_member_use

import 'dart:async';

import 'package:wetaca/cubit/login_cubit.dart';
import 'package:wetaca/cubit/login_state.dart';
import 'package:wetaca/cubit/page_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext ctx1) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("BIENVENIDO"),
          ),
          body: BlocConsumer<LoginCubit, LoginState>(
            // Escucho los eventos que llegan del Cubit
            listener: (ctx3, state) {
              // Si el cubit dice cargando, se muestra un Dialog
              if (state.status == PageStatus.loading) {
                _showDialog(context, "Autenticación", "Verificando...", false);
              } else if (state.status == PageStatus.success &&
                  state.loginSuccess) {
                // Si el cubit dice que la autenticación fue correcta,
                // se va a la pagian princial
                Navigator.pop(ctx3); // quito el dialog
                Navigator.pushNamed(ctx3, '/home');
              } else {
                // Si el cubit dice que hubo error se lo muestra.
                Navigator.pop(ctx3); // quito el dialog
                _showDialog(context, "Error", state.errorMessage!, true);
              }
            },
            // Construimos la pantalla
            builder: (context, state) => Center(child: formLogin(context)),
          )),
    );
  }

  // Se construye la pantalla de Login.
  Widget formLogin(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Align(
          alignment: const Alignment(0.00, -0.60),
          child: Image.network(
            "https://images.prismic.io/rakuten-europe/d7b25e51-f442-4e38-bc28-44e89576bffb_wetaca.png?auto=compress,format",
            height: 100,
            width: 200,
            fit: BoxFit.cover,
          ),
        ),
        TextField(
          controller: _usernameController,
          decoration: const InputDecoration(
            hintText: "Usuario:",
          ),
        ),
        TextField(
          controller: _passwordController,
          decoration: const InputDecoration(
            hintText: "Contraseña:",
          ),
          obscureText: true,
        ),

        // Botón de Login
        ElevatedButton(
            // Los eventos desde UI, se lo envial al CUTBIT
            onPressed: () {
              //TODO: tomar nota de esto
              BlocProvider.of<LoginCubit>(context)
                  .login(_usernameController.text, _passwordController.text);
              // Navigator.pushNamed(context, '/rutaPagPrincipal');
            },
            child: const Text("LOGIN")),
        // Botón de Registro para un nuevo usuario
        ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/suscribirse');
            },
            child: const Text("REGÍSTRATE")),
        FlatButton(
            textColor: Colors.blue,
            child: const Text("¿Olvidaste tu contraseña?"),
            onPressed: () {
              Navigator.pushNamed(context, '/olvidopass');
            }),
      ],
    );
  }

// Muestra un Dialog
  Future<void> _showDialog(BuildContext context, String title, String message,
      bool closeable) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // usuario debe tocar el botón!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(message),
              ],
            ),
          ),
          actions: <Widget>[
            closeable
                ? TextButton(
                    child: const Text('Cerrar'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
