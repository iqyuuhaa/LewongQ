import 'package:lewong_q_app/views/getting-started.dart';
import 'package:lewong_q_app/views/splash.dart';

import 'package:lewong_q_app/wrapper.dart';

const String SPLASH_ROUTE = "/";
const String WRAPPER = "/wrapper";
const String GETTING_STARTED = "/getting-started";

final routes = {
  SPLASH_ROUTE: (context) => SplashScreen(),
  GETTING_STARTED: (context) => GettingStartedScreen(),
  WRAPPER: (context) => Wrapper(),
};
