import 'package:lewong_q_app/views/splash.dart';
import 'package:lewong_q_app/views/getting-started.dart';
import 'package:lewong_q_app/wrapper.dart';

import 'package:lewong_q_app/views/sign-in-with-phone.dart';
import 'package:lewong_q_app/views/verification-phone-otp.dart';

import 'package:lewong_q_app/views/destination-list.dart';
import 'package:lewong_q_app/views/destination-detail.dart';
import 'package:lewong_q_app/views/gallery-detail.dart';
import 'package:lewong_q_app/views/change-profile.dart';
import 'package:lewong_q_app/views/create-destination.dart';
import 'package:lewong_q_app/views/gallery-list.dart';
import 'package:lewong_q_app/views/create-gallery.dart';
import 'package:lewong_q_app/views/bookmark.dart';

const String SPLASH_ROUTE = "/";
const String WRAPPER = "/wrapper";
const String GETTING_STARTED = "/getting-started";

const String SIGN_IN_WITH_PHONE = "/sign-in-with-phone";
const String VERIFICATION_PHONE_TOKEN = "/verification-phone-token";

const String DESTINATION_LIST = "/destination-list";
const String DESTINATION_DETAIL = "/destination-detail";
const String GALLERY_DETAIL = "/gallery-detail";
const String CHANGE_PROFILE = "/change-profile";
const String CREATE_DESTINATION = "/create-destination";
const String GALLERY_LIST = "/gallery-list";
const String CREATE_GALLERY = "/create-gallery";
const String BOOKMARK = "/bookmark";

final routes = {
  SPLASH_ROUTE: (context) => SplashScreen(),
  GETTING_STARTED: (context) => GettingStartedScreen(),
  WRAPPER: (context) => Wrapper(),

  SIGN_IN_WITH_PHONE: (context) => SignInWithPhone(),
  VERIFICATION_PHONE_TOKEN: (context) => VerificationPhoneOTP(),

  DESTINATION_LIST: (context) => DestinationListScreen(),
  DESTINATION_DETAIL: (context) => DestinationDetailScreen(),
  GALLERY_DETAIL: (context) => GalleryDetailScreen(),
  CHANGE_PROFILE: (context) => ChangeProfileScreen(),
  CREATE_DESTINATION: (context) => CreateDestinationScreen(),
  GALLERY_LIST: (context) => GalleryListScreen(),
  CREATE_GALLERY: (context) => CreateGalleryScreen(),
  BOOKMARK: (context) => BookmarkScreen(),
};
