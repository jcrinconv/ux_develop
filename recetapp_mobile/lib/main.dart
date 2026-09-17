import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:recetapp_mobile/dependencies_injection/locator.dart';

import 'presentation/presentation.dart';

Future<void> main() async {
  runZonedGuarded<Future<void>>(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      // Configurar servicios básicos
      await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: const Color.fromARGB(0, 70, 59, 59), statusBarIconBrightness: Brightness.dark),
      );

      // Inicializar servicios en orden
      startServiceLocator();

      // Inicializar la app
      runApp(const MyApp());
    },
    (error, stack) {
      debugPrint('Uncaught error: $error');
    },
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final navigationService = locator<NavigationService>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        title: 'Recetapp Mobile',
        home: child,
        scaffoldMessengerKey: snackbarKey,
        routes: appRoutes,
        initialRoute: homeScreenRoute,
        navigatorKey: navigationService.key,
        onGenerateRoute: generateRoute,
        debugShowCheckedModeBanner: false,
        builder: (context, child) => MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
          child: child ?? SizedBox(),
        ),
        theme: recetappTheme,
      ),
    );
  }
}
