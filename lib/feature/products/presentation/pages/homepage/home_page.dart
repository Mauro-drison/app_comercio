import 'package:app_comercio/core/routes/routes.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/presentation/pages/carrito_products/carrito_products.dart';
import 'package:app_comercio/feature/products/presentation/pages/homepage/widgets/drawer_home.dart';
import 'package:app_comercio/feature/products/presentation/pages/homepage/widgets/wlistar_productos.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    List<Product> dataProduct = ref.watch(productNotifierProvider).product;
    bool isLoading = ref.watch(productNotifierProvider).isLoading;

    double widthh = MediaQuery.of(context).size.width;
    double heightt = MediaQuery.of(context).size.height;
    List<Product> carritoProducto =
        ref.watch(productNotifierProvider).productCarrito;
    //print(data_product);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Productos'),
          actions: <Widget>[
            _shoppingCartBadge(carritoProducto, ref),
            _notificacionProductosSinStock(carritoProducto, ref),
          ],
        ),
        drawer: const Drawer(
          child: DrawerHome(),
        ),
        body: const ListarProducts());
  }

  Widget _shoppingCartBadge(carritoProducto, ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 28, 5),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 0, end: 3),
        badgeAnimation: badges.BadgeAnimation.slide(
            // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
            // curve: Curves.easeInCubic,
            ),
        showBadge: true,
        badgeStyle: badges.BadgeStyle(
          badgeColor: Colors.black,
        ),
        badgeContent: Text(
          carritoProducto.length.toString(),
          style: TextStyle(color: Colors.white),
        ),
        child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
      ),
    );
  }

  Widget _notificacionProductosSinStock(carritoProducto, ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 28, 5),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 0, end: 3),
        badgeAnimation: badges.BadgeAnimation.slide(
            // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
            // curve: Curves.easeInCubic,
            ),
        showBadge: true,
        badgeStyle: badges.BadgeStyle(
          badgeColor: Colors.black,
        ),
        badgeContent: Text(
          carritoProducto.length.toString(),
          style: TextStyle(color: Colors.white),
        ),
        child: IconButton(
            icon: const Icon(Icons.notification_add), onPressed: () {}),
      ),
    );
  }
}
