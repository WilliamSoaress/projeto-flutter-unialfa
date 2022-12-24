import 'dart:convert';

import '../api/api_constants.dart';

List<Teams> teamModelFromJson(String str) =>
    List<Teams>.from(json.decode(str).map((x) => Teams.fromJson(x)));

String teamModelToJson(List<Teams> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Teams {
  int id;
  String name;
  String flag;
  String linkImage;

  Teams({
    required this.id,
    required this.name,
    required this.flag,
    required this.linkImage
  });

  factory Teams.fromJson(Map<String, dynamic> json) => Teams(
        id: json["Tim_Codigo"],
        name: json["Tim_Nome"],
        flag: json["Tim_Bandeira"],
        linkImage: '${ApiConstants.url}${json["Tim_Bandeira"].replaceFirst("~", "")}'
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "flag": flag,
        "linkImage": linkImage
      };
}
