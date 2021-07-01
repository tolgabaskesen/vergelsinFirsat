// To parse this JSON data, do
//
//     final sorular = sorularFromJson(jsonString);

import 'dart:convert';

List<Sorular> sorularFromJson(String str) => List<Sorular>.from(json.decode(str).map((x) => Sorular.fromJson(x)));

String sorularToJson(List<Sorular> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Sorular {
    Sorular({
        required this.soru,
        required this.cevap,
    });

    String soru;
    String cevap;

    factory Sorular.fromJson(Map<String, dynamic> json) => Sorular(
        soru: json["soru"],
        cevap: json["cevap"],
    );

    Map<String, dynamic> toJson() => {
        "soru": soru,
        "cevap": cevap,
    };
}
