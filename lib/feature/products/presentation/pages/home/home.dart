import 'dart:developer';

import 'package:app_comercio/core/routes/routes.dart';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import 'package:go_router/go_router.dart';

import '../homepage/widgets/drawer_home.dart';

class Home extends ConsumerWidget {
  const Home({Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  final String TAG = "log";
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var medida = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión de Productos"),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      drawer: const Drawer(
        child: DrawerHome(),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            SizedBox(
              width: medida.size.width * 0.40,
              child: ElevatedButton(
                child: const Text(
                  "Formulario",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                //onPressed: () => context.go('/homepage'),
                onPressed: () {
                  context.push(AppRoutes.AGREGARPRODUCTO);
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: medida.size.width * 0.40,
              child: ElevatedButton(
                child: const Text(
                  "Lista de Items",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  //Get.offAllNamed(AppRoutes.LISTA_TRABAJO);
                  context.push(AppRoutes.HOMEPAGE);
                  log("${TAG}se dirigira a homepage");
                },
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: medida.size.width * 0.40,
              child: ElevatedButton(
                child: const Text(
                  "Eliminar",
                  style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  context.push(AppRoutes.ELIMINARPRODUCTOS);
                  //Get.offAllNamed(AppRoutes.LISTA_TRABAJO);
                  //context.push(StatefulBottomSheet())
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
