import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({Key? key, required this.screenSize})
      : super(key: key);

  final Size screenSize;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 5,
      ),
      // height: 100,
      width: screenSize.width,
      decoration: BoxDecoration(
          // color: Colors.redAccent,
          ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '{this.alerte.applicationTitle} : ',
            style: TextStyle(
              fontSize: 20,
              fontFamily: "Seravek",
            ),
          ),
          Text(
            '{this.alerte.taskTitle}',
            style: TextStyle(
              fontSize: 15,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
            ),
          ),
          Text(
            '{this.alerte.createdAt}',
            style: TextStyle(
              fontSize: 12,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
