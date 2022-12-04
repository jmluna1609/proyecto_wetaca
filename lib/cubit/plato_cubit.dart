/*
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:http/http.dart';

part 'plato_state.dart';

class PlatoCubit extends Cubit<PlatoState> {
  PlatoCubit() : super(const PlatoState());

  void reset() {
    emit(const PlatoState());
  }


  Future<void> getSpeciesAndBreeds() async {
    emit(state.copyWith(status: ScreenStatus.loading));
    try {
      final List<SpecieDto> species = await PetService.getSpecies();
      final List<BreedDto> breeds = await PetService.getBreeds();
      emit(state.copyWith(status: ScreenStatus.success, species: species, breeds: breeds));
    } on BarkibuException catch (ex) {
      emit(state.copyWith(status: ScreenStatus.failure, statusCode: ex.statusCode, errorDetail: ex.toString()));
    } on ClientException catch (_) {
      emit(state.copyWith(status: ScreenStatus.failure, statusCode: '', errorDetail: 'Error de conexión'));
    }
  }

  Future<void> registerPlato({
    required String name,
    required String descripcion,
    required String ingredientes, 
    required double precio,
    required String categoria,

  }) async {
    emit(state.copyWith(status: ScreenStatus.loading));
    try {
      String? newPhotoPath = await ImageUploadService.uploadImage(state.newPictureFile);
      String response = await PetService.registerPet(
          state.breedId, name, state.gender, state.castrated, DateUtil.getAmericanDate(bornDate), newPhotoPath, chipNumber);
      emit(state.copyWith(status: ScreenStatus.success, result: response));
    } on BarkibuException catch (ex) {
      emit(state.copyWith(status: ScreenStatus.failure, statusCode: ex.statusCode, errorDetail: ex.toString()));
    } on ClientException catch (_) {
      emit(state.copyWith(status: ScreenStatus.failure, statusCode: '', errorDetail: 'Error de conexión'));
    }
  }

  Future<void> getPet(int petId) async {
    emit(state.copyWith(status: ScreenStatus.loading));

    try {
      final List<SpecieDto> species = await PetService.getSpecies();
      final List<BreedDto> breeds = await PetService.getBreeds();
      final PetDto pet = await PetService.getPet(petId);
      emit(state.copyWith(
        status: ScreenStatus.success,
        species: species,
        breeds: breeds,
        pet: pet,
        petId: petId,
        specieId: pet.specieId,
        breedId: pet.breedId,
        castrated: pet.castrated,
        photoPath: pet.photoPath,
      ));
    } on BarkibuException catch (ex) {
      emit(state.copyWith(status: ScreenStatus.failure, statusCode: ex.statusCode, errorDetail: ex.toString()));
    } on ClientException catch (_) {
      emit(state.copyWith(status: ScreenStatus.failure, statusCode: '', errorDetail: 'Error de conexión'));
    }
  }

  Future<void> updatePet({required int petId, required String name, required String bornDate, String? chipNumber}) async {
    emit(state.copyWith(status: ScreenStatus.loading));
    try {
      String? newPhotoPath = await ImageUploadService.uploadImage(state.newPictureFile);
      String response = await PetService.updatePet(
          petId, state.breedId, name, state.gender, state.castrated, DateUtil.getAmericanDate(bornDate), newPhotoPath, chipNumber);
      emit(state.copyWith(status: ScreenStatus.success, result: response));
    } on BarkibuException catch (ex) {
      emit(state.copyWith(status: ScreenStatus.failure, statusCode: ex.statusCode, errorDetail: ex.toString()));
    } on ClientException catch (_) {
      emit(state.copyWith(status: ScreenStatus.failure, statusCode: '', errorDetail: 'Error de conexión'));
    }
  }

  void changeBornDate(String bornDate) {
    emit(state.copyWith(status: ScreenStatus.initial, bornDate: bornDate));
  }

  void changeSpecieValue(value) {
    emit(state.copyWith(status: ScreenStatus.initial, specieId: value, breedId: 0));
  }

  void changeBreedValue(value) {
    emit(state.copyWith(status: ScreenStatus.initial, breedId: value));
  }

  void changeGender(value) {
    String? gender = value == 0 ? 'macho' : 'hembra';
    emit(state.copyWith(status: ScreenStatus.initial, gender: gender));
  }

  void changeCastrated(value) {
    bool castrated = value == 0 ? false : true;
    emit(state.copyWith(status: ScreenStatus.initial, castrated: castrated));
  }

  void changeImage(String path) {
    emit(state.copyWith(status: ScreenStatus.initial, photoPath: path, newPictureFile: File.fromUri(Uri(path: path))));
  }
}
*/