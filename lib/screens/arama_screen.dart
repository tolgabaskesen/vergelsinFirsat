import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

    return Scaffold(
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
                child: DefaultTabController(
                  length: 5,
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
                height: size.height * 0.6,
                child: GridView.count(
                 
                  crossAxisCount: 3,
                  primary: false,
                  padding: EdgeInsets.all(4),
                  children: <Widget>[
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                    haber(context, "Hürriyet", "assets/adres/gazete.jpg",
                        "11.02.2021"),
                  ],
                )),
          ],
        ),
      ),
      bottomSheet: navSheet(context),
    );
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
}
