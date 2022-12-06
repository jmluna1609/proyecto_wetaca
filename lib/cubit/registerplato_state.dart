part of 'registerplato_cubit.dart';

abstract class RegisterPlatoState extends Equatable {
  const RegisterPlatoState();

  @override
  List<Object> get props => [];
}

class RegisterInitial extends RegisterPlatoState {
  const RegisterInitial();
}

class RegisterLoading extends RegisterPlatoState {
  const RegisterLoading();
}

class RegisterSuccess extends RegisterPlatoState {
  const RegisterSuccess();
}

class RegisterFailure extends RegisterPlatoState {
  final String errorMessage;
  const RegisterFailure(this.errorMessage);
}
