// To parse this JSON data, do
//
//     final populerAramalar = populerAramalarFromJson(jsonString);

import 'dart:convert';

List<PopulerAramalar> populerAramalarFromJson(String str) => List<PopulerAramalar>.from(json.decode(str).map((x) => PopulerAramalar.fromJson(x)));

String populerAramalarToJson(List<PopulerAramalar> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class PopulerAramalar {
    PopulerAramalar({
        required this.adi,
    });

    String adi;

    factory PopulerAramalar.fromJson(Map<String, dynamic> json) => PopulerAramalar(
        adi: json["adi"],
    );

    Map<String, dynamic> toJson() => {
        "adi": adi,
    };
}
