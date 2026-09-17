import 'package:get_it/get_it.dart';

import '../presentation/presentation.dart';

/// {@category Dependencies Injection}
/// @nodoc
GetIt locator = GetIt.instance;

void startServiceLocator() {
  locator.registerSingleton<NavigationService>(NavigationService());
}
