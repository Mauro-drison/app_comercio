import 'package:app_comercio/core/routes/state_routes.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/domain/entities/product.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_comercio/utils/utils.dart' as utils;

class PageEditarProdut extends ConsumerStatefulWidget {
  //final Product productos;
  PageEditarProdut({Key? key});

  // ignore: non_constant_identifier_names
  final String TAG = "-------------------------";
  @override
  // ignore: library_private_types_in_public_api
  _StatefulBottomSheetState createState() => _StatefulBottomSheetState();
}

class _StatefulBottomSheetState extends ConsumerState<PageEditarProdut> {
  late ProductModel productos;
  final _formKey = GlobalKey<FormState>();
  //late final Product productos;
  //final name = TextEditingController();
  //final image = TextEditingController(text: "");
  //final price = TextEditingController();
  //final startDate = TextEditingController();
  //final endingDate = TextEditingController();
  //final quantity = TextEditingController();

  _StatefulBottomSheetState();
  @override
  void initState() {
    //productos = widget.productos;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProductModel product = ref.watch(productNotifierProvider).updelProducts;
    ProductModel productos = product;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "EDITAR PRODUCTO",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        leading: IconButton(
          tooltip: 'Previous choice',
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            ref.read(routeProvider.notifier).homepage();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 30, left: 60, right: 30),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'nombre',
                  ),
                  //controller: name,
                  initialValue: product.name,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    productos.name = value;
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'imagen',
                  ),

                  initialValue: product.image,
                  //controller: image,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    productos.image = value;
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'precio',
                    ),
                    //controller: price,
                    initialValue: product.price.toString(),
                    // The validator receives the text that the user has entered.
                    validator: (value) {
                      if (utils.isNumeric(value!)) {
                        return null;
                      } else {
                        return 'solo número';
                      }
                    },
                    onChanged: (value) {
                      productos.price = double.parse(value);
                    }),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'cantidad',
                  ),
                  //controller: quantity,
                  initialValue: product.quantity.toString(),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (utils.isNumeric(value!)) {
                      return null;
                    } else {
                      return 'solo número';
                    }
                  },
                  onChanged: (value) {
                    productos.quantity = int.parse(value);
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.green),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      //ProductModel producto = ProductModel(
                      //    id: product.id,
                      //    name: name.text,
                      //    image: image.text,
                      //    price: double.parse(price.text),
                      //    quantity: int.parse(quantity.text),
                      //    startDate: startDate.text,
                      //    endingDate: startDate.text);

                      ref
                          .watch(productNotifierProvider.notifier)
                          .modificarProducto(productos);

                      //ref.watch(getProductData);
                    }
                  },
                  child: const Text('GUARDAR'),
                ),
              ],
            )),
      ),
    );
  }
}
