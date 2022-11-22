import 'package:airpedia/app/modules/api_log/bindings/api_log_binding.dart';
import 'package:airpedia/app/modules/api_log/views/api_log_view.dart';
import 'package:airpedia/app/modules/blocked_view.dart';
import 'package:airpedia/app/modules/home/bindings/home_binding.dart';
import 'package:airpedia/app/modules/home/views/home_view.dart';
import 'package:airpedia/app/modules/login/bindings/login_binding.dart';
import 'package:airpedia/app/modules/login/views/login_view.dart';
import 'package:airpedia/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:airpedia/app/modules/onboarding/views/onboarding_view.dart';
import 'package:airpedia/app/modules/register/bindings/register_binding.dart';
import 'package:airpedia/app/modules/register/views/register_success_view.dart';
import 'package:airpedia/app/modules/register/views/register_view.dart';
import 'package:airpedia/app/modules/splash_screen_view.dart';
import 'package:airpedia/app/modules/under_development.dart';
import 'package:get/get.dart';

// ignore_for_file: constant_identifier_names

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: _Paths.BLOCKED,
      page: () => const BlockedView(),
    ),
    GetPage(
      name: _Paths.UNDER_DEVELOPMENT,
      page: () => const UnderDevelopmentView(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => const SplashScreenView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.API_LOG,
      page: () => const ApiLogView(),
      binding: ApiLogBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER_SUCCESS,
      page: () => const RegisterSuccessView(),
      binding: RegisterBinding(),
    ),
  ];
}
