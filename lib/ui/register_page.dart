import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wetaca/ui/widget/textFieldIcon.dart';

import '../classes/user.dart';
import '../cubit/register_cubit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _ciController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailController = TextEditingController();
  final _password2Controller = TextEditingController();
  final _fonoController = TextEditingController();

  @override
  Widget build(BuildContext ctx1) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Registro"),
          ),
          body: BlocConsumer<RegisterCubit, RegisterState>(
              listener: (ctx3, state) {
            if (state is RegisterSuccess) {
              // Navigator.pop(ctx3); // quito el dialog8888
              Navigator.pushNamed(ctx3, '/');
              _showDialog(context, "Cuenta creada!",
                  "La cuenta se creó correctamente. Inicie sesión", true, '/');
              // Navigator.pushNamed(ctx3, '/home');

            } else if (state is RegisterFailure) {
              Navigator.pop(ctx3); // quito el dialog
              _showDialog(
                  context, "Error", state.errorMessage, true, '/register');
            }
          }, builder: (context, state) {
            if (state is RegisterInitial) {
              return Center(child: registerForm(context));
            } else if (state is RegisterLoading) {
              return buildLoading();
            } else {
              return Center(child: registerForm(context));
            }
          })),
    );
  }

  Widget registerForm(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      const Text("Regístrate",
                          style: TextStyle(
                              color: Color.fromARGB(255, 103, 103, 103),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      const Text("Cedula de Identidad"),
                      SizedBox(
                        child: textFieldIcon("Ingresa tu CI", Icons.pages,
                            _ciController, TextInputType.name),
                        height: 50,
                      ),
                      const Text("Nombre(s)"),
                      SizedBox(
                        child: textFieldIcon("Ingresa tu nombre", Icons.abc,
                            _firstNameController, TextInputType.name),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text("Apellido(s)"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa tu apellido",
                            Icons.account_box,
                            _lastNameController,
                            TextInputType.name),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text("Usuario"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa tu nombre de usuario",
                            Icons.person,
                            _usernameController,
                            TextInputType.name),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text("Correo electrónico"),
                      SizedBox(
                        child: textFieldIcon("Ingresa tu correo", Icons.email,
                            _emailController, TextInputType.emailAddress),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text("Telefono"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa tu numero de telefono",
                            Icons.phone,
                            _fonoController,
                            TextInputType.emailAddress),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text("Contraseña"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa tu contraseña",
                            Icons.lock,
                            _passwordController,
                            TextInputType.visiblePassword),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text("Confirmar contraseña"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa tu contraseña nuevamente",
                            Icons.lock,
                            _password2Controller,
                            TextInputType.visiblePassword),
                        height: 50,
                      ),
                    ]),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (_password2Controller.text !=
                            _passwordController.text) {
                          _showDialog(
                              context,
                              "Error",
                              "Las contraseñas no coinciden",
                              true,
                              '/register');
                        } else if (allFieldsAreFilled()) {
                          if (EmailValidator.validate(_emailController.text)) {
                            User user = User(
                              ciuser: _ciController.text,
                              firstName: _firstNameController.text,
                              lastName: _lastNameController.text,
                              email: _emailController.text,
                              fono: _fonoController.text,
                              username: _usernameController.text,
                              secret: _passwordController.text,
                            );
                            BlocProvider.of<RegisterCubit>(context)
                                .register(user);
                          } else {
                            _showDialog(context, "Error",
                                "El correo no es válido", true, '/register');
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 35)),
                      child: const Text("Crear cuenta")),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, "/");
                      },
                      child: const Text("Cancelar"))
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ],
    );
  }

  bool allFieldsAreFilled() {
    if (_firstNameController.text.isEmpty ||
        _lastNameController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _password2Controller.text.isEmpty) {
      _showDialog(context, "Campos vacíos",
          "Por favor, llene todos los campos obligatorios", true, '/register');
      return false;
    }
    return true;
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Future<void> _showDialog(BuildContext context, String title, String message,
      bool closeable, String lastPage) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
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
                      Navigator.of(context).popAndPushNamed(lastPage);
                    },
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
