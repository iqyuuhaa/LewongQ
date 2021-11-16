import 'package:flutter/material.dart';

import 'package:lewong_q_app/routes/routes.dart';

import 'package:lewong_q_app/services/auth.dart';
import 'package:lewong_q_app/arguments/verification-phone.dart';

class SignInWithPhone extends StatefulWidget {
  const SignInWithPhone({ Key? key }) : super(key: key);

  @override
  _SignInWithPhoneState createState() => _SignInWithPhoneState();
}

class _SignInWithPhoneState extends State<SignInWithPhone> {
  double getSmallestDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiggestDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController(text: '');

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
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Spacer(),
                  Container(
                    margin: EdgeInsets.only(top: 10,),
                    child: Text(
                      'Phone Number Authentication',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(25),
                    child: TextField(
                      maxLength: 12,
                      keyboardType: TextInputType.number,
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: 'Phone Number',
                        prefix: Padding(
                          padding: EdgeInsets.all(4),
                          child: Text('+62'),
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      String verificationId = await Auth.verifyPhone(_controller.text);
                      Navigator.pushNamed(context, VERIFICATION_PHONE_TOKEN, arguments: VerificationPhoneArguments(_controller.text, verificationId));
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Color(0xff0369B3),
                      minimumSize: Size(346, 40),
                      shape: RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(100.0),
                      ),
                    ),
                    child: Text('Get OTP Number'),
                  ),
                  Spacer(),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}