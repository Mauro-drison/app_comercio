import 'package:app_comercio/core/routes/state_routes.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';

import 'package:app_comercio/feature/products/presentation/pages/homepage/widgets/drawer_home.dart';
import 'package:app_comercio/feature/products/presentation/pages/homepage/widgets/search_product_delegate.dart';
import 'package:app_comercio/feature/products/presentation/pages/homepage/widgets/wlistar_productos.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    List<Product> dataProduct = ref.watch(productNotifierProvider).product;

    List<Product> carritoProducto =
        ref.watch(productNotifierProvider).productCarrito;
    List<Product> productosSinStockk =
        ref.watch(productNotifierProvider).productSinStock;
    //print(data_product);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 183, 204, 235),
        appBar: AppBar(
          //automaticallyImplyLeading: false,
          title: ListTile(
              title: Text(
                'Buscar',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                showSearch(
                    context: context,
                    delegate: SearchProductsDelegate(dataProduct, ref));
              }),
          actions: <Widget>[
            _shoppingCartBadge(carritoProducto, ref),
            _notificacionProductosSinStock(productosSinStockk, ref),
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
        badgeAnimation: const badges.BadgeAnimation.slide(
            // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
            // curve: Curves.easeInCubic,
            ),
        showBadge: true,
        badgeStyle: const badges.BadgeStyle(
          badgeColor: Colors.black,
        ),
        badgeContent: Text(
          carritoProducto.length.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        child: IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              ref.read(routeProvider.notifier).prouctsCarrito();
            }),
      ),
    );
  }

  Widget _notificacionProductosSinStock(carritoProducto, ref) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 28, 5),
      child: badges.Badge(
        position: badges.BadgePosition.topEnd(top: 0, end: 3),
        badgeAnimation: const badges.BadgeAnimation.slide(
            // disappearanceFadeAnimationDuration: Duration(milliseconds: 200),
            // curve: Curves.easeInCubic,
            ),
        showBadge: true,
        badgeStyle: const badges.BadgeStyle(
          badgeColor: Colors.black,
        ),
        badgeContent: Text(
          carritoProducto.length.toString(),
          style: const TextStyle(color: Colors.white),
        ),
        child: IconButton(
            icon: const Icon(Icons.notification_add),
            onPressed: () {
              ref.read(routeProvider.notifier).productosSinStock();
            }),
      ),
    );
  }
}
