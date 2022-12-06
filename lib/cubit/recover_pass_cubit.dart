import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../classes/user.dart';
import '../service/user_service.dart';
import '../util/verification_servide.dart';

part 'recover_pass_state.dart';

class RecoverPassCubit extends Cubit<RecoverPassState> {
  RecoverPassCubit() : super(const RecoverPassInitial());

  ///Envia un correo con el codigo de recuperacion de contraseña
  Future<void> sendRecoverCode(String email) async {
    try {
      //Verificamos si el usuario existe en la bd
      User user = await UserService.getUserByEmail(
          email); //Puede lanzar o no una excepcion

      VerificationService verificationService = VerificationService();
      verificationService.sendOTP(email);
      //Estado de carga
      emit(const RecoverPassLoading());
      await Future.delayed(const Duration(seconds: 1));
      //TODO: Almacenar el codigo en la base de datos
      //Mostramos el form para ingresar el otp
      emit(RecoverPassOTPForm(user));
    } on Exception catch (ex) {
      print(ex.toString());
      emit(const RecoverPassFailure(
          "El correo no se encuentra asociado a ninguna cuenta"));
    }
  }

  Future<void> verifyRecoverPass(String email, String code) async {
    try {
      emit(const RecoverPassLoading());
      await Future.delayed(const Duration(seconds: 1));
      VerificationService emailAuthUtils = VerificationService();
      //TODO: Verificar vigencia con backend
      //Verificamos que el código sea correcto
      bool res = emailAuthUtils.verify(email, code);
      if (res) {
        //Si el código es correcto, guardamos la nueva contraseña
        // ResponseDto response = await RecoverPassService.saveRecoverCode(email, code);
        emit(const RecoverPassSuccess());
      } else {
        emit(const RecoverPassFailure("Código incorrecto"));
      }
    } on Exception catch (ex) {
      print(ex.toString());
      emit(const RecoverPassFailure("Ocurrió un error, intente nuevamente"));
    }
  }
}
