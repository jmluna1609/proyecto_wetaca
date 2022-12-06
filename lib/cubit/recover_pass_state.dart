part of 'recover_pass_cubit.dart';

abstract class RecoverPassState extends Equatable {
  const RecoverPassState();

  @override
  List<Object> get props => [];
}

class RecoverPassInitial extends RecoverPassState {
  const RecoverPassInitial();
}

class RecoverPassLoading extends RecoverPassState {
  const RecoverPassLoading();
}

class RecoverPassSuccess extends RecoverPassState {
  const RecoverPassSuccess();
}

class RecoverPassFailure extends RecoverPassState {
  final String errorMessage;
  const RecoverPassFailure(this.errorMessage);
}

class RecoverPassOTPForm extends RecoverPassState {
  User user;
  RecoverPassOTPForm(this.user);
}
