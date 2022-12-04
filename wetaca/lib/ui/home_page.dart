import 'package:wetaca/cubit/home_page_cubit.dart';
import 'package:wetaca/cubit/home_page_state.dart';
import 'package:wetaca/cubit/page_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaginaPrincipal extends StatefulWidget {
  const PaginaPrincipal({Key? key}) : super(key: key);

  @override
  State<PaginaPrincipal> createState() => _PaginaPrincipalState();
}

class _PaginaPrincipalState extends State<PaginaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => HomePageCubit()..init(),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("Menu principal"),
          ),
          body: BlocBuilder<HomePageCubit, HomePageState>(
            builder: (context, state) {
              if (state.status == PageStatus.loading) {
                return Text("Cargando su información ....");
              } else if (state.status == PageStatus.failure) {
                return Text("Ha ocurrido un error: ${state.errorMessage}");
              } else {
                return Center(
                  child: // Build menu with icons
                      Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          "Bienvenido ${state.userInfoDto!.firstName} ${state.userInfoDto!.lastName}"),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/newOrder');
                          },
                          child: const Text("Nuevo Pedido")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/pastOrders');
                          },
                          child: const Text("Pedidos anteriores")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/invoices');
                          },
                          child: const Text("Mis facturas")),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Salir")),
                    ],
                  ),
                );
              }
            },
          ),
        ));
  }
}
