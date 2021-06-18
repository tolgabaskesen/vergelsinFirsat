import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: genelAppBar(context, "Hesabım"),
      bottomSheet: navSheet(context),
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height * 0.9,
          color: arkaplanRenk,
          alignment: Alignment.center,
          child: Column(
            children: [
              profileButtons("Siparişlerim", FontAwesomeIcons.shoppingBag, () {
                print("1");
              }),
              profileButtons("Üyelik Bilgilerim", FontAwesomeIcons.user, () {
                print("1");
              }),
              profileButtons("Adreslerim", FontAwesomeIcons.mapMarkedAlt, () {
                print("3");
              }),
              profileButtons("Kredi Kartlarım", FontAwesomeIcons.creditCard,
                  () {
                print("2");
              }),
              profileButtons("Tedarikçi Panelim", FontAwesomeIcons.handshake,
                  () {
                print("5");
              }),
              profileButtons("Hakkımızda", FontAwesomeIcons.hands, () {
                print("6");
              }),
              profileButtons("İletişim", FontAwesomeIcons.comment, () {
                print("7");
              }),
              profileButtons("Yardım", FontAwesomeIcons.heart, () {
                print("8");
              }),
              profileButtons("Çıkış", FontAwesomeIcons.signOutAlt, () {
                print("9");
              }),
              Container(
                alignment: Alignment.center,
                width: size.width,
                child: Row(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(width: size.width * 0.2),
                    socialIcons("assets/social/faceSiyah.png", () {}),
                    socialIcons("assets/social/twitSiyah.png", () {}),
                    socialIcons("assets/social/linkedSiyah.png", () {}),
                    socialIcons("assets/social/youtubeSiyah.png", () {}),
                    socialIcons("assets/social/instaSiyah.png", () {}),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.1)
            ],
          ),
        ),
      ),
    );
  }

  Widget socialIcons(String resim, void Function()? func) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, right: 8.0, top: 8.0),
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          width: size.width * 0.1,
          height: size.width * 0.1,
          child: Image.asset(resim),
        ),
      ),
    );
  }

  Widget profileButtons(String text, IconData icon, void Function()? func) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
      child: GestureDetector(
        child: Container(
          color: Colors.white,
          width: size.width,
          height: size.height * 0.06,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 8),
                    width: size.width * 0.1,
                    child: FaIcon(
                      icon,
                      color: anaRenkKoyu,
                      size: size.width * 0.04,
                    ),
                  ),
                  AutoSizeText(
                    text,
                  ),
                ],
              ),
              Icon(Icons.keyboard_arrow_right_outlined),
            ],
          ),
        ),
        onTap: func,
      ),
    );
  }
}
