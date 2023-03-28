import 'package:flutter/material.dart';
import 'package:limpio/views/home/home_page.dart';
import 'package:limpio/views/home/main_home_page.dart';
import 'package:limpio/views/login/login_page.dart';
import 'package:limpio/views/register/register_page.dart';
import 'package:limpio/views/settings/settings_page.dart';
import 'package:limpio/views/splash/splash_screen.dart';

class Routes {
  Routes._(); //this is to prevent anyone from instantiate this object

  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
  static const String setting = '/setting';
  static const String main_home = '/create_edit_todo';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginPage(),
    register: (BuildContext context) => RegisterPage(),
    home: (BuildContext context) => HomePage(),
    main_home: (BuildContext context) => MainHomePage(),
    setting: (BuildContext context) => SettingsPage(),
  };
}
