import 'package:app_comercio/core/routes/state_routes.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/presentation/product_satate.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProductosSinStock extends ConsumerWidget {
  const ProductosSinStock({Key? key}) : super(key: key);
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
        title: const Text("Gestión de Productos"),
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
          Expanded(child: listaProductos(productosSinStock, ref))
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
          padding: const EdgeInsets.all(4.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 80.0,
            child: Center(
              child: ListTile(
                //contentPadding: EdgeInsets.all(100.0),
                title: Text(carritoProducts[index].name),
                subtitle: const Text("SE NECESITA MAS STOCK DE ESTE PRODUCTO"),
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
