part of 'profile_cubit.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {
  // final User user;
  const ProfileInitial();
}

class ProfileLoaded extends ProfileState {
  final User user;
  const ProfileLoaded(this.user);
}

class ProfileLoading extends ProfileState {
  const ProfileLoading();
}

class ProfileSuccess extends ProfileState {
  const ProfileSuccess();
}

class ProfileDeleteSuccess extends ProfileState {
  const ProfileDeleteSuccess();
}

class ProfileFailure extends ProfileState {
  final String errorMessage;

  const ProfileFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
