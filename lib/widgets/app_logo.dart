import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  Function onTap;
  bool isLogo;
  AppLogo({Key? key, required this.onTap, required this.isLogo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return isLogo ? Text(
      'A.',
      style: TextStyle(
        fontSize: 26.r,
        fontWeight: FontWeight.bold,
      ),
    ) : InkWell(onTap: onTap(), child: const Icon(Icons.arrow_back ));
  }
}
