import 'package:get/get.dart';

import '../modules/formulaire/bindings/formulaire_binding.dart';
import '../modules/formulaire/views/formulaire_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/image_list/bindings/image_list_binding.dart';
import '../modules/image_list/views/image_list_view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash_screen/bindings/splash_screen_binding.dart';
import '../modules/splash_screen/views/splash_screen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.FORMULAIRE,
      page: () => const FormulaireView(),
      binding: FormulaireBinding(),
    ),
    GetPage(
      name: _Paths.IMAGE_LIST,
      page: () => ImageListView(),
      binding: ImageListBinding(),
    ),
    GetPage(
      name: _Paths.SETTINGS,
      page: () => const SettingsView(),
      binding: SettingsBinding(),
    ),
  ];
}
