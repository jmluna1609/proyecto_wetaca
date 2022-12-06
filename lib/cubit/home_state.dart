part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeLoading extends HomeState {
  const HomeLoading();
}

class HomeLoaded extends HomeState {
  const HomeLoaded();
}

class HomeFailure extends HomeState {
  final String errorMessage;

  const HomeFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
