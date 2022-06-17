import 'dart:convert';
import 'dart:io';

import 'package:agency/utils/Constants.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; 

class IdentificationProvider extends ChangeNotifier {
  Future<void> soumettreIdentification(
      String tel,
      String telSecondaire,
      String typeID,
      String numeroID,
      String lieuDelivranceID,
      String emissionID,
      String expirationID,
      String civilite,
      String nom,
      String prenoms,
      String lieuNaissance,
      String dateNaissance,
      String profession,
      String adresseGeo,
      String nationalite,
      File imageID,
      File photoRequerant) async {
    //
    Map<String, dynamic> data = {
      // data pieces ID
      "type_piece": typeID,
      "numero_piece": numeroID,
      "lieu_delivrance": lieuDelivranceID,
      "date_emission": emissionID,
      "date_expiration": expirationID,
    };

    var response = await http.post(
      // Post pièces d'identité
      Uri.parse(Constants.ID_URL),
      headers: {
        "Content-Type": "application/json",
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      var piecesID = json.decode(response.body)["id"];

      data = {
        "nom": nom,
        "prenom": prenoms,
        "lieu_naissance": lieuNaissance,
        "civilite": civilite,
        "adresse": adresseGeo,
        "profession": profession,
        "date_naissance": dateNaissance,
        "admin_user": "1",
        "piece_identite": piecesID.toString(),
        "nationalite": nationalite,
      };

      response = await http.post(
        // Post requerant
        Uri.parse(Constants.REQUERANT_URL),
        headers: {
          "Content-Type": "application/json",
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 200) {
        var requerentId = json.decode(response.body)["id"];

        Map<String, String> dataIdentification = {
          "numero_telephone": tel,
          "telephone_secondaire": telSecondaire, 
          "client": requerentId.toString(),
        }; 

        // var request = http.MultipartRequest(
        //     'POST', Uri.parse(Constants.IDENTIFICATION_URL));

        // request.files.add(await http.MultipartFile.fromPath(
        //     'image_cni', imageID.path));

        // request.files.add(await http.MultipartFile.fromPath(
        //   "photo_requerent",
        //   photoRequerant.path,
        // ));

        // request.fields.addAll(dataIdentification);
        // request.headers.addAll({
        //   "Content-Type": "multipart/form-data",
        // });

        // var res = await request.send();

        response = await http.post(
          // Post identification
          Uri.parse(Constants.IDENTIFICATION_URL),
          headers: {
            "Content-Type": "application/json",
          },
          body: jsonEncode(dataIdentification),
        );

        print("status code identification " + response.statusCode.toString());
        print("msg de retour identification " + response.reasonPhrase.toString());
      } else {
        print("LOG - 2e req echouée !! ".toUpperCase());
      }
    } else {
      print("LOG - 1e req echouée !!".toUpperCase());
    }
  }


  //
}
