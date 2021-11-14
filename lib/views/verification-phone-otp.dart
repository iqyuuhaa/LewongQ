import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';

import 'package:lewong_q_app/services/auth.dart';
import 'package:lewong_q_app/models/verification-phone.dart';

class VerificationPhoneOTP extends StatefulWidget {
  const VerificationPhoneOTP({ Key? key }) : super(key: key);

  @override
  _VerificationPhoneOTPState createState() => _VerificationPhoneOTPState();
}

class _VerificationPhoneOTPState extends State<VerificationPhoneOTP> {
  double getSmallestDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 2 / 3;
  double getBiggestDiameter(BuildContext context) =>
      MediaQuery.of(context).size.width * 7 / 8;

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as VerificationPhoneArguments;
    String _phone = args.phone;
    String _verificationId = args.verificationId;

    final _pinPutController = TextEditingController();
    final _pinPutFocusNode = FocusNode();
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Color.fromRGBO(235, 236, 237, 1),
      borderRadius: BorderRadius.circular(5.0),
    );

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
                    child: Text(
                      'Verify OTP Number',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10,),
                    child: Center(
                      child: Text('Insert OTP number'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(30),
                    child: PinPut(
                      fieldsCount: 6,
                      fieldsAlignment: MainAxisAlignment.spaceAround,
                      textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
                      eachFieldMargin: EdgeInsets.all(0),
                      eachFieldWidth: 45.0,
                      eachFieldHeight: 55.0,
                      focusNode: _pinPutFocusNode,
                      controller: _pinPutController,
                      submittedFieldDecoration: pinPutDecoration,
                      onSubmit: (String pin) async {
                        try {
                          await Auth.signInWithPhoneNumber(_verificationId, pin);
                        } catch (e) {
                          FocusScope.of(context).unfocus();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Invalid OTP'),),);
                        }
                      },
                      selectedFieldDecoration: pinPutDecoration.copyWith(
                        color: Colors.white,
                        border: Border.all(
                          width: 2,
                          color: Color.fromRGBO(160, 215, 220, 1),
                        ),
                      ),
                      followingFieldDecoration: pinPutDecoration,
                      pinAnimationType: PinAnimationType.scale,
                    ),
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