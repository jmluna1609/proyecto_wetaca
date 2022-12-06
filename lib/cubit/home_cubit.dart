import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeInitial()) {
    getHome();
  }

  Future<void> getHome() async {
    try {
      emit(const HomeLoading());
      await Future.delayed(const Duration(seconds: 1));
      emit(const HomeLoaded());
    } on Exception catch (ex) {
      print(ex.toString());
      emit(const HomeFailure("Error al intentar cargar la pantalla de inicio"));
    }
  }
}
