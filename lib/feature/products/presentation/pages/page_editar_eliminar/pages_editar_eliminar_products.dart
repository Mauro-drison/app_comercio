import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/presentation/pages/page_editar_eliminar/search_products_delegate_editanddelete.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:app_comercio/core/routes/state_routes.dart';

class PagesEditarEliminarProducts extends ConsumerWidget {
  const PagesEditarEliminarProducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    List<Product> dataProduct = ref.watch(productNotifierProvider).product;
    //print(data_product);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 183, 204, 235),
        appBar: AppBar(
          title: ListTile(
              title: Text(
                'Buscar',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              onTap: () {
                showSearch(
                    context: context,
                    delegate:
                        SearchProductsDelegateEditandDelete(dataProduct, ref));
              }),
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
                        width: 100.0,
                        height: 120.0,
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
                                  height: 118.0,
                                  width: 152,
                                  //MediaQuery.of(context).size.width * 0.34,
                                  child: Image.network(dataProduct[index].image,
                                      fit: BoxFit.fill),
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Expanded(
                                      child: SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
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

                                                      ref
                                                          .watch(
                                                              productNotifierProvider
                                                                  .notifier)
                                                          .eliminarProductos(
                                                              dataProduct[
                                                                  index]);

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
