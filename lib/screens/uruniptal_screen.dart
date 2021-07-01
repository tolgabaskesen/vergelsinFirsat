import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class UrunIptali extends StatefulWidget {
  UrunIptali({Key? key}) : super(key: key);

  @override
  _UrunIptaliState createState() => _UrunIptaliState();
}

class _UrunIptaliState extends State<UrunIptali> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: genelAppBar(context, "İptal, İade, Değişim"),
        bottomSheet: navSheet(context),
        body: SingleChildScrollView(
          child: Container(
            child: Column(
              children: [
                Container(
                  height: size.height * 0.07,
                  child: TabBar(
                    labelColor: Colors.black,
                    indicatorColor: ikincilRenk,
                    unselectedLabelColor: Colors.grey,
                    tabs: [
                      Tab(
                        text: "Ürün İptali",
                      ),
                      Tab(
                        text: "Ürün İadesi",
                      ),
                      Tab(
                        text: "Ürün Değişimi",
                      ),
                    ],
                  ),
                ),
                Container(
                  color: arkaplanRenk,
                  height: size.height * 0.8,
                  child: TabBarView(children: [
                    iptal(context),
                    iptal(context),
                    iptal(context)
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget iptal(BuildContext context) {
  Size size = MediaQuery.of(context).size;

  return SingleChildScrollView(
    child: Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bilgiKutusu(context, "talepolustur", "Talep Oluştur"),
              bilgiKutusu(context, "talepincele", "Talep İncelensin"),
            ],
          ),
          SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              bilgiKutusu(context, "onaylansin", "Onaylansın"),
              bilgiKutusu(context, "tamamlansin", "Tamamlansın"),
            ],
          ),
          Container(
            color: Colors.white,
            margin: EdgeInsets.all(18),
            child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: AutoSizeText("What is Lorem Ipsum?"),
                  subtitle: AutoSizeText(
                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                  ),
                )),
          ),
          SizedBox(height: size.height * 0.1),
        ],
      ),
    ),
  );
}

Widget bilgiKutusu(BuildContext context, String resim, String metin) {
  Size size = MediaQuery.of(context).size;
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(12),
    width: size.width * 0.4,
    height: size.height * 0.3,
    color: Colors.white,
    alignment: Alignment.center,
    child: Column(
      children: [
        Container(
          height: size.height * 0.1,
          width: size.height * 0.1,
          child: Image.asset("assets/iptalscreen/$resim.png"),
        ),
        Container(
          height: size.height * 0.15,
          width: size.width * 0.35,
          child: ListTile(
            title: AutoSizeText(
              metin,
              textAlign: TextAlign.center,
              maxLines: 1,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: AutoSizeText(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
              textAlign: TextAlign.center,
              minFontSize: 7,
              maxFontSize: 11,
            ),
          ),
        )
      ],
    ),
  );
}
