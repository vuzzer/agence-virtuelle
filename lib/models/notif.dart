class Notif {
  int? id;
  String? titre, motif, statut, date;

  Notif.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.titre = json["titre"];
    this.motif = json["motif"];
    this.statut = json["statut"];
    this.date = json["date"];
  }
}
