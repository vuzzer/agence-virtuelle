class Notif {
  int? id;
  String? libelle, description, date;

  Notif.fromJson(Map<String, dynamic> json) {
    this.id = json["id"];
    this.libelle = json["libelle"];
    this.description = json["description"];
    this.date = json["created_at"].split('T')[0]; 
  }
}
