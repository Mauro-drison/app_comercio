// ignore_for_file: sized_box_for_whitespace

import 'package:app_comercio/core/routes/routes.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          //color: Color.fromARGB(255, 54, 54, 54),
                          elevation: 10,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.14,
                                  width: 155,
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
                              Expanded(
                                child: Column(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          5, 10, 0, 0),
                                      child: Text(
                                        // ignore: prefer_interpolation_to_compose_strings
                                        "PRECIO: \$" +
                                            dataProduct[index].price.toString(),
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
                                        icon: const Icon(
                                            Icons.shopping_bag_outlined),
                                        onPressed: () async {
                                          if (dataProduct[index].quantity ==
                                              0) {
                                            final snackBar = SnackBar(
                                              duration:
                                                  const Duration(seconds: 1),
                                              content: const Text(
                                                  // ignore: unnecessary_string_interpolations
                                                  'Producto no disponible'),
                                              action: SnackBarAction(
                                                label: 'ok',
                                                onPressed: () {
                                                  // Some code to undo the change.
                                                },
                                              ),
                                            );

                                            // Find the ScaffoldMessenger in the widget tree
                                            // and use it to show a SnackBar.
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          } else {
                                            ref
                                                .watch(productNotifierProvider
                                                    .notifier)
                                                .carritoProducts(
                                                    index, dataProduct);
                                          }
                                        },
                                      ),
                                    ),
                                  ],
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
