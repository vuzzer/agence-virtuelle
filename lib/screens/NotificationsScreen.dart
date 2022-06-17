import 'package:agency/providers/notif.provider.dart';
import 'package:agency/widgets/my_custom_app_bar.dart';
import 'package:agency/widgets/notification_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NotificationsScreen extends StatefulWidget {
  NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    NotifProvider notifProvider =
        Provider.of<NotifProvider>(context, listen: false);
    notifProvider.getNotifs();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mes notifications'),
      ),
      body: Container(
        child: SingleChildScrollView(child: Consumer<NotifProvider>(
          builder: (context, notifProvider, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: notifProvider.notifs
                    .map((notif) => NotificationItem(screenSize: screenSize, notif : notif))
                    .toList());
          },
        )),
      ),
    );
  }
}
