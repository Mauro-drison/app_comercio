import 'package:app_comercio/feature/products/presentation/pages/add_products/add_products.dart';
import 'package:app_comercio/feature/products/presentation/pages/home/home.dart';
import 'package:app_comercio/feature/products/presentation/pages/homepage/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';

final GoRouter router = GoRouter(
  //initialLocation: "/homepage",
  routes: <GoRoute>[
    //GoRoute(
    //  name: AppRoutes.HOME,
    //  path: '/',
    //  builder: (BuildContext context, GoRouterState state) => const Home(),
    //),
    GoRoute(
      name: AppRoutes.HOMEPAGE,
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const HomePage(),
    ),
    GoRoute(
      name: AppRoutes.AGREGARPRODUCTO,
      path: '/agregar_productos',
      builder: (BuildContext context, GoRouterState state) =>
          AgregarProductos(),
    ),
    // GoRoute(
    //   name: AppRoutes.MODIFICARPRODUCTOS,
    //   path: '/modificar_productos',
    //   builder: (BuildContext context, GoRouterState state) {
    //     Object? product = state.extra;
    //     if (product != null && product is ProductModel) {
    //       return ModificarProductos(product);
    //     } else {
    //       return ModificarProductos(
    //           ProductModel(id: 0, name: 'no name', price: 0.1, quantity: 1));
    //     }
    //   },
    // ),
    // GoRoute(
    //   name: AppRoutes.ELIMINARPRODUCTOS,
    //   path: '/eliminar_productos',
    //   builder: (BuildContext context, GoRouterState state) =>
    //       PageEliminarProductos(),
    // ),
  ],
);
