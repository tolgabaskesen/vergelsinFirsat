// To parse this JSON data, do
//
//     final adreslerim = adreslerimFromJson(jsonString);

import 'dart:convert';

List<Adreslerim> adreslerimFromJson(String str) => List<Adreslerim>.from(json.decode(str).map((x) => Adreslerim.fromJson(x)));

String adreslerimToJson(List<Adreslerim> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Adreslerim {
    Adreslerim({
        required this.title,
        required this.adres,
    });

    String title;
    String adres;

    factory Adreslerim.fromJson(Map<String, dynamic> json) => Adreslerim(
        title: json["title"],
        adres: json["adres"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "adres": adres,
    };
}