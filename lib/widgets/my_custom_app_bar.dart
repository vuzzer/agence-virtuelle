import 'package:flutter/material.dart';

class MyCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double preferredHeight;
  final List<Widget> widgets;
  final bool isSpaceBetween;
  MyCustomAppBar(this.widgets,
      {this.preferredHeight = 100, this.isSpaceBetween = true});

  @override
  Size get preferredSize => Size.fromHeight(preferredHeight);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.14,
      padding: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 40,
      ),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        mainAxisAlignment: this.isSpaceBetween? MainAxisAlignment.spaceBetween : MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: widgets,
      ),
    );
  }
}