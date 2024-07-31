import 'package:get/get.dart';
import 'package:templete_editor/view/home_screen.dart';
import 'package:templete_editor/view/splash_screen.dart';

class AppPages {
  static const INITIAL = '/splash';

  static final routes = [
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: '/home',
      page: () => HomeScreen(),
      transition: Transition.leftToRightWithFade,
    ),
  ];
}
