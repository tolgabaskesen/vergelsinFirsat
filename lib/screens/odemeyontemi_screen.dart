import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/classes/kartbilgileri.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';
import 'package:vergelsinfirsat/widgets/odeme_kart.dart';

class OdemeYontemiScreen extends StatefulWidget {
  const OdemeYontemiScreen({Key? key}) : super(key: key);

  @override
  _OdemeYontemiScreenState createState() => _OdemeYontemiScreenState();
}

class _OdemeYontemiScreenState extends State<OdemeYontemiScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: genelAppBar(context, "Ödeme Yöntemlerim"),
      body: SingleChildScrollView(
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
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/jsonlar/kartbilgileri.json"),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final kartbilgileri =
                          kartBilgileriFromJson(snapshot.data.toString());

                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: kartbilgileri.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: size.height * 0.097,
                              child: GestureDetector(
                                onTap: () {
                                  //Bu kısımda api isteği olacak onaylı kartı değiştirmek için
                                },
                                child: OdemeKart(
                                    isvisa: kartbilgileri[index].isVisa,
                                    isSelected: kartbilgileri[index].isselected,
                                    title: kartbilgileri[index].title,
                                    number: kartbilgileri[index].number),
                              ),
                            );
                          });
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
              child: kartEkle(context),
            ),
            SizedBox(
              height: size.height * 0.12,
            )
          ],
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }

  Widget kartEkle(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.090,
      child: GestureDetector(
        onTap: () {
          //Bu kısımda kart ekle formu çıkacak
        },
        child: Card(
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.add_box_rounded,
                  color: anaRenkKoyu,
                  size: 30,
                ),
              ),
              Text(
                "Kredi / Banka Kartı Ekle",
                style: TextStyle(
                    color: anaRenkKoyu,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              )
            ],
          ),
        ),
      ),
    );
  }
}
