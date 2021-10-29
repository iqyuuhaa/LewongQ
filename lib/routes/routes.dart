import 'package:lewong_q_app/pages/getting-started.dart';
import 'package:lewong_q_app/pages/login.dart';
import 'package:lewong_q_app/pages/splash.dart';

const String SPLASH_ROUTE = "/";
const String GETTING_STARTED = "/getting-started";
const String LOGIN_ROUTE = "/login";

final routes = {
  SPLASH_ROUTE: (context) => SplashScreen(),
  GETTING_STARTED: (context) => GettingStartedScreen(),
  LOGIN_ROUTE: (context) => LoginPage(),
};
