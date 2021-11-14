import 'package:lewong_q_app/views/splash.dart';
import 'package:lewong_q_app/views/getting-started.dart';
import 'package:lewong_q_app/wrapper.dart';

import 'package:lewong_q_app/views/sign-in-with-phone.dart';
import 'package:lewong_q_app/views/verification-phone-otp.dart';

const String SPLASH_ROUTE = "/";
const String WRAPPER = "/wrapper";
const String GETTING_STARTED = "/getting-started";

const String SIGN_IN_WITH_PHONE = "/sign-in-with-phone";
const String VERIFICATION_PHONE_TOKEN = "/verification-phone-token";

final routes = {
  SPLASH_ROUTE: (context) => SplashScreen(),
  GETTING_STARTED: (context) => GettingStartedScreen(),
  WRAPPER: (context) => Wrapper(),

  SIGN_IN_WITH_PHONE: (context) => SignInWithPhone(),
  VERIFICATION_PHONE_TOKEN: (context) => VerificationPhoneOTP(),
};
