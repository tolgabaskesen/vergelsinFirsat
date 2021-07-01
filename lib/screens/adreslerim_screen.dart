

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:vergelsinfirsat/classes/adreslerim.dart';

import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';
import 'package:vergelsinfirsat/widgets/adres_kart.dart';

class AdreslerimScreen extends StatefulWidget {
  const AdreslerimScreen({Key? key}) : super(key: key);

  @override
  _AdreslerimScreenState createState() => _AdreslerimScreenState();
}

class _AdreslerimScreenState extends State<AdreslerimScreen> {
  late List<Adreslerim> adresler;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: genelAppBar(context, "Adreslerim"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: 8, right: 8),
                height: size.height * 0.07,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                      bottomRight: Radius.circular(10),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icons/profilephoto.png"),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text("Miraç Yıldırım",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ],
                      ),
                      GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(
                              top: size.height * 0.015,
                              bottom: size.height * 0.015),
                          decoration: BoxDecoration(
                              color: ikincilRenk,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(100))),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: AutoSizeText(
                              "Hesabıma Dön",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/jsonlar/adres.json"),
                  builder: (context, snapshot) {
                    //log(snapshot.connectionState.toString());
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final adresler =
                          adreslerimFromJson(snapshot.data.toString());

                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: adresler.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                //Bu kısımda adresi değiştiren api isteği olacak
                              },
                              child: Adres(
                                  tipi: adresler[index].title,
                                  adresi: adresler[index].adres,
                                  kontrol: adresler[index].isselected) ,
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Yeni Adres Ekle",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              evekle(context),
              isekle(context),
              SizedBox(
                height: size.height * 0.12,
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

  Widget evekle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/adres/house.png"),
                ),
                Text("Ev Adresi Ekle"),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_box,
                  color: anaRenkKoyu,
                )),
          ],
        ),
      ),
    );
  }

  Widget isekle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/adres/work.png"),
                ),
                Text("İş Adresi Ekle"),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_box,
                  color: anaRenkKoyu,
                )),
          ],
        ),
      ),
    );
  }
}

Widget adresKart(
    String tipi, String adresi, bool kontrol, BuildContext context) {
  return Card(
    child: Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(tipi == "İŞ ADRESİ"
              ? "assets/adres/work.png"
              : "assets/adres/house.png"),
        ),
        Expanded(
          child: ListTile(
            title: Text(
              tipi,
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 15,
                  fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              adresi,
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            trailing: kontrol == false
                ? Icon(Icons.delete)
                : Icon(
                    Icons.check_circle,
                    color: ikincilRenk,
                  ),
          ),
        )
      ],
    ),
  );
}
