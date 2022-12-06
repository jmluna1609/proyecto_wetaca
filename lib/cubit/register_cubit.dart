import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../classes/user.dart';
import '../dto/response_dto.dart';
import '../service/user_service.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(const RegisterInitial());

  Future<void> register(User user) async {
    try {
      emit(const RegisterLoading());
      await Future.delayed(const Duration(seconds: 1));

      ResponseDto response = await UserService.register(user);
      if (response.success) {
        emit(const RegisterSuccess());
      } else {
        var responseMessage = "Error al intentar registrar al usuario";
        if (response.message != null) {
          responseMessage = response.message.toString();
        }
        emit(RegisterFailure(responseMessage));
      }
    } on Exception catch (ex) {
      print(ex.toString());
      emit(const RegisterFailure("Error al intentar registrar al usuario"));
    }
  }
}
