import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wetaca/ui/widget/textFieldIcon.dart';

import '../classes/plato.dart';
import '../classes/user.dart';
import '../cubit/registerplato_cubit.dart';

class RegisterPlatosPage extends StatefulWidget {
  const RegisterPlatosPage({Key? key}) : super(key: key);

  @override
  State<RegisterPlatosPage> createState() => _RegisterPlatoPageState();
}

class _RegisterPlatoPageState extends State<RegisterPlatosPage> {
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _fonoController = TextEditingController();

  @override
  Widget build(BuildContext ctx1) {
    return BlocProvider(
      create: (context) => RegisterPlatoCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Registro Platos"),
          ),
          body: BlocConsumer<RegisterPlatoCubit, RegisterPlatoState>(
              listener: (ctx3, state) {
            if (state is RegisterSuccess) {
              // Navigator.pop(ctx3); // quito el dialog8888
              Navigator.pushNamed(ctx3, '/');
              _showDialog(context, "Plato creada!",
                  "El plato se creó correctamente.", true, '/home');
              // Navigator.pushNamed(ctx3, '/home');

            } else if (state is RegisterFailure) {
              Navigator.pop(ctx3); // quito el dialog
              _showDialog(context, "Error", state.errorMessage, true,
                  '/registerPlatos');
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
                      const Text("Regístra el Plato",
                          style: TextStyle(
                              color: Color.fromARGB(255, 103, 103, 103),
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                      const Text("Nombre del plato"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa el nombre del plato",
                            Icons.abc,
                            _firstNameController,
                            TextInputType.name),
                        height: 50,
                      ),
                      const Text("Precio"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa el precio del plato",
                            Icons.price_change,
                            _lastNameController,
                            TextInputType.name),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text("Ingrese descripcion del plato"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa descripcion",
                            Icons.description,
                            _emailController,
                            TextInputType.name),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text("Ingredientes"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa los ingredientes",
                            Icons.food_bank_outlined,
                            _usernameController,
                            TextInputType.name),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                      const Text("Categoria"),
                      SizedBox(
                        child: textFieldIcon(
                            "Ingresa la categoria",
                            Icons.category,
                            _fonoController,
                            TextInputType.emailAddress),
                        height: 50,
                      ),
                      const SizedBox(height: 20),
                    ]),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        if (allFieldsAreFilled()) {
                          Plato plato = Plato(
                            nombre: _firstNameController.text,
                            precio: _lastNameController.text,
                            descripcion: _emailController.text,
                            ingredientes: _usernameController.text,
                            categoria: _fonoController.text,
                          );
                          BlocProvider.of<RegisterPlatoCubit>(context)
                              .register(plato);
                        }
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(150, 35)),
                      child: const Text("Crear Plato")),
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
        _emailController.text.isEmpty ||
        _fonoController.text.isEmpty) {
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
