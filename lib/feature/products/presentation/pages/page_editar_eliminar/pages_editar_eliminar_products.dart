import 'package:app_comercio/core/routes/routes.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:app_comercio/core/routes/state_routes.dart';

import 'package:badges/badges.dart' as badges;

class Pages_editar_eliminar_products extends ConsumerWidget {
  const Pages_editar_eliminar_products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    List<Product> dataProduct = ref.watch(productNotifierProvider).product;
    bool isLoading = ref.watch(productNotifierProvider).isLoading;

    double widthh = MediaQuery.of(context).size.width;
    double heightt = MediaQuery.of(context).size.height;
    List<Product> carritoProducto =
        ref.watch(productNotifierProvider).productCarrito;
    List<Product> productosSinStockk =
        ref.watch(productNotifierProvider).productSinStock;
    //print(data_product);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 183, 204, 235),
        appBar: AppBar(
          title: const Text('Lista de Productos'),
          leading: IconButton(
            tooltip: 'Previous choice',
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              ref.read(routeProvider.notifier).homepage();
            },
          ),
        ),
        // ignore: prefer_const_constructors
        body: ListarProducts());
  }
}

class ListarProducts extends ConsumerWidget {
  const ListarProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Product> dataProduct = ref.watch(productNotifierProvider).product;
    bool isLoading = ref.watch(productNotifierProvider).isLoading;
    double widthh = MediaQuery.of(context).size.width;
    double heightt = MediaQuery.of(context).size.height;
    //print(data_product);
    return Column(
      children: [
        isLoading
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: ListView.builder(
                  physics: const ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Container(
                        width: widthh * 0.36,
                        height: heightt * 0.16,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          elevation: 10,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  width: 160,
                                  //MediaQuery.of(context).size.width * 0.34,
                                  child: Image.network(dataProduct[index].image,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            10, 10, 0, 0),
                                        child: Text(
                                          dataProduct[index].name,
                                          style: const TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Padding(
                                          padding: const EdgeInsets.fromLTRB(
                                              5, 10, 0, 0),
                                          child: Text(
                                            //'\nEstado: ${dataProduct[index].endingDate ? "DISPONIBLE" : "AGOTADO"} ' +
                                            'STOCK: ${dataProduct[index].quantity}'
                                                .toString(),
                                            style: const TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Expanded(
                                  child: Row(
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            5, 10, 0, 0),
                                        child: Text(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          "PRECIO: \$" +
                                              dataProduct[index]
                                                  .price
                                                  .toString(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          color: Colors.green,
                                          icon: const Icon(Icons.edit),
                                          onPressed: () {
                                            ref
                                                .read(routeProvider.notifier)
                                                .editar_product();
                                            ref
                                                .watch(productNotifierProvider
                                                    .notifier)
                                                .agregarProductoStateEliminarModificar(
                                                    dataProduct[index]);
                                          },
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 5.0,
                                      ),
                                      Expanded(
                                        child: IconButton(
                                          color: Colors.green,
                                          icon: const Icon(Icons.delete),
                                          onPressed: () async {
                                            showDialog<String>(
                                              context: context,
                                              builder: (BuildContext context) =>
                                                  AlertDialog(
                                                title: const Text(
                                                    'Desea eliminar el producto'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () =>
                                                        Navigator.pop(
                                                            context, 'Cancel'),
                                                    child: const Text('Cancel'),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.pop(context);

                                                      final snackBar = SnackBar(
                                                        content: Text(
                                                            // ignore: unnecessary_string_interpolations
                                                            'Producto eliminado'),
                                                        action: SnackBarAction(
                                                          label: 'Undo',
                                                          onPressed: () {
                                                            // Some code to undo the change.
                                                          },
                                                        ),
                                                      );

                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                              snackBar);
                                                    },
                                                    child: const Text('OK'),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: dataProduct.length,
                ),
              ),
        // error: (e, s) => const Center(
        //   child: Text('Ups, sucedio un error!'),
        // ),
        // loading: () => const Center(
        //   child: CircularProgressIndicator(),
        // ),
      ],
    );
  }
}
