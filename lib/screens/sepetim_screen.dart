import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class SepetimScreen extends StatefulWidget {
  SepetimScreen({Key? key}) : super(key: key);

  @override
  _SepetimScreenState createState() => _SepetimScreenState();
}

class _SepetimScreenState extends State<SepetimScreen> {
  int index = 0;
  int _current = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomSheet: navSheet(context),
      appBar: genelAppBar(context, "Sepetim"),
      body: SingleChildScrollView(
        child: Container(
          color: arkaplanRenk,
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(8),
                height: size.height * 0.08,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Row(
                  children: [
                    FaIcon(
                      FontAwesomeIcons.truckMoving,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: size.height * 0.05,
                      width: size.width * 0.7,
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "100 TL VE ÜZERİ KARGO BEDAVA!",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          AutoSizeText(
                            "Sepetinize 61.00 TL'lik ürün daha ekleyin kargo bedava olsun.",
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.02),
              sepettekiUrun(context, "kilo"),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              sepettekiUrun(context, "adet"),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              sepettekiUrun(context, "stoktayok"),
              Divider(
                color: Colors.grey,
                thickness: 1,
              ),
              sepettekiUrun(context, "satisakapali"),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.08,
                width: size.width,
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * 0.70,
                        alignment: Alignment.center,
                        child: AutoSizeText(
                          "DEVAM",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.05,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        width: size.width * 0.25,
                        alignment: Alignment.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: size.height * 0.02,
                              child: AutoSizeText(
                                "99.99 TL",
                                style: TextStyle(
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.grey,
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.center,
                              height: size.height * 0.05,
                              child: AutoSizeText(
                                "777.77 TL",
                                style: TextStyle(
                                  color: anaRenk,
                                  fontWeight: FontWeight.bold,
                                  fontSize: size.height * 0.025,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.all(0),
                    elevation: 2,
                    primary: anaRenk,
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Container(
                height: size.height * 0.25,
                width: size.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    initialPage: 0,
                    /* onPageChanged: () {
                      setState(() {
                        _current = index;
                      });
                    }, */
                    autoPlay: false,
                    aspectRatio: 2.0,
                    enlargeCenterPage: true,
                  ),
                  items: [
                    altCatalog(),
                    altCatalog(),
                    altCatalog(),
                    altCatalog(),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.15,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget altCatalog() {
    return Container();
  }

  Widget sepettekiUrun(BuildContext context, String tur) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.12,
      child: Row(
        children: [
          Container(
            width: size.width * 0.72,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  height: size.width * 0.17,
                  width: size.width * 0.17,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Colors.white,
                  ),
                  child: Image.asset("assets/food/sogan.png"),
                ),
                SizedBox(width: size.width * 0.05),
                Container(
                  height: size.width * 0.17,
                  width: size.width * 0.45,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AutoSizeText(
                        "Patates",
                        maxLines: 1,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AutoSizeText(
                            "Ek Bilgiler Buraya Gelecek",
                            maxLines: 1,
                            style: TextStyle(),
                          ),
                          AutoSizeText(
                            "14 Ekim Pazartesi Günü Kargoda",
                            style: TextStyle(color: Colors.grey),
                            maxLines: 1,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          buttonWidget(context, tur),
        ],
      ),
    );
  }

  int sayi = 1;
  int sayi2 = 1;
  Widget buttonWidget(BuildContext context, String tur) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 0.23,
      height: size.height * 0.07,
      child: (tur == "kilo")
          ? Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        (sayi > 0) ? sayi-- : null;
                        print(sayi);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width * 0.05,
                      height: size.height * 0.05,
                      child: FaIcon(
                        FontAwesomeIcons.minus,
                        size: 15,
                      ),
                    ),
                  ),
                  Container(
                    width: size.width * 0.12,
                    height: size.height * 0.07,
                    alignment: Alignment.center,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          sayi.toString(),
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Kilo",
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        sayi = sayi + 1;
                        print(sayi);
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: size.width * 0.05,
                      height: size.height * 0.05,
                      child: FaIcon(
                        FontAwesomeIcons.plus,
                        size: 15,
                      ),
                    ),
                  ),
                ],
              ),
            )
          : (tur == "adet")
              ? Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            (sayi2 > 0) ? sayi2-- : null;
                            print(sayi);
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * 0.05,
                          height: size.height * 0.05,
                          child: FaIcon(
                            FontAwesomeIcons.minus,
                            size: 15,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * 0.12,
                        height: size.height * 0.07,
                        alignment: Alignment.center,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              sayi2.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Adet",
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            sayi2 = sayi2 + 1;
                            print(sayi);
                          });
                        },
                        child: Container(
                          alignment: Alignment.center,
                          width: size.width * 0.05,
                          height: size.height * 0.05,
                          child: FaIcon(
                            FontAwesomeIcons.plus,
                            size: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : (tur == "stoktayok")
                  ? Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.black,
                      ),
                      child: AutoSizeText(
                        "STOKTA YOK",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ))
                  : Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Colors.grey,
                      ),
                      child: AutoSizeText(
                        "SATIŞA KAPALI",
                        maxLines: 1,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
    );
  }
}
