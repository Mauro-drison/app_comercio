import 'package:app_comercio/core/routes/routes.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/presentation/pages/homepage/widgets/drawer_home.dart';
import 'package:app_comercio/feature/products/presentation/pages/homepage/widgets/wlistar_productos.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
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
    //print(data_product);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Productos'),
        ),
        drawer: const Drawer(
          child: DrawerHome(),
        ),
        body: const ListarProducts());
  }
}
