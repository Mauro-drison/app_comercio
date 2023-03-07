import 'package:app_comercio/core/routes/routes.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:go_router/go_router.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> dataProduct = ref.watch(productNotifierProvider).product;
    bool isLoading = ref.watch(productNotifierProvider).isLoading;
    double widthh = MediaQuery.of(context).size.width;
    double heightt = MediaQuery.of(context).size.height;
    //print(data_product);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Productos'),
        ),
        body: Column(
          children: [
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                        itemCount: dataProduct.length,
                        itemBuilder: (context, index) => ListTile(
                              title: Text(dataProduct[index].name),
                              trailing: IconButton(
                                tooltip: "editar",
                                color: Colors.green,
                                icon: const Icon(Icons.edit),
                                onPressed: () async {
                                  context.push(AppRoutes.MODIFICARPRODUCTOS,
                                      extra: dataProduct[index]);
                                  print(dataProduct[index]);
                                },
                              ),
                            )),
                  ),
            // error: (e, s) => const Center(
            //   child: Text('Ups, sucedio un error!'),
            // ),
            // loading: () => const Center(
            //   child: CircularProgressIndicator(),
            // ),
          ],
        ));
  }
}
