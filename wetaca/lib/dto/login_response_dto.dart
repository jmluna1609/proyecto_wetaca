//aqui vamos a registrar el acceso del usuario
class LoginResponseDto {
  final String token;
  final String refreshToken;
  final String message;
  final String error;

//esto es para que el usuario pueda acceder a la aplicacion
//si el usuario no esta registrado no podra acceder
//si el usuario esta registrado podra acceder
//si el usuario esta registrado pero no tiene permisos no podra acceder
// si el usuario esta registrado y tiene permisos podra acceder
  LoginResponseDto({
    required this.token,
    required this.refreshToken,
    required this.message,
    required this.error,
  });

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) {
    return LoginResponseDto(
      token: json['token'],
      refreshToken: json['refreshToken'],
      message: json['message'],
      error: json['error'],
    );
  }
}
