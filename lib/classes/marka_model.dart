// To parse this JSON data, do
//
//     final markaModel = markaModelFromJson(jsonString);

import 'dart:convert';

MarkaModel markaModelFromJson(String str) => MarkaModel.fromJson(json.decode(str));

String markaModelToJson(MarkaModel data) => json.encode(data.toJson());

class MarkaModel {
    MarkaModel({
        required this.a,
        required this.b,
        required this.c,
    });

    List<A> a;
    List<A> b;
    List<A> c;

    factory MarkaModel.fromJson(Map<String, dynamic> json) => MarkaModel(
        a: List<A>.from(json["A"].map((x) => A.fromJson(x))),
        b: List<A>.from(json["B"].map((x) => A.fromJson(x))),
        c: List<A>.from(json["C"].map((x) => A.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "A": List<dynamic>.from(a.map((x) => x.toJson())),
        "B": List<dynamic>.from(b.map((x) => x.toJson())),
        "C": List<dynamic>.from(c.map((x) => x.toJson())),
    };
}

class A {
    A({
        required this.marka,
        required this.adet,
    });

    String marka;
    String adet;

    factory A.fromJson(Map<String, dynamic> json) => A(
        marka: json["marka"],
        adet: json["adet"],
    );

    Map<String, dynamic> toJson() => {
        "marka": marka,
        "adet": adet,
    };
}
