import 'package:app_comercio/core/routes/state_routes.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/presentation/product_satate.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CarritoProducts extends ConsumerWidget {
  const CarritoProducts({Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  final String TAG = "log";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ignore: unused_local_variable
    List<Product> products = ref.watch(productNotifierProvider).product;
    // ignore: unused_local_variable
    List<Product> carritoProducts =
        ref.watch(productNotifierProvider).productCarrito;
    List<Product> productosSinStock =
        ref.watch(productNotifierProvider).productSinStock;
    // ignore: unused_local_variable
    var medida = MediaQuery.of(context);
    var sumaProductos = ref.watch(productNotifierProvider).totalCompra;
    bool estadoQuantity = ref.watch(productNotifierProvider).estadoQuantity;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carrito de compraS",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(routeProvider.notifier).homepage();
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: listaProductos(carritoProducts, ref)),
          Padding(
            padding: const EdgeInsets.all(1.0),
            child: FloatingActionButton(
              onPressed: () {
                showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: const Text('Desea confirmar la compra'),
                    content: Text('precio total: \$ $sumaProductos'),
                    actions: <Widget>[
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text('Cancel'),
                      ),
                      TextButton(
                        onPressed: () async {
                          Navigator.pop(context);
                          ref
                              .watch(productNotifierProvider.notifier)
                              .comprarProdutsDelCarrito(
                                  carritoProducts, products);
                          final snackBar = SnackBar(
                            //duration: const Duration(seconds: 1),
                            content: Text(
                                // ignore: unnecessary_string_interpolations
                                '${estadoQuantity ? "Compra exitosa" : "Algun producto no tiene Stock"}'),
                            action: SnackBarAction(
                              label: 'ok',
                              onPressed: () {
                                // Some code to undo the change.
                              },
                            ),
                          );
                          ref
                              .watch(productNotifierProvider.notifier)
                              .agregarProductosSinStock(ref);
                          //ref.watch(productNotifierProvider.notifier).agregarProductosSinStock()

                          // Find the ScaffoldMessenger in the widget tree
                          // and use it to show a SnackBar.
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              backgroundColor: Colors.green,
              child: const Icon(Icons.confirmation_number_sharp),
            ),
          ),
        ],
      ),
    );
  }

  Container listaProductos(carritoProducts, WidgetRef ref) {
    carritoProducts;
    // ignore: avoid_unnecessary_containers
    return Container(
        child: ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.all(1.0),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color.fromARGB(255, 56, 64, 70)),
            height: 80.0,
            child: Center(
              child: ListTile(
                //contentPadding: EdgeInsets.all(100.0),
                title: Text(
                  '${carritoProducts[index].name}\nPRECIO: ${carritoProducts[index].price}',
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  onPressed: () {
                    ref
                        .watch(productNotifierProvider.notifier)
                        .carritoProductsCancel(index, carritoProducts);
                  },
                ),
                leading: SizedBox(
                  height: 100.0,
                  width: 100.0,
                  child: Image.network(carritoProducts[index].image),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: carritoProducts.length,
    ));
  }
}
