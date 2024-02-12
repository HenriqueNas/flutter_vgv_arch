import 'package:flutter/widgets.dart';
import 'package:flutter_vgv_arch/app/app.dart';
import 'package:flutter_vgv_arch/auth/auth.dart';

abstract class Routes {
  static const home = '/';
  static const login = '/login';
  static const register = '/register';
}

final appRoutes = {
  Routes.home: (BuildContext context) => const HomePage(),
  Routes.login: (BuildContext context) => const LoginPage(),
  Routes.register: (BuildContext context) => const RegisterPage(),
};
