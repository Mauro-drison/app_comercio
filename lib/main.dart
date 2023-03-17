import 'package:app_comercio/core/routes/pages.dart';
import 'package:app_comercio/core/routes/routes.dart';
import 'package:app_comercio/core/routes/state_routes.dart';
import 'package:app_comercio/core/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Aquí inicializamos la instancia de notificaciones
  await initNotifications();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final router = ref.watch(routerprovider);
    final router = ref.watch(routerProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'App Productos',
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: ThemeData(
          //Se indica que el tema tiene un brillo luminoso/claro

          brightness: Brightness.light,
          //backgroundColor: Colors.amber,
          primarySwatch: Colors.blue),
      darkTheme: ThemeData(
        //Se indica que el tema tiene un brillo oscuro
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
      /*
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch(
                    brightness: Brightness.dark, primarySwatch: Colors.purple)
                .copyWith(secondary: Colors.purpleAccent),
            textTheme: const TextTheme(
                bodyText1: TextStyle(color: Colors.black),
                bodyText2: TextStyle(color: Colors.white)),
            cardColor: Colors.purple),
        //home: const HomePage()
        */
    );
    //home: const Home());
  }
}
