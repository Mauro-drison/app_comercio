import 'package:app_comercio/core/routes/routes.dart';
import 'package:app_comercio/core/routes/state_routes.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerHome extends ConsumerStatefulWidget {
  //final Product productos;
  const DrawerHome({Key? key});

  @override
  // ignore: library_private_types_in_public_api
  _StatefulBottomSheetState createState() => _StatefulBottomSheetState();
}

class _StatefulBottomSheetState extends ConsumerState<DrawerHome> {
  //late Product productos;
  @override
  void initState() {
    //productos = widget.productos;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    //var route = ref.watch(routerProvider);
    return ListView(
      // Important: Remove any padding from the ListView.
      //adding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          decoration: const BoxDecoration(
            color: Color.fromRGBO(24, 24, 24, 1),
          ),
          child: Column(
            children: [
              IconButton(
                color: Colors.white,
                icon: const Icon(
                  Icons.account_circle_rounded,
                ),
                onPressed: () {},
                iconSize: 70.0,
              ),
            ],
          ),
        ),
        ListTile(
          leading: const Icon(Icons.add_shopping_cart_outlined),
          title: const Text(
            'MIS COMPRAS EN PROCESO',
            style: TextStyle(),
          ),
          onTap: () {},
        ),
        ListTile(
          leading: const Icon(Icons.local_attraction_outlined),
          title: const Text('OFERTAS'),
          onTap: () {
            // Update the state of the app.
            // ...
          },
        ),
        ListTile(
          leading: const Icon(Icons.add),
          title: const Text('AGREGAR PRODUCTOS'),
          onTap: () {
            ref.read(routeProvider.notifier).addProducts();
          },
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('EDITAR PRODUCTOS'),
          onTap: () {},
        ),
      ],
    );
  }
}
