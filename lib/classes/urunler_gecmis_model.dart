// To parse this JSON data, do
//
//     final urunlerGecmis = urunlerGecmisFromJson(jsonString);

import 'dart:convert';

List<UrunlerGecmis> urunlerGecmisFromJson(String str) => List<UrunlerGecmis>.from(json.decode(str).map((x) => UrunlerGecmis.fromJson(x)));

String urunlerGecmisToJson(List<UrunlerGecmis> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UrunlerGecmis {
    UrunlerGecmis({
        required this.adi,
        required this.tarih,
    });

    String adi;
    String tarih;

    factory UrunlerGecmis.fromJson(Map<String, dynamic> json) => UrunlerGecmis(
        adi: json["adi"],
        tarih: json["tarih"],
    );

    Map<String, dynamic> toJson() => {
        "adi": adi,
        "tarih": tarih,
    };
}
