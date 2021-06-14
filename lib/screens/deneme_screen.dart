import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class DenemeScreen extends StatefulWidget {
  DenemeScreen({Key? key}) : super(key: key);

  @override
  _DenemeScreenState createState() => _DenemeScreenState();
}

class _DenemeScreenState extends State<DenemeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genelAppBar(context, "Deneme"),
      body: Container(),
      bottomSheet: navSheet(context),
    );
  }
}

Widget navSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return Container(
    width: size.width,
    height: size.height * 0.12,
    color: Colors.transparent,
    alignment: Alignment.bottomCenter,
    child: Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          margin: EdgeInsets.only(
            top: size.height * 0.05,
          ),
          width: size.width,
          height: size.height * 0.07,
          color: anaRenk,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.home,
                    color: bottomIconColor,
                  )),
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.search,
                    color: bottomIconColor,
                  )),
              Container(
                height: size.height * 0.1,
                width: size.height * 0.1,
              ),
              IconButton(
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.shoppingCart,
                    color: bottomIconColor,
                  )),
              IconButton(
                  splashColor: bottomIconColor,
                  onPressed: () {},
                  icon: FaIcon(
                    FontAwesomeIcons.ellipsisH,
                    color: bottomIconColor,
                  )),
            ],
          ),
        ),
        Container(
            alignment: Alignment.center,
            height: size.width * 0.22,
            width: size.width * 0.22,
            margin: EdgeInsets.only(
              left: size.width * 0.39,
            ),
            decoration: BoxDecoration(
              color: arkaplanRenk,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            child: GestureDetector(
              onTap: () => print("tolga"),
              child: Image.asset("assets/bottom_bar_icon.png"),
            )),
      ],
    ),
  );
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
          width: size.width * 0.2,
          margin: EdgeInsets.only(
              top: size.height * 0.02, bottom: size.height * 0.02),
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
                Icon(
                  Icons.shopping_bag_rounded,
                  size: size.width * 0.04,
                ),
                Text(
                  "500.00₺",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
      )
    ],
  );
}
