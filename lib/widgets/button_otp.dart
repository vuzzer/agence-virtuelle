import 'package:agency/screens/start_screen.dart';
import 'package:agency/screens/verification_screen.dart';
import 'package:flutter/material.dart';

class ButtonOtp extends StatefulWidget {
  @override
  State<ButtonOtp> createState() => _ButtonOtpState();
}

class _ButtonOtpState extends State<ButtonOtp> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {
        setState(() {
          _isLoading = true;
        });

        Future.delayed(Duration(seconds: 2), () {
          setState(() {
            _isLoading = false;
          });
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => StartScreen()));
        });
      },
      color: Colors.black,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: _isLoading
          ? Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: Colors.black,
                strokeWidth: 2,
              ),
            )
          : Text(
              "Request OTP",
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
