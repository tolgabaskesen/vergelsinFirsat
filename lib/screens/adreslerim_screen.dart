import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';
import 'package:vergelsinfirsat/widgets/adres_kart.dart';

class AdreslerimScreen extends StatefulWidget {
  const AdreslerimScreen({Key? key}) : super(key: key);

  @override
  _AdreslerimScreenState createState() => _AdreslerimScreenState();
}

class _AdreslerimScreenState extends State<AdreslerimScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genelAppBar(context, "Adreslerim"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              kullanici(context, "Miraç Yıldırım"),
              FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/jsonlar/adres.json"),
                builder: (context, snapshot) {
                  var adresler = jsonDecode(snapshot.data.toString());

                  return ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: adresler.length,
                      itemBuilder: (context, index) {
                        return Adres(
                            tipi: adresler[index]["title"],
                            adresi: adresler[index]["adres"]);
                      });
                },
              )
            ],
          ),
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }

  Widget kullanici(BuildContext context, String adi) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.grey,
                ),
              ),
              Text(
                adi,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ikincilRenk, // background

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: () {},
                child: Text("Hesabıma Dön")),
          )
        ],
      ),
    );
  }
}
