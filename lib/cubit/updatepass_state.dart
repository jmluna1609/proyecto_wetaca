part of 'updatepass_cubit.dart';

abstract class UpdatePassState extends Equatable {
  const UpdatePassState();

  @override
  List<Object> get props => [];
}

class UpdatePassInitial extends UpdatePassState {
  const UpdatePassInitial();
}

class UpdatePassLoading extends UpdatePassState {
  const UpdatePassLoading();
}

class UpdatePassSuccess extends UpdatePassState {
  const UpdatePassSuccess();
}

class UpdatePassFailure extends UpdatePassState {
  final String errorMessage;
  const UpdatePassFailure(this.errorMessage);
}
