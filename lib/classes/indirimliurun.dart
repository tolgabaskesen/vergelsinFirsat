// To parse this JSON data, do
//
//     final indirimliUrun = indirimliUrunFromJson(jsonString);

import 'dart:convert';

List<IndirimliUrun> indirimliUrunFromJson(String str) => List<IndirimliUrun>.from(json.decode(str).map((x) => IndirimliUrun.fromJson(x)));

String indirimliUrunToJson(List<IndirimliUrun> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class IndirimliUrun {
    IndirimliUrun({
        required this.indirimMiktar,
        required this.indirimOran,
        required this.urun,
        required this.urunAdi,
        required this.indirimsizFiyat,
        required this.indirimliFiyat,
        required this.isoy,
    });

    String indirimMiktar;
    String indirimOran;
    String urun;
    String urunAdi;
    String indirimsizFiyat;
    String indirimliFiyat;
    bool isoy;

    factory IndirimliUrun.fromJson(Map<String, dynamic> json) => IndirimliUrun(
        indirimMiktar: json["indirim_miktarı"],
        indirimOran: json["indirim_oran"],
        urun: json["urun"],
        urunAdi: json["urun_adi"],
        indirimsizFiyat: json["indirimsiz_fiyat"],
        indirimliFiyat: json["indirimli_fiyat"],
        isoy: json["isoy"],
    );

    Map<String, dynamic> toJson() => {
        "indirim_miktarı": indirimMiktar,
        "indirim_oran": indirimOran,
        "urun": urun,
        "urun_adi": urunAdi,
        "indirimsiz_fiyat": indirimsizFiyat,
        "indirimli_fiyat": indirimliFiyat,
        "isoy": isoy,
    };
}
