import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../classes/user.dart';
import '../cubit/recover_pass_cubit.dart';
import 'updatepass_page.dart';
import 'widget/textFieldIcon.dart';

class RecoverPassPage extends StatefulWidget {
  const RecoverPassPage({Key? key}) : super(key: key);

  @override
  State<RecoverPassPage> createState() => _RecoverPassPageState();
}

class _RecoverPassPageState extends State<RecoverPassPage> {
  final _emailController = TextEditingController();
  late User user;
  List<TextEditingController> textEditingController = [];
  // ignore: non_constant_identifier_names
  var OTPCode = "";
  @override
  void initState() {
    super.initState();
    // verificationOTP.verifyPhoneNumber();
    final verificationOTP1 = TextEditingController();
    final verificationOTP2 = TextEditingController();
    final verificationOTP3 = TextEditingController();
    final verificationOTP4 = TextEditingController();
    final verificationOTP5 = TextEditingController();
    final verificationOTP6 = TextEditingController();
    textEditingController = [
      verificationOTP1,
      verificationOTP2,
      verificationOTP3,
      verificationOTP4,
      verificationOTP5,
      verificationOTP6
    ];
  }

  @override
  Widget build(BuildContext ctx1) {
    return BlocProvider(
      create: (context) => RecoverPassCubit(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text(""),
          ),
          body: BlocConsumer<RecoverPassCubit, RecoverPassState>(
              listener: (ctx3, state) {
            if (state is RecoverPassSuccess) {
              Navigator.pop(ctx3); // quito el dialog8888
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      UpdatePassPage(email: _emailController.text),
                ),
              );
            } else if (state is RecoverPassFailure) {
              Navigator.pop(ctx3); // quito el dialog
              _showDialog(context, "Error", state.errorMessage, true);
            } else if (state is RecoverPassOTPForm) {
              //Establecemos el usuario
              user = state.user;
              print(user);
            }
          }, builder: (context, state) {
            if (state is RecoverPassInitial) {
              return Center(child: recoverForm(context));
            } else if (state is RecoverPassLoading) {
              return buildLoading();
            } else if (state is RecoverPassOTPForm) {
              return Center(child: recoverOTPForm(context));
            } else {
              return Center(child: recoverForm(context));
            }
          })),
    );
  }

  Widget recoverForm(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.40,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: const Text("Recuperar contraseña",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 103, 103, 103),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 30),
                        const Text(
                            " Para reestablecer tu contraseña se enviará un código de verificación a tu correo electrónico:",
                            style: TextStyle(
                                color: Color.fromARGB(255, 103, 103, 103),
                                fontSize: 15,
                                fontWeight: FontWeight.normal)),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          child: TextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                hintText: "Ingrese su correo electronico"),
                          ),
                          height: 50,
                        ),
                        const SizedBox(height: 20),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                  onPressed: () {
                                    BlocProvider.of<RecoverPassCubit>(context)
                                        .sendRecoverCode(_emailController.text);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    fixedSize: const Size(150, 35),
                                  ),
                                  child: const Text("Enviar código")),
                              ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    Navigator.pushNamed(context, "/");
                                  },
                                  child: const Text("Cancelar"))
                            ],
                          ),
                        )
                      ]),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget recoverOTPForm(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.65,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Código de verificación",
                        style: TextStyle(
                            color: Color.fromARGB(255, 103, 103, 103),
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10),
                    Text(
                        "Ingrese el código de verificación que se envió a  ${_emailController.value.text}",
                        style: TextStyle(
                            color: Color.fromARGB(255, 103, 103, 103),
                            fontSize: 15,
                            fontWeight: FontWeight.normal)),
                    Center(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // SizedBox(
                            //   child: textFieldIcon("X X X X X", Icons.person,
                            //       _emailController, TextInputType.emailAddress),
                            //   height: 50,
                            //   width: 200,
                            // ),
                            SizedBox(
                              height: 20,
                            ),
                            otpForm(),
                            const SizedBox(height: 20),
                            Text.rich(TextSpan(
                              text: '¿No recibió ningún código? ',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 93, 93, 93)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Reenviar',
                                    style: const TextStyle(
                                        color: Color(0xff2ba0bd),
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        _showDialog(
                                            context,
                                            "Reenviado!",
                                            "El correo fue reenviado, por favor revisa tu bandeja de entrada.",
                                            true);
                                        BlocProvider.of<RecoverPassCubit>(
                                                context)
                                            .sendRecoverCode(
                                                _emailController.text);
                                      }),
                              ],
                            )),
                            const Text("o"),
                            Text.rich(TextSpan(
                                text:
                                    'Modificar dirección de correo electrónico',
                                style: const TextStyle(
                                    color: Color(0xff2ba0bd),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.pushNamed(
                                        context, '/recoverPassword');
                                  })),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Image.asset(
                    'assets/images/verification_dog.png',
                    height: MediaQuery.of(context).size.height * 0.22,
                  ),
                ),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.pets,
                      size: 15,
                    ),
                    label: const Text("Verificar "),
                    onPressed: () {
                      // User user = null;
                      // BlocProvider.of<RegisterCubit>(context).register(user);
                      // getOTPCode();
                      // Navigator.pushNamed(context, '/verificationCode');
                      // print(verificationOTP.verify(
                      //     "naomi.tacachira@gmail.com", getOTPCode()));
                      BlocProvider.of<RecoverPassCubit>(context)
                          .verifyRecoverPass(
                              _emailController.text, getOTPCode());
                    },
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(150, 35),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                )
              ],
            )
          ]),
        )
      ],
    );
  }

  Widget buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget otpForm() {
    return Form(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < 6; i++)
            SizedBox(
                height: 68,
                width: 45,
                child: TextField(
                  controller: textEditingController[i],
                  onChanged: (value) {
                    if (value.length == 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  inputFormatters: [
                    LengthLimitingTextInputFormatter(1),
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 20),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Color(0xff2ba0bd)),
                    ),
                  ),
                )),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, String title, String message,
      bool closeable) async {
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
                      Navigator.pop(context);
                    },
                  )
                : Container(),
          ],
        );
      },
    );
  }

  String getOTPCode() {
    String code = "";
    for (var i = 0; i < textEditingController.length; i++) {
      code += textEditingController[i].text;
    }
    print(code);
    return code;
  }
}
