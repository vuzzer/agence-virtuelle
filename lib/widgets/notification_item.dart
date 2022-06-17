import 'package:agency/models/notif.dart';
import 'package:flutter/material.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem(
      {Key? key, required this.screenSize, required this.notif})
      : super(key: key);

  final Size screenSize;
  final Notif notif;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
        horizontal: 10,
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 3,
        horizontal: 15,
      ),
      height: 100,
      width: screenSize.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        color: Colors.grey.shade300,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            '${notif.libelle} ',
            style: const TextStyle(
              fontSize: 20,
              fontFamily: "Seravek",
            ),
          ),
          Text(
            'Motif : ${notif.description}',
            style: const TextStyle(
              fontSize: 14,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            'Date : ${notif.date}',
            style: const TextStyle(
              fontSize: 15,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
