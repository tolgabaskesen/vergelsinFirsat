import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:vergelsinfirsat/provider/renkNotifier.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class DenemeScreen extends StatefulWidget {
  DenemeScreen({Key? key}) : super(key: key);

  @override
  _DenemeScreenState createState() => _DenemeScreenState();
}

class _DenemeScreenState extends State<DenemeScreen> {
  Color color1 = Colors.black54;
  Color color2 = Colors.black54;
  Color color3 = Colors.black54;
  Color color4 = Colors.black54;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genelAppBar(context, "Deneme"),
      body: Container(
        color: arkaplanRenk,
      ),
      bottomSheet: navSheet(context),
    );
  }
}

Widget navSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Consumer<RenkNotifier>(builder: (context, renk, child) {
    var renkProvider = Provider.of<RenkNotifier>(context, listen: false);
    return new Container(
      width: size.width,
      height: size.height * 0.15,
      alignment: Alignment.bottomCenter,
      color: Colors.transparent,
      child: Stack(
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
              top: size.height * 0.05,
            ),
            width: size.width,
            height: size.height * 0.09,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: anaRenk,
                  offset: Offset(0.0, 0.5), //(x,y)
                  blurRadius: 1.0,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: size.height * 0.1,
                      child: IconButton(
                        onPressed: () {
                          renkProvider.setColor(1);
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.home,
                          color: renkProvider.bottomColor1,
                        ),
                        iconSize: 20,
                      ),
                    ),
                    Container(
                      height: size.height * 0.02,
                      width: size.height * 0.1,
                      child: AutoSizeText(
                        "Anasayfa",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: renkProvider.bottomColor1,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: size.height * 0.1,
                      child: IconButton(
                        onPressed: () {
                          renkProvider.setColor(2);
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.star,
                          color: renkProvider.bottomColor2,
                        ),
                        iconSize: 20,
                      ),
                    ),
                    Container(
                      height: size.height * 0.02,
                      width: size.height * 0.1,
                      child: AutoSizeText(
                        "Fırsatlar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: renkProvider.bottomColor2,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  height: size.height * 0.1,
                  width: size.height * 0.1,
                ),
                Column(
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: size.height * 0.1,
                      child: IconButton(
                        onPressed: () {
                          renkProvider.setColor(3);
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.search,
                          color: renkProvider.bottomColor3,
                        ),
                        iconSize: 20,
                      ),
                    ),
                    Container(
                      height: size.height * 0.02,
                      width: size.height * 0.1,
                      child: AutoSizeText(
                        "Arama",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: renkProvider.bottomColor3,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Container(
                      height: size.height * 0.05,
                      width: size.height * 0.1,
                      child: IconButton(
                        onPressed: () {
                          renkProvider.setColor(4);
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.cog,
                          color: renkProvider.bottomColor4,
                        ),
                        iconSize: 20,
                      ),
                    ),
                    Container(
                      height: size.height * 0.02,
                      width: size.height * 0.1,
                      child: AutoSizeText(
                        "Ayarlar",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: renkProvider.bottomColor4,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
              alignment: Alignment.center,
              height: size.width * 0.2,
              width: size.width * 0.2,
              margin: EdgeInsets.only(
                left: size.width * 0.40,
              ),
              decoration: BoxDecoration(
                color: arkaplanRenk,
                borderRadius: BorderRadius.all(Radius.circular(100)),
              ),
              child: Container(
                alignment: Alignment.center,
                height: size.width * 0.17,
                width: size.width * 0.17,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                ),
                child: GestureDetector(
                  onTap: () => print("tolga"),
                  child: Image.asset("assets/bottom_bar_icon.png"),
                ),
              )),
        ],
      ),
    );
  });
}

PreferredSizeWidget? genelAppBar(BuildContext context, String title) {
  Size size = MediaQuery.of(context).size;
  return AppBar(
    backgroundColor: anaRenkKoyu,
    title: Text(
      title,
      style: TextStyle(fontWeight: FontWeight.bold),
    ),
    centerTitle: true,
    actions: [
      GestureDetector(
        child: Container(
          child: Stack(
            children: [
              Container(
                width: size.width * 0.15,
                height: size.height * 0.1,
                margin: EdgeInsets.only(
                    top: size.height * 0.01,
                    bottom: size.height * 0.01,
                    left: size.width * 0.05),
                decoration: BoxDecoration(
                    color: ikincilRenk,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: size.width * 0.04,
                      ),
                      Icon(
                        Icons.shopping_bag_outlined,
                        size: size.width * 0.07,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                width: size.height * 0.03,
                height: size.height * 0.03,
                margin: EdgeInsets.only(
                    top: size.height * 0.028,
                    bottom: size.height * 0.01,
                    left: size.width * 0.05),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(100),
                    )),
                child: Text(
                  "0",
                  style: TextStyle(color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
