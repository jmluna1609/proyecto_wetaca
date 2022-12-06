import 'dart:io';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../classes/user.dart';
import '../cubit/profile_cubit.dart';
import 'widget/textFieldIconEdit.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  //TODO: validaciones de campos

  bool _ciActive = false,
      _firstNameActive = false,
      _lastNameActive = false,
      _usernameActive = false,
      _emailActive = false,
      _fonoActive = false;
  final _ciController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _fonoController = TextEditingController();

  @override
  Widget build(BuildContext ctx1) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text("Perfil de usuario"),
          ),
          body:
              BlocConsumer<ProfileCubit, ProfileState>(listener: (ctx3, state) {
            if (state is ProfileSuccess) {
              // Navigator.pop(ctx3); // quito el dialog8888
              Navigator.pushNamed(ctx3, '/');
              _showDialog(
                  context,
                  "Cuenta actualizada!",
                  "Los datos fueron actualizados correctamente.",
                  true,
                  '/profile');
              // Navigator.pushNamed(ctx3, '/home');

            } else if (state is ProfileFailure) {
              Navigator.pop(ctx3); // quito el dialog
              _showDialog(
                  context, "Error", state.errorMessage, true, '/profile');
            } else if (state is ProfileDeleteSuccess) {
              Navigator.pushNamed(ctx3, '/');
              _showDialog(context, "Cuenta eliminada",
                  "La cuenta fue eliminada correctamente.", true, '/');
            }
          }, builder: (context, state) {
            if (state is ProfileLoading) {
              return buildLoading();
            } else if (state is ProfileLoaded) {
              _ciController.text = state.user.ciuser;
              _firstNameController.text = state.user.firstName;
              _lastNameController.text = state.user.lastName;
              _emailController.text = state.user.email;
              _fonoController.text = state.user.fono;
              _usernameController.text = state.user.username;
              return Center(child: dataForm(context));
            } else {
              return Center(child: dataForm(context));
            }
          })),
    );
  }

  File? _image;

  Widget dataForm(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color(0xff80c6d7),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          icon: const Icon(Icons.logout),
                          color: Color.fromARGB(255, 9, 147, 193),
                          onPressed: () {
                            Navigator.pushNamed(context, '/');
                          }),
                    ],
                  ),
                  Container(
                    height: height * 0.35,
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        double innerHeight = constraints.maxHeight;
                        double innerWidth = constraints.maxWidth;
                        return Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                height: innerHeight * 0.66,
                                width: innerWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Colors.white,
                                ),
                                child: Column(
                                  children: [
                                    const SizedBox(
                                      height: 80,
                                    ),
                                    Text(
                                      _firstNameController.text +
                                          " " +
                                          _lastNameController.text,
                                      style: const TextStyle(
                                        color: Color(0xff40aac4),
                                        fontFamily: 'Nunito',
                                        fontSize: 35,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    Text(
                                      _usernameController.text,
                                      style: const TextStyle(
                                        color:
                                            Color.fromARGB(255, 142, 150, 158),
                                        fontFamily: 'Nunito',
                                        fontSize: 20,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Positioned(
                              top: 110,
                              right: 20,
                              child: Icon(
                                Icons.pets,
                                color: Colors.grey[700],
                                size: 30,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(100),
                                  child: _image == null
                                      ? Image.asset(
                                          'assets/images/pfp.jpg',
                                          width: innerWidth * 0.45,
                                          height: innerHeight * 0.45,
                                          fit: BoxFit.fitWidth,
                                        )
                                      : Image.file(
                                          _image!,
                                          width: innerWidth * 0.45,
                                          height: innerWidth * 0.45,
                                          fit: BoxFit.fitWidth,
                                        ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: height * 0.84,
                    width: width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Text(
                            'Información personal',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color.fromARGB(255, 103, 103, 103),
                                fontSize: 25,
                                fontWeight: FontWeight.bold),
                          ),
                          const Divider(
                            thickness: 2.5,
                          ),
                          const Text("Nombre(s)"),
                          Row(
                            children: [
                              /*
                              Expanded(
                                child: SizedBox(
                                  child: textFieldIconEdit(
                                      "Ingresa tu cedula de identidad",
                                      Icons.pages,
                                      _ciController,
                                      TextInputType.name,
                                      _ciController.text,
                                      _ciActive),
                                  height: 50,
                                ),
                              ),*/
                              Expanded(
                                child: SizedBox(
                                  child: textFieldIconEdit(
                                      "Ingresa tu nombre",
                                      Icons.abc,
                                      _firstNameController,
                                      TextInputType.name,
                                      _firstNameController.text,
                                      _firstNameActive),
                                  height: 50,
                                ),
                              ),
                              //boton para editar
                              IconButton(
                                icon: const Icon(Icons.edit),
                                color: Color(0xff40aac4),
                                onPressed: () {
                                  setState(() {
                                    if (_firstNameActive == false) {
                                      _firstNameActive = true;
                                    } else {
                                      _firstNameActive = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text("Apellido(s)"),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: textFieldIconEdit(
                                      "Ingresa tu apellido",
                                      Icons.abc,
                                      _lastNameController,
                                      TextInputType.name,
                                      _lastNameController.text,
                                      _lastNameActive),
                                  height: 50,
                                ),
                              ),
                              //boton para editar
                              IconButton(
                                icon: const Icon(Icons.edit),
                                color: Color(0xff40aac4),
                                onPressed: () {
                                  setState(() {
                                    if (_lastNameActive == false) {
                                      _lastNameActive = true;
                                    } else {
                                      _lastNameActive = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text("Usuario"),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: textFieldIconEdit(
                                      "Ingresa tu usuario",
                                      Icons.abc,
                                      _usernameController,
                                      TextInputType.name,
                                      _usernameController.text,
                                      _usernameActive),
                                  height: 50,
                                ),
                              ),
                              //boton para editar
                              IconButton(
                                icon: const Icon(Icons.edit),
                                color: Color(0xff40aac4),
                                onPressed: () {
                                  setState(() {
                                    if (_usernameActive == false) {
                                      _usernameActive = true;
                                    } else {
                                      _usernameActive = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Text("Correo electrónico"),
                          Row(children: [
                            Expanded(
                              child: SizedBox(
                                child: textFieldIconEdit(
                                    "Ingresa tu correo",
                                    Icons.email,
                                    _emailController,
                                    TextInputType.emailAddress,
                                    _emailController.text,
                                    _emailActive),
                                height: 50,
                              ),
                            ),
                            //boton para editar
                            IconButton(
                              icon: const Icon(Icons.edit),
                              color: Color(0xff40aac4),
                              onPressed: () {
                                setState(() {
                                  if (_emailActive == false) {
                                    _emailActive = true;
                                  } else {
                                    _emailActive = false;
                                  }
                                });
                              },
                            ),
                          ]),
                          const SizedBox(height: 20),
                          const Text("Dirección"),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  child: textFieldIconEdit(
                                      "Ingresa tu telefono",
                                      Icons.phone,
                                      _fonoController,
                                      TextInputType.text,
                                      _fonoController.text,
                                      _fonoActive),
                                  height: 50,
                                ),
                              ),
                              //boton para editar
                              IconButton(
                                icon: const Icon(Icons.edit),
                                color: Color(0xff40aac4),
                                onPressed: () {
                                  setState(() {
                                    if (_fonoActive == false) {
                                      _fonoActive = true;
                                    } else {
                                      _fonoActive = false;
                                    }
                                  });
                                },
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      BlocProvider.of<ProfileCubit>(context)
                                          .deleteUser();
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(150, 35)),
                                    child: const Text("Eliminar cuenta")),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: ElevatedButton(
                                    onPressed: () {
                                      if (allFieldsAreFilled()) {
                                        if (EmailValidator.validate(
                                            _emailController.text)) {
                                          User user = User(
                                            ciuser: _ciController.text,
                                            firstName:
                                                _firstNameController.text,
                                            lastName: _lastNameController.text,
                                            email: _emailController.text,
                                            fono: _fonoController.text,
                                            username: _usernameController.text,
                                          );
                                          BlocProvider.of<ProfileCubit>(context)
                                              .updateProfile(user);
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              content: Text("Correo inválido"),
                                            ),
                                          );
                                        }
                                      } else {
                                        _showDialog(
                                            context,
                                            "Campos vacíos",
                                            "Por favor, llene todos los campos obligatorios.",
                                            true,
                                            "/profile");
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        fixedSize: const Size(150, 35)),
                                    child: const Text("Guardar cambios")),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
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

  bool allFieldsAreFilled() {
    if (_firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _usernameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
