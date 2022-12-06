import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../dto/response_dto.dart';
import '../service/user_service.dart';

part 'updatepass_state.dart';

class UpdatePassCubit extends Cubit<UpdatePassState> {
  UpdatePassCubit() : super(const UpdatePassInitial());

  ///Método para actualizar la contraseña
  Future<void> updatePass(String email, String secret) async {
    try {
      emit(UpdatePassLoading());
      await Future.delayed(const Duration(seconds: 1));
      ResponseDto response = await UserService.updatePass(email, secret);
      if (response.success) {
        emit(UpdatePassSuccess());
      } else {
        var responseMessage = "Error al intentar actualizar la contraseña";
        if (response.message != null) {
          responseMessage = response.message.toString();
        }
        emit(UpdatePassFailure(responseMessage));
      }
    } catch (ex) {
      emit(UpdatePassFailure(ex.toString()));
    }
  }
}
