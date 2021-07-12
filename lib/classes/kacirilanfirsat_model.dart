// To parse this JSON data, do
//
//     final kacirilanFirsatJson = kacirilanFirsatJsonFromJson(jsonString);

import 'dart:convert';

List<KacirilanFirsatJson> kacirilanFirsatJsonFromJson(String str) =>
    List<KacirilanFirsatJson>.from(
        json.decode(str).map((x) => KacirilanFirsatJson.fromJson(x)));

String kacirilanFirsatJsonToJson(List<KacirilanFirsatJson> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KacirilanFirsatJson {
  KacirilanFirsatJson({
    required this.urun,
    required this.yuzde,
    required this.urunAdi,
    required this.satisFiyati,
    required this.isoy,
  });

  String urun;
  double yuzde;
  String urunAdi;
  String satisFiyati;
  bool isoy;

  factory KacirilanFirsatJson.fromJson(Map<String, dynamic> json) =>
      KacirilanFirsatJson(
        urun: json["urun"],
        yuzde: json["yuzde"].toDouble(),
        urunAdi: json["urun_adi"],
        satisFiyati: json["satis_fiyati"],
        isoy: json["isoy"],
      );

  Map<String, dynamic> toJson() => {
        "urun": urun,
        "yuzde": yuzde,
        "urun_adi": urunAdi,
        "satis_fiyati": satisFiyati,
        "isoy": isoy,
      };
}
