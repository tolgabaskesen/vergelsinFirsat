// To parse this JSON data, do
//
//     final kartBilgileri = kartBilgileriFromJson(jsonString);

import 'dart:convert';

List<KartBilgileri> kartBilgileriFromJson(String str) => List<KartBilgileri>.from(json.decode(str).map((x) => KartBilgileri.fromJson(x)));

String kartBilgileriToJson(List<KartBilgileri> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KartBilgileri {
    KartBilgileri({
        required this.title,
        required this.number,
        required this.isselected,
        required this.isVisa,
    });

    String title;
    String number;
    bool isselected;
    bool isVisa;

    factory KartBilgileri.fromJson(Map<String, dynamic> json) => KartBilgileri(
        title: json["title"],
        number: json["number"],
        isselected: json["isselected"],
        isVisa: json["isVisa"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "number": number,
        "isselected": isselected,
        "isVisa": isVisa,
    };
}
