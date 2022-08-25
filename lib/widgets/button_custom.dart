import 'package:agency/screens/start_screen.dart';
import 'package:agency/screens/verification_screen.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatefulWidget {
  final String text;
  final Color color;
  final Function onPressed;
  const ButtonCustom(
      {Key? key,
      required this.text,
      required this.color,
      required this.onPressed})
      : super(key: key);
  @override
  State<ButtonCustom> createState() => _ButtonCustomState();
}

class _ButtonCustomState extends State<ButtonCustom> {
  bool _isLoading = false;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      onPressed: () {
        setState(() {
          _isLoading = true;
        });

        Future.delayed(const Duration(seconds: 2), () {
          setState(() {
            _isLoading = false;
          });
          widget.onPressed();
        });
      },
      color: widget.color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: _isLoading
          ? Container(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                backgroundColor: Colors.white,
                color: widget.color,
                strokeWidth: 2,
              ),
            )
          : Text(
              widget.text,
              style: TextStyle(color: Colors.white),
            ),
    );
  }
}
