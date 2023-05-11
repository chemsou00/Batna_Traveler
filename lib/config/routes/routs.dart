import 'package:batna_traveler/controller/admin/admin_panel_home.dart';
import 'package:batna_traveler/view/screens/auth/sign_in.dart';
import 'package:batna_traveler/view/screens/auth/sign_up.dart';
import 'package:batna_traveler/view/screens/home_screen.dart';
import 'package:batna_traveler/view/screens/on_boarding.dart';
import 'package:get/get.dart';
// Routs Class
class AppRouts {
  static const String onBoarding = '/';
  static const String homeScreen = '/home';
  static const String signInScreen = '/signInScreen';
  static const String signUpScreen = '/signUpScreen';
  static const String adminPanel = '/adminPanel';
}


List<GetPage<dynamic>>? routes = [
  GetPage(name: AppRouts.onBoarding , page: () => const OnBoarding()),
  GetPage(name: AppRouts.homeScreen, page: () => const HomeScreen()),
  GetPage(name: AppRouts.signInScreen, page: () => const SignInScreen()),
  GetPage(name: AppRouts.signUpScreen, page: () => const SignUpScreen()),
  GetPage(name: AppRouts.adminPanel, page: () => const AdminPanel()),
];



