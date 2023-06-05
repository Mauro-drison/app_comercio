import 'package:app_comercio/core/routes/state_routes.dart';
import 'package:app_comercio/feature/products/data/model/product_model.dart';
import 'package:app_comercio/feature/products/product_provider/product_provider.dart';
import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:app_comercio/utils/utils.dart' as utils;

class AgregarProductos extends ConsumerStatefulWidget {
  //final Product productos;
  // ignore: use_key_in_widget_constructors
  const AgregarProductos({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _StatefulBottomSheetState createState() => _StatefulBottomSheetState();
}

class _StatefulBottomSheetState extends ConsumerState<AgregarProductos> {
  //late Product productos;
  final _formKey = GlobalKey<FormState>();
  //late final Product productos;
  final name = TextEditingController();
  final image = TextEditingController();
  final price = TextEditingController();
  final startDate = TextEditingController();
  final endingDate = TextEditingController();
  final quantity = TextEditingController();
  @override
  void initState() {
    //productos = widget.productos;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AGREGAR PRODUCTOS",
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
        padding: const EdgeInsets.only(top: 30, left: 60, right: 30),
        child: Form(
            key: _formKey,
            child: ListView(
              children: [
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'nombre',
                  ),
                  controller: name,
                  //initialValue: productos.name,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'imagen',
                  ),
                  controller: image,
                  //initialValue: productos.name,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'precio',
                  ),
                  controller: price,
                  //initialValue: productos.name,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (utils.isNumeric(value!)) {
                      return null;
                    } else {
                      return 'solo número';
                    }
                  },
                  //  onChanged: (value) {
                  //    productos.price = value as double;
                  //  }
                ),
                const SizedBox(
                  height: 5.0,
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'cantidad',
                  ),
                  controller: quantity,
                  //initialValue: productos.name,
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (utils.isNumeric(value!)) {
                      return null;
                    } else {
                      return 'solo número';
                    }
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
                      ProductModel producto = ProductModel(
                          id: "1",
                          name: name.text,
                          image: image.text,
                          price: double.parse(price.text),
                          quantity: int.parse(quantity.text),
                          startDate: "12/12/2023",
                          endingDate: "12/12/2023");

                      // ignore: unused_local_variable
                      var agregar = ref
                          .watch(productNotifierProvider.notifier)
                          .agregarProductos(producto);

                      final snackBar = SnackBar(
                        duration: const Duration(milliseconds: 300),
                        content: const Text(
                            // ignore: unnecessary_string_interpolations
                            'Producto agregado'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: () {
                            // Some code to undo the change.
                          },
                        ),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
