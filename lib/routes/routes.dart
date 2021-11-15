import 'package:lewong_q_app/views/splash.dart';
import 'package:lewong_q_app/views/getting-started.dart';
import 'package:lewong_q_app/wrapper.dart';

import 'package:lewong_q_app/views/sign-in-with-phone.dart';
import 'package:lewong_q_app/views/verification-phone-otp.dart';

import 'package:lewong_q_app/views/gallery-detail.dart';
import 'package:lewong_q_app/views/change-profile.dart';
import 'package:lewong_q_app/views/create-destination.dart';
import 'package:lewong_q_app/views/create-gallery.dart';

const String SPLASH_ROUTE = "/";
const String WRAPPER = "/wrapper";
const String GETTING_STARTED = "/getting-started";

const String SIGN_IN_WITH_PHONE = "/sign-in-with-phone";
const String VERIFICATION_PHONE_TOKEN = "/verification-phone-token";

const String GALLERY_DETAIL = "/gallery-detail";
const String CHANGE_PROFILE = "/change-profile";
const String CREATE_DESTINATION = "/create-destination";
const String CREATE_GALLERY = "/create-gallery";

final routes = {
  SPLASH_ROUTE: (context) => SplashScreen(),
  GETTING_STARTED: (context) => GettingStartedScreen(),
  WRAPPER: (context) => Wrapper(),

  SIGN_IN_WITH_PHONE: (context) => SignInWithPhone(),
  VERIFICATION_PHONE_TOKEN: (context) => VerificationPhoneOTP(),

  GALLERY_DETAIL: (context) => GalleryDetailScreen(),
  CHANGE_PROFILE: (context) => ChangeProfileScreen(),
  CREATE_DESTINATION: (context) => CreateDestinationScreen(),
  CREATE_GALLERY: (context) => CreateGalleryScreen(),
};
