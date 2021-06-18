import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class IletisimTercihleri extends StatefulWidget {
  IletisimTercihleri({Key? key}) : super(key: key);

  @override
  _IletisimTercihleriState createState() => _IletisimTercihleriState();
}

class _IletisimTercihleriState extends State<IletisimTercihleri> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: genelAppBar(context, "İletişim Tercihleri"),
      bottomSheet: navSheet(context),
      body: Container(
        height: size.height,
        width: size.width,
        color: arkaplanRenk,
        child: Column(
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
                          child: AutoSizeText("Miraç Yıldırım",
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
                    ),
                  ],
                ),
              ),
            ),
            switchItem(
              "E-Posta",
              "Kampanyalarla ilgili e-posta almak istiyorum.",
              () {},
            ),
            switchItem(
              "E-Posta",
              "Kampanyalarla ilgili e-posta almak istiyorum.",
              () {},
            ),
            switchItem(
              "E-Posta",
              "Kampanyalarla ilgili e-posta almak istiyorum.",
              () {},
            ),
            switchItem(
              "E-Posta",
              "Kampanyalarla ilgili e-posta almak istiyorum.",
              () {},
            ),
          ],
        ),
      ),
    );
  }

  bool isSwitched = false;
  Widget switchItem(String baslik, String altmetin, void Function()? func) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.all(8.0),
      width: size.width,
      height: size.height * 0.1,
      color: Colors.white,
      child: ListTile(
        title: AutoSizeText(baslik),
        subtitle: AutoSizeText(
          altmetin,
          maxLines: 1,
        ),
        trailing: Switch(
          value: isSwitched,
          onChanged: toggleSwitch,
          activeColor: ikincilRenk,
        ),
      ),
    );
  }

  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
      });
      print('Switch Button is ON');
    } else {
      setState(() {
        isSwitched = false;
      });
      print('Switch Button is OFF');
    }
  }
}
