import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Route {
  final String nameR;

  const Route({required this.nameR});
}

class RoutesState extends StateNotifier<Route?> {
  RoutesState() : super(null);

  Future<void> homepage() async {
    // Esto se burla de algún tipo de solicitud/respuesta
    state = const Route(nameR: "route1");
  }

  Future<void> addProducts() async {
    // En este ejemplo, usuario == nulo si estamos desconectados
    state = const Route(
        nameR:
            "route2"); // Aquí no se burla de ninguna solicitud, pero supongo que podríamos
  }

  Future<void> prouctsCarrito() async {
    // En este ejemplo, usuario == nulo si estamos desconectados
    state = const Route(
        nameR:
            "route3"); // Aquí no se burla de ninguna solicitud, pero supongo que podríamos
  }
}

final routeProvider = StateNotifierProvider<RoutesState, Route?>((ref) {
  return RoutesState();
});
