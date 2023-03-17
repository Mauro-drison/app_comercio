import 'package:app_comercio/core/routes/state_routes.dart';
import 'package:app_comercio/feature/products/presentation/pages/add_products/add_products.dart';
import 'package:app_comercio/feature/products/presentation/pages/carrito_products/carrito_products.dart';
import 'package:app_comercio/feature/products/presentation/pages/eliminar_products/editar_product.dart';
import 'package:app_comercio/feature/products/presentation/pages/eliminar_products/pages_editar_eliminar_products.dart';

import 'package:app_comercio/feature/products/presentation/pages/homepage/home_page.dart';
import 'package:app_comercio/feature/products/presentation/pages/productosSinStock/productos_sin_stock.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AppRoutes {
  // ignore: constant_identifier_names
  //static const HOME = '/';
  // ignore: constant_identifier_names
  static const HOMEPAGE = '/';
  // ignore: constant_identifier_names
  static const AGREGARPRODUCTO = '/add_products';
  // ignore: constant_identifier_names
  static const MODIFICARPRODUCTOS = '/modificar_productos';
  // ignore: constant_identifier_names
  static const ELIMINARPRODUCTOS = '/eliminar_productos';
}

/// Cachés y Expone un [GoRouter]
final routerProvider = Provider<GoRouter>((ref) {
  final router = RouterNotifier(ref);

  return GoRouter(
    debugLogDiagnostics: true, // Para fines de demostración
    refreshListenable:
        router, // Esto notifica a `GoRouter` para eventos de actualización
    redirect: router._redirectLogic, // All the logic is centralized
    routes: router._routes, // All the routes can be found there
  );
});

class RouterNotifier extends ChangeNotifier {
  final Ref _ref;

  RouterNotifier(this._ref) {
    _ref.listen<Route?>(
      routeProvider, // En nuestro caso, estamos interesados ​​en los eventos de inicio/cierre de sesión.
      (_, __) =>
          notifyListeners(), // Obviamente, se puede agregar más lógica aquí.
    );
  }

  String? _redirectLogic(GoRouterState state) {
    final user = _ref.read(routeProvider);
    print("estado ${user?.nameR}");
    // Desde aquí podemos usar el estado e implementar nuestra lógica personalizada.
    final areWeLoggingIn = state.location == '/';

    // ignore: unnecessary_null_comparison, unrelated_type_equality_checks
    if (user == null || user.nameR == "route1") {
      return areWeLoggingIn ? null : '/';
      //return '/';
    }

    if (user.nameR == "route2") {
      if (areWeLoggingIn) return '/add_products';
      print("-------------ADD-----------------");
    }

    if (user.nameR == "route3") {
      if (areWeLoggingIn) return '/carrito_products';
      print("-------------carr-----------------");
    }
    if (user.nameR == "route4") {
      if (areWeLoggingIn) return '/productos_sin_stock';
      print("-------------carr-----------------");
    }
    if (user.nameR == "route5") {
      if (areWeLoggingIn) return '/pages_editar_eliminar_products';
      print("-------------carr-----------------");
    }
    if (user.nameR == "route6") {
      if (areWeLoggingIn)
        return '/pages_editar_eliminar_products/editar_product';
      print("-------------carr-----------------");
    }
    // There's no need for a redirect at this point.
    return null;
  }

  List<GoRoute> get _routes => [
        GoRoute(
          name: "home_page",
          path: '/',
          builder: (context, _) => const HomePage(),
        ),
        GoRoute(
          name: "add_products",
          path: '/add_products',
          builder: (context, _) => AgregarProductos(),
        ),
        GoRoute(
          name: "carrito_products",
          path: '/carrito_products',
          builder: (context, _) => const CarritoProducts(),
        ),
        GoRoute(
          name: "productos_sin_stock",
          path: '/productos_sin_stock',
          builder: (context, _) => const ProductosSinStock(),
        ),
        GoRoute(
          name: "pages_editar_eliminar_products",
          path: '/pages_editar_eliminar_products',
          builder: (context, _) => const Pages_editar_eliminar_products(),
        ),
        GoRoute(
          name: "editar_product",
          path: '/pages_editar_eliminar_products/editar_product',
          builder: (context, _) => const EditarProduct(),
        ),
      ];
}
