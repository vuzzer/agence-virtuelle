import 'dart:convert';

import 'package:agency/models/notif.dart';
import 'package:agency/utils/Constants.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

class NotifProvider extends ChangeNotifier {
  List<Notif> notifs = [];

  Future<void> getNotifs() async {
    //
    var response = await http.get(
      // Post pièces d'identité
      Uri.parse(Constants.MESSAGES_URL),
      headers: {
        "Content-Type": "application/json",
        "custom-header": "1",
      },
    );

    print("Response Notif  --- " + response.statusCode.toString());
    print("reason Notif  --- " + response.reasonPhrase.toString());

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      data.forEach((json) {
        notifs.add(Notif.fromJson(json));
      });

      print(notifs.toString());
    }
  }
}
