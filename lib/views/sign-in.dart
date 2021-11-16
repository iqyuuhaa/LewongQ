import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:lewong_q_app/services/auth.dart';
import 'package:lewong_q_app/routes/routes.dart';

class SignInScreen extends StatelessWidget {
  double getSmallestDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiggestDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            right: -getBiggestDiameter(context) / 3,
            top: -getBiggestDiameter(context) / 2,
            child: Container(
              width: getSmallestDiameter(context),
              height: getSmallestDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xff3f85d3), Color(0xff3f85d3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            left: -getBiggestDiameter(context) / 4,
            top: -getBiggestDiameter(context) / 2,
            child: Container(
              width: getBiggestDiameter(context),
              height: getBiggestDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [Color(0xff3f85d3), Color(0xff3f85d3)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
            ),
          ),
          Positioned(
            right: -getBiggestDiameter(context) / 2,
            bottom: -getBiggestDiameter(context) / 1.5,
            child: Container(
              width: getBiggestDiameter(context),
              height: getBiggestDiameter(context),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xff3f85d3),
              ),
            ),
          ),
          Container(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  new Image.asset('assets/logo.png'),
                  Container(
                    margin: EdgeInsets.only(top: 10, bottom: 25,),
                    child: Text(
                      'Welcome to LewongQ',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  // ElevatedButton.icon(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, SIGN_IN_WITH_PHONE);
                  //   },
                  //   style: ElevatedButton.styleFrom(
                  //     primary: Color(0xff0369B3),
                  //     minimumSize: Size(346, 40),
                  //     shape: RoundedRectangleBorder(
                  //       borderRadius: new BorderRadius.circular(100.0),
                  //     ),
                  //   ),
                  //   icon: FaIcon(FontAwesomeIcons.phone),
                  //   label: Text('Sign In with Phone Number'),
                  // ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      await Auth.signInWithGoogle();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0369B3),
                      minimumSize: Size(346, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(100.0),
                      ),
                    ),
                    icon: FaIcon(FontAwesomeIcons.google),
                    label: Text('Sign In with Google'),
                  ),
                  ElevatedButton.icon(
                    onPressed: () async {
                      await Auth.signInAnonymous();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0369B3),
                      minimumSize: Size(346, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(100.0),
                      ),
                    ),
                    icon: FaIcon(FontAwesomeIcons.user),
                    label: Text('Sign In as Guest'),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ]
      )
    );
  }
}
