import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/presentation/pages/home/home.dart';
import 'package:app_comercio/feature/products/presentation/pages/homepage/home_page.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchProductsDelegate extends SearchDelegate<Product> {
  final List<Product> product;
  List<Product> _filter = [];
  SearchProductsDelegate(this.product, this.ref);
  WidgetRef ref;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: const Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 100.0,
            height: 100.0,
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
                      height: 100.0,
                      width: 155,
                      //MediaQuery.of(context).size.width * 0.34,
                      child:
                          Image.network(_filter[index].image, fit: BoxFit.fill),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                _filter[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: Text(
                                //'\nEstado: ${dataProduct[index].endingDate ? "DISPONIBLE" : "AGOTADO"} ' +
                                'STOCK: ${_filter[index].quantity}'.toString(),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                            child: Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              "PRECIO: \$" + _filter[index].price.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        IconButton(
                          color: Colors.green,
                          icon: const Icon(Icons.shopping_bag_outlined),
                          onPressed: () async {
                            if (_filter[index].quantity == 0) {
                              final snackBar = SnackBar(
                                duration: const Duration(seconds: 1),
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
                                  .watch(productNotifierProvider.notifier)
                                  .carritoProducts(index, product);
                            }
                          },
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
      itemCount: _filter.length,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _filter = product.where((Product) {
      return Product.name.toLowerCase().contains(query.trim().toLowerCase());
    }).toList();
    return ListView.builder(
      physics: const ClampingScrollPhysics(),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 100.0,
            height: 100.0,
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
                      height: 100.0,
                      width: 155,
                      //MediaQuery.of(context).size.width * 0.34,
                      child:
                          Image.network(_filter[index].image, fit: BoxFit.fill),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                              child: Text(
                                _filter[index].name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                              child: Text(
                                //'\nEstado: ${dataProduct[index].endingDate ? "DISPONIBLE" : "AGOTADO"} ' +
                                'STOCK: ${_filter[index].quantity}'.toString(),
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
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(5, 10, 0, 0),
                            child: Text(
                              // ignore: prefer_interpolation_to_compose_strings
                              "PRECIO: \$" + _filter[index].price.toString(),
                              style: const TextStyle(
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        IconButton(
                          color: Colors.green,
                          icon: const Icon(Icons.shopping_bag_outlined),
                          onPressed: () async {
                            if (_filter[index].quantity == 0) {
                              final snackBar = SnackBar(
                                duration: const Duration(seconds: 1),
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
                                  .watch(productNotifierProvider.notifier)
                                  .carritoProducts(index, product[index]);
                            }
                          },
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
      itemCount: _filter.length,
    );
  }
}
