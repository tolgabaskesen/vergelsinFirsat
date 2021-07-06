// To parse this JSON data, do
//
//     final kategoriModel = kategoriModelFromJson(jsonString);

import 'dart:convert';

List<KategoriModel> kategoriModelFromJson(String str) => List<KategoriModel>.from(json.decode(str).map((x) => KategoriModel.fromJson(x)));

String kategoriModelToJson(List<KategoriModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class KategoriModel {
    KategoriModel({
        required this.ikon,
        required this.adi,
    });

    String ikon;
    String adi;

    factory KategoriModel.fromJson(Map<String, dynamic> json) => KategoriModel(
        ikon: json["ikon"],
        adi: json["adi"],
    );

    Map<String, dynamic> toJson() => {
        "ikon": ikon,
        "adi": adi,
    };
}
