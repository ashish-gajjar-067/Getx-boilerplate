import 'package:get/get.dart';
import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_binding.dart';
import 'package:getx_boilerplate/features/presentation/screens/auth/login/login_screen.dart';
import 'package:getx_boilerplate/features/presentation/screens/main/bottom_tab.dart';
import 'package:getx_boilerplate/features/presentation/screens/splash/splash_binding.dart';
import 'package:getx_boilerplate/features/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const initial = SplashScreen.route_name;

  static List<GetPage> pages() {
    return [
      GetPage(
        name: SplashScreen.route_name,
        page: () => SplashScreen(),
        binding: SplashBinding(),
      ),
      GetPage(
        name: LoginScreen.route_name,
        page: () => LoginScreen(),
        binding: LoginBinding(),
      ),
      GetPage(
        name: BottomTab.route_name,
        page: () => BottomTab(),
      )
    ];
  }

  static PageRouteBuilder _slideRightRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionDuration: Duration(milliseconds: 300),
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(1, 0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      ),
    );
  }

  static PageRouteBuilder _fadeInRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (_, __, ___) => page,
      transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
      ) =>
          FadeTransition(
        opacity: animation,
        child: child,
      ),
      transitionDuration: Duration(milliseconds: 500),
    );
  }
}
