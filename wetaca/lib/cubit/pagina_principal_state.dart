import 'package:wetaca/cubit/page_status.dart';
import 'package:wetaca/dto/user_info_dto.dart';
import 'package:equatable/equatable.dart';

class HomePageState extends Equatable {
  // Necesitamos informar al Widget en que estado estamos
  final PageStatus status;
  // Necesitamos enviar los datos que recibimos del service
  final UserInfoDto? userInfoDto;
  // Error Message en caso de error.
  final String? errorMessage;

  const HomePageState(
      //constructor
      {this.status = PageStatus.initial,
      this.userInfoDto,
      this.errorMessage});

  @override
  List<Object?> get props => [status, userInfoDto, errorMessage];

  HomePageState copyWith(
      //metodo para copiar el estado actual
      {PageStatus? status,
      UserInfoDto? userInfoDto,
      String? errorMessage}) {
    return HomePageState(
        status: status ?? this.status,
        userInfoDto: userInfoDto ?? this.userInfoDto,
        errorMessage: errorMessage ?? this.errorMessage);
  }
}
