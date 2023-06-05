import 'package:app_comercio/core/routes/state_routes.dart';

import 'package:app_comercio/feature/products/domain/entities/product.dart';

import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SearchProductsDelegateEditandDelete extends SearchDelegate<Product> {
  final List<Product> product;
  List<Product> _filter = [];
  SearchProductsDelegateEditandDelete(this.product, this.ref);
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
    return IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(Icons.arrow_back));
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
                borderRadius: BorderRadius.circular(4.0),
              ),
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
                  Container(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: IconButton(
                              color: Colors.green,
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                ref
                                    .read(routeProvider.notifier)
                                    .editar_product();
                                ref
                                    .watch(productNotifierProvider.notifier)
                                    .agregarProductoStateEliminarModificar(
                                        _filter[index]);
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
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);

                                          ref
                                              .watch(productNotifierProvider
                                                  .notifier)
                                              .eliminarProductos(
                                                  _filter[index]);

                                          final snackBar = SnackBar(
                                            content: const Text(
                                                // ignore: unnecessary_string_interpolations
                                                'Producto eliminado'),
                                            action: SnackBarAction(
                                              label: 'Undo',
                                              onPressed: () {
                                                // Some code to undo the change.
                                              },
                                            ),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
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
                borderRadius: BorderRadius.circular(4.0),
              ),
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
                  Container(
                    child: Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            child: IconButton(
                              color: Colors.green,
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                ref
                                    .read(routeProvider.notifier)
                                    .editar_product();
                                ref
                                    .watch(productNotifierProvider.notifier)
                                    .agregarProductoStateEliminarModificar(
                                        _filter[index]);
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
                                            Navigator.pop(context, 'Cancel'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);

                                          ref
                                              .watch(productNotifierProvider
                                                  .notifier)
                                              .eliminarProductos(
                                                  _filter[index]);

                                          final snackBar = SnackBar(
                                            content: const Text(
                                                // ignore: unnecessary_string_interpolations
                                                'Producto eliminado'),
                                            action: SnackBarAction(
                                              label: 'Undo',
                                              onPressed: () {
                                                // Some code to undo the change.
                                              },
                                            ),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
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
      itemCount: _filter.length,
    );
  }
}
