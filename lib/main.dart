import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';

import 'package:lewong_q_app/routes/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) => runApp(LewongQApp()));
}

class LewongQApp extends StatefulWidget {
  const LewongQApp({ Key? key }) : super(key: key);

  @override
  _LewongQAppState createState() => _LewongQAppState();
}

class _LewongQAppState extends State<LewongQApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      initialData: null,
      value: FirebaseAuth.instance.authStateChanges(),
      child: MaterialApp(
        initialRoute: SPLASH_ROUTE,
        routes: routes,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
        ),
      ),
    );
  }
}