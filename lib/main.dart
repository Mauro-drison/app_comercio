import 'package:app_comercio/core/routes/routes.dart';
import 'package:app_comercio/core/services/notification_services.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:app_comercio/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Aquí inicializamos la instancia de notificaciones
  await initNotifications();
  //showNotificacion();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final router = ref.watch(routerprovider);
    final router = ref.watch(routerProvider);
    final themeligth = ref.watch(theme);
    final themedarck = ref.watch(darkTheme);
    final thememode = ref.watch(themeMode);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'App Productos',
      routeInformationProvider: router.routeInformationProvider,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      theme: themeligth,
      darkTheme: themedarck,
      themeMode: thememode,
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
