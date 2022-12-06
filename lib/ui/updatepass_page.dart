import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/recover_pass_cubit.dart';
import '../cubit/updatepass_cubit.dart';
import 'widget/textFieldIcon.dart';

class UpdatePassPage extends StatefulWidget {
  //Obtenemos email
  final String email;
  const UpdatePassPage({Key? key, required this.email}) : super(key: key);

  @override
  State<UpdatePassPage> createState() => _UpdatePassPageState();
}

class _UpdatePassPageState extends State<UpdatePassPage> {
  final _passwordController = TextEditingController();
  final _password2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdatePassCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Recuperar contraseña"),
          ),
          body: BlocConsumer<UpdatePassCubit, UpdatePassState>(
              listener: (ctx3, state) {
            if (state is UpdatePassSuccess) {
              // Navigator.pop(ctx3); // quito el dialog8888
              Navigator.pushNamed(ctx3, '/');
              _showDialog(
                  context,
                  "Contraseña actualizada!",
                  "La contraseña se actualizó correctamente. Inicie sesión",
                  true,
                  '/');
              // Navigator.pushNamed(ctx3, '/home');

            } else if (state is UpdatePassFailure) {
              Navigator.pop(ctx3); // quito el dialog
              _showDialog(context, "Error", state.errorMessage, true,
                  '/recoverPassword');
            }
          }, builder: (context, state) {
            if (state is UpdatePassInitial) {
              return Center(child: updatePassForm(context));
            } else if (state is RecoverPassLoading) {
              return buildLoading();
            } else {
              return Center(child: updatePassForm(context));
            }
          })),
    );
  }

  Widget updatePassForm(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.65,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Reestablecer contraseña",
                            style: TextStyle(
                                color: Color.fromARGB(255, 103, 103, 103),
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                        const Text("Nueva contraseña: "),
                        SizedBox(
                          child: textFieldIcon(
                              "Ingresa tu nueva contraseña",
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
                        const SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              if (_passwordController.text !=
                                  _password2Controller.text) {
                                print("Las contraseñas no coinciden");
                              } else {
                                BlocProvider.of<UpdatePassCubit>(context)
                                    .updatePass(
                                        widget.email, _passwordController.text);
                              }
                            },
                            style: ElevatedButton.styleFrom(
                                fixedSize: const Size(170, 35)),
                            child: const Text("Cambiar contraseña")),
                      ]),
                ),
              ),
              Image.asset(
                'assets/images/update_pass_dog.png',
                height: MediaQuery.of(context).size.height * 0.25,
              ),
            ],
          ),
        ),
      ],
    );
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
