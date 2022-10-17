import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'clientes_state.dart';

class ClientesCubit extends Cubit<ClientesState> {
  ClientesCubit() : super(ClientesInitial());
}
