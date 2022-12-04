import 'package:equatable/equatable.dart';

import 'page_status.dart';

class LoginState extends Equatable {
  final PageStatus status; // Estado de la página
  final bool loginSuccess; // Indica si el login fue exitoso
  final String? errorMessage; // Mensaje de error
  final Exception? exception; // Excepción
  final String? token; // Token de autenticación
  final String? refreshToken; // Token de refresco

// Constructor
  const LoginState({
    this.status = PageStatus.initial,
    this.loginSuccess = false,
    this.errorMessage,
    this.exception,
    this.token,
    this.refreshToken,
  });

  // este metodo es para que Equatable pueda comparar los objetos
  LoginState copyWith({
    PageStatus? status, // Estado de la página
    bool? loginSuccess, // Indica si el login fue exitoso
    String? errorMessage, // Mensaje de error
    Exception? exception, // Excepción
    String? token, // Token de autenticación
    String? refreshToken, // Token de refresco
  }) {
    return LoginState(
      status: status ?? this.status,
      loginSuccess: loginSuccess ?? this.loginSuccess,
      errorMessage: errorMessage ?? this.errorMessage,
      exception: exception ?? this.exception,
      token: token ?? this.token,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }

  @override
  // este método es requerido por Equatable
  List<Object?> get props => [
        status,
        loginSuccess,
        errorMessage,
        exception,
        token,
        refreshToken,
      ];
}
