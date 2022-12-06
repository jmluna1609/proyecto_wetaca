import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../classes/plato.dart';
import '../classes/user.dart';
import '../dto/response_dto.dart';
import '../service/plato_service.dart';
import '../service/user_service.dart';

part 'registerplato_state.dart';

class RegisterPlatoCubit extends Cubit<RegisterPlatoState> {
  RegisterPlatoCubit() : super(const RegisterInitial());

  Future<void> register(Plato plato) async {
    try {
      emit(const RegisterLoading());
      await Future.delayed(const Duration(seconds: 1));

      ResponseDto response = await PlatoService.register(plato);
      if (response.success) {
        emit(const RegisterSuccess());
      } else {
        var responseMessage = "Error al intentar registrar el plato";
        if (response.message != null) {
          responseMessage = response.message.toString();
        }
        emit(RegisterFailure(responseMessage));
      }
    } on Exception catch (ex) {
      print(ex.toString());
      emit(const RegisterFailure("Error al intentar registrar al plato"));
    }
  }
}
