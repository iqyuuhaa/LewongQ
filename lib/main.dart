import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lewong_q_app/routes/routes.dart';
import 'package:google_fonts/google_fonts.dart';

import 'services/auth_service.dart';
import 'wrapper.dart';

void main() => runApp(LewongQApp());

class LewongQApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService.firebaseUserStream,
      child: MaterialApp(
        initialRoute: SPLASH_ROUTE,
        routes: routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            textTheme:
                GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)),
        // home: Wrapper(),
      ),
    );
  }
}
