import 'package:flutter/material.dart';
import 'package:recetapp_mobile/presentation/presentation.dart';

/// Servicio de navegación centralizado para la aplicación.
/// Permite gestionar la navegación y mantener un historial de rutas.
class NavigationService {
  /// Clave global para acceder al [NavigatorState].
  final GlobalKey<NavigatorState> key = GlobalKey<NavigatorState>();

  /// Historial de rutas navegadas. Se inicializa con la ruta raíz ('/').
  final List<String> _routeHistory = ['/'];

  /// Devuelve el estado actual del [Navigator] asociado a [key].
  NavigatorState? get state => key.currentState;

  /// Retorna la ruta actual (última en el historial).
  String get currentRoute => _routeHistory.last;

  /// Actualiza el historial de rutas añadiendo la [route] actual.
  void _updateCurrentRoute(String route) {
    _routeHistory.add(route);
  }

  /// Navega a una nueva página [page] utilizando un [MaterialPageRoute].
  ///
  /// [fullScreenDialog]: Si es `true`, la ruta se muestra como un diálogo de pantalla completa.
  /// Retorna un [Future] que se resuelve cuando la nueva ruta se cierra.
  Future<T?> navigateToPage<T>(Widget page, {bool fullScreenDialog = false}) {
    final route = MaterialPageRoute<T>(
      builder: (context) => page,
      fullscreenDialog: fullScreenDialog,
      settings: RouteSettings(name: page.runtimeType.toString()),
    );
    _updateCurrentRoute(route.settings.name!);
    if (state != null) {
      return state!.push<T>(route);
    } else {
      // Si no hay un NavigatorState, retorna un Future completado con null.
      return Future.value(null);
    }
  }

  /// Navega a una nueva página [page] utilizando un [PageRouteBuilder] para mayor personalización.
  ///
  /// [fullScreenDialog]: Si es `true`, la ruta se muestra como un diálogo de pantalla completa.
  /// [opaque]: Define si la ruta es opaca o no.
  /// Retorna un [Future] que se resuelve cuando la nueva ruta se cierra.
  Future<T?> navigateToPageCustom<T>(Widget page, {bool fullScreenDialog = false, bool opaque = true}) {
    final route = PageRouteBuilder<T>(
      pageBuilder: (_, _, _) => page,
      fullscreenDialog: fullScreenDialog,
      opaque: opaque,
      settings: RouteSettings(name: page.runtimeType.toString()),
    );
    _updateCurrentRoute(route.settings.name!);
    if (state != null) {
      return state!.push<T>(route);
    } else {
      return Future.value(null);
    }
  }

  /// Navega a una ruta nombrada [routeName].
  ///
  /// [arguments]: Argumentos adicionales que se pasan a la ruta.
  Future<dynamic> navigateToNamedRoute(String routeName, {Bundle? arguments}) {
    _updateCurrentRoute(routeName);
    if (state != null) {
      return state!.pushNamed(routeName, arguments: arguments);
    } else {
      return Future.value(null);
    }
  }

  // Navega a una ruta nombrada [routeName] eliminando `todo` el historial anterior.
  ///
  /// [arguments]: Argumentos adicionales que se pasan a la ruta.
  Future<dynamic> navigateToNamedRouteNoBackStack(String routeName, {Bundle? arguments}) {
    _routeHistory.clear();
    _updateCurrentRoute(routeName);
    if (state != null) {
      return state!.pushNamedAndRemoveUntil(routeName, (route) => false, arguments: arguments);
    } else {
      return Future.value(null);
    }
  }

  /// Navega a una nueva página [page] eliminando el historial anterior.
  ///
  /// Retorna un [Future] que se resuelve cuando la nueva ruta se cierra.
  Future<T?> navigateToPageRouteNoBackStack<T>(Widget page) {
    final route = MaterialPageRoute<T>(
      builder: (context) => page,
      settings: RouteSettings(name: page.runtimeType.toString()),
    );
    _routeHistory.clear();
    _updateCurrentRoute(route.settings.name!);
    if (state != null) {
      return state!.pushAndRemoveUntil<T>(route, (route) => false);
    } else {
      return Future.value(null);
    }
  }

  /// Sustituye la ruta actual por una ruta nombrada [routeName].
  ///
  /// [arguments]: Argumentos adicionales que se pasan a la ruta.
  Future<dynamic> navigateToNamedRemoveCurrent(String routeName, {Bundle? arguments}) {
    _updateCurrentRoute(routeName);
    if (state != null) {
      return state!.popAndPushNamed(routeName, arguments: arguments);
    } else {
      return Future.value(null);
    }
  }

  /// Reemplaza la ruta actual con una nueva página [page].
  ///
  /// Primero elimina la ruta actual y luego la reemplaza con la nueva.
  Future<T?> navigateToPageRemoveCurrent<T>(Widget page) {
    final route = MaterialPageRoute<T>(
      builder: (context) => page,
      settings: RouteSettings(name: page.runtimeType.toString()),
    );
    _updateCurrentRoute(route.settings.name!);
    if (state != null) {
      state!.pop();
      return state!.push<T>(route);
    } else {
      return Future.value(null);
    }
  }

  /// Retrocede a la ruta anterior.
  ///
  /// [result]: Valor que se devuelve a la ruta anterior.
  /// Actualiza el historial de rutas eliminando la última ruta si es posible.
  void goBack<T>({T? result}) {
    if (state?.canPop() ?? false) {
      state?.pop(result);
      if (_routeHistory.length > 1) {
        _routeHistory.removeLast();
      }
    }
  }

  /// Verifica si se puede navegar a la ruta [routeName].
  ///
  /// Retorna `true` si la ruta actual es la raíz ('/') o si la ruta actual es diferente a [routeName].
  bool canNavigateTo(String routeName) {
    if (currentRoute == '/') return true;
    return currentRoute != routeName;
  }
}
