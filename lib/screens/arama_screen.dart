import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/classes/indirimliurun.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class AramaScreen extends StatefulWidget {
  const AramaScreen({Key? key}) : super(key: key);

  @override
  _AramaScreenState createState() => _AramaScreenState();
}

class _AramaScreenState extends State<AramaScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Arama"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              sonuc(context, "Yağ", "10.000"),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  color: arkaplanRenk,
                  height: size.height * 0.06,
                  child: TabBar(
                    isScrollable: true,
                    labelColor: Colors.white,
                    indicatorColor: anaRenkKoyu,
                    unselectedLabelColor: Colors.black,
                    dragStartBehavior: DragStartBehavior.start,
                    indicator: BoxDecoration(
                        color: anaRenkKoyu,
                        borderRadius: BorderRadius.circular(5)),
                    tabs: [
                      Tab(
                        text: "Lorem Ipsum",
                      ),
                      Tab(
                        text: "Lorem Ipsum",
                      ),
                      Tab(
                        text: "Lorem Ipsum",
                      ),
                      Tab(
                        text: "Lorem Ipsum",
                      ),
                      Tab(
                        text: "Lorem Ipsum",
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: size.height * 0.05,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //Bu kısıma filtre widget gelecek
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.segment_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            "Filtrele",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: VerticalDivider(
                        color: Colors.grey,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        //Bu kısıma filtre widget gelecek
                      },
                      child: Row(
                        children: [
                          Icon(
                            Icons.unfold_more_sharp,
                            color: Colors.grey,
                          ),
                          Text(
                            "Sırala",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                  color: arkaplanRenk,
                  height: size.height * 0.57,
                  child: TabBarView(children: [
                    urunler(context),
                    urunler(context),
                    urunler(context),
                    urunler(context),
                    urunler(context),
                  ])),
            ],
          ),
        ),
        bottomSheet: navSheet(context),
      ),
    );
  }

  Widget urunler(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height * 0.9);
    final double itemWidth = size.width / 2;
    return Container(
        color: arkaplanRenk,
        height: size.height * 0.57,
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/jsonlar/indirimli_urun.json"),
            builder: (context, snapshot) {
              //log(snapshot.connectionState.toString());
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final indirimliUrun =
                    indirimliUrunFromJson(snapshot.data.toString());

                return GridView.count(
                  crossAxisCount: 3,
                  childAspectRatio: (itemWidth * 1.2 / itemHeight),
                  children: List.generate(indirimliUrun.length, (index) {
                    return urun(
                        context,
                        indirimliUrun[index].indirimMiktar,
                        indirimliUrun[index].indirimOran,
                        indirimliUrun[index].urun,
                        indirimliUrun[index].urunAdi,
                        indirimliUrun[index].indirimsizFiyat,
                        indirimliUrun[index].indirimliFiyat,
                        indirimliUrun[index].isoy);
                  }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  Widget sonuc(BuildContext context, String urun, String adet) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.07,
      child: RichText(
        text: TextSpan(
            text: "$urun",
            style: TextStyle(color: Colors.blue),
            children: [
              TextSpan(
                text: " ile ilgili ",
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: "+$adet ",
                style: TextStyle(color: Colors.blue),
              ),
              TextSpan(
                text: "ürün bulduk. ",
                style: TextStyle(color: Colors.black),
              ),
            ]),
      ),
    );
  }

  Widget haber(BuildContext context, String adi, String asset, String tarih) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Container(
          color: Colors.white,
          height: size.height * 0.28,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                  height: size.height * 0.1,
                  width: size.width * 0.2,
                  child: Image.asset(asset)),
              Column(
                children: [
                  Text(
                    adi,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(tarih,
                      style: TextStyle(fontSize: 10, color: Colors.grey)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget urun(BuildContext context, String miktar, String oran, String urun,
      String adi, String indirimsizmiktar, String indrimlimiktar, bool isoy) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(4),
                      bottomRight: Radius.circular(4)),
                  color: anaRenkKoyu),
              child: Text(
                "$miktar TL İndirim",
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
              children: [
                Text(
                  "%$oran",
                  style: TextStyle(
                      color: ikincilRenk, fontWeight: FontWeight.bold),
                ),
                Container(
                  height: size.height * 0.18,
                  width: size.width * 0.25,
                  child: Image.asset(
                    urun,
                    fit: BoxFit.fill,
                  ),
                )
              ],
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  "    $adi",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            Column(
              children: [
                Text(
                  "$indirimsizmiktar TL",
                  style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey),
                ),
                Text(
                  "$indrimlimiktar TL",
                  style: TextStyle(
                      color: anaRenkKoyu,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: isoy ? Colors.blueGrey[900] : ikincilRenk),
                onPressed: () {
                  //Bu kısımda api isteği olacak
                },
                child: Text(
                  isoy ? "OY VERDİNİZ" : "FIRSATA OY VER",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ))
          ],
        ),
      ),
    );
  }
}
