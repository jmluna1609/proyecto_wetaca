import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../classes/user.dart';
import '../dto/response_dto.dart';
import '../service/user_service.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  // User user;
  ProfileCubit() : super(const ProfileInitial()) {
    getUserByToken();
  }

  Future<void> updateProfile(User user) async {
    try {
      emit(const ProfileLoading());
      ResponseDto response = await UserService.updateUser(user);
      if (response.success) {
        emit(const ProfileSuccess());
      } else {
        var responseMessage = "Error al intentar actualizar el perfil";
        if (response.message != null) {
          responseMessage = response.message.toString();
        }
        emit(ProfileFailure(responseMessage));
      }
    } on Exception catch (ex) {
      print(ex.toString());
      emit(const ProfileFailure("Error al intentar actualizar el perfil"));
    }
  }

  Future<void> deleteUser() async {
    try {
      emit(const ProfileLoading());
      await Future.delayed(const Duration(seconds: 1));
      ResponseDto response = await UserService.deleteUser();
      if (response.success) {
        emit(const ProfileDeleteSuccess());
      } else {
        var responseMessage = "Error al intentar eliminar el perfil";
        if (response.message != null) {
          responseMessage = response.message.toString();
        }
        emit(ProfileFailure(responseMessage));
      }
    } on Exception catch (ex) {
      print(ex.toString());
      emit(const ProfileFailure("Error al intentar eliminar el perfil"));
    }
  }

  Future<User> getFutureUserByToken() async {
    User user = await UserService.getUserByToken();
    return user;
  }

  void getUserByToken() {
    try {
      emit(const ProfileLoading());
      getFutureUserByToken().then((user) {
        emit(ProfileLoaded(user));
      });
    } on Exception catch (ex) {
      print(ex.toString());
      emit(const ProfileFailure("Error al intentar obtener el usuario"));
    }
  }
}
