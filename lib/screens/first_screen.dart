import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class FirstScreen extends StatefulWidget {
  FirstScreen({Key? key}) : super(key: key);

  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  bool isLogin = true;
  bool isVisible = true;
  int pageNumber = 0;
  String telefonNo = "123456789";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    width: size.width,
                    height: size.height * 0.4,
                    color: anaRenk,
                  ),
                  Container(
                    width: size.width,
                    height: size.height * 0.6,
                    color: arkaplanRenk,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.15, left: size.width * 0.25),
                child: Container(
                  width: size.width * 0.5,
                  height: size.height * 0.1,
                  child: Image.asset("assets/app_logo.png"),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(top: size.height * 0.30, left: 8, right: 8),
                child: Container(
                  height: size.height * 0.63,
                  width: size.width,
                  //padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                  ),
                  child: SingleChildScrollView(
                                      child: Column(
                      children: [
                        Material(
                          elevation: 5,
                          child: Container(
                            height: size.height * 0.07,
                            width: size.width,
                            color: Colors.white,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: size.height * 0.07,
                                  width: size.width * 0.45,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: size.height * 0.06,
                                        width: size.width * 0.4,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isLogin = true;
                                              print("giriş");
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: size.height * 0.06,
                                            width: size.width * 0.4,
                                            child: Text(
                                              "Giriş Yap",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ),
                                      (isLogin)
                                          ? Divider(
                                              color: anaRenkKoyu,
                                              thickness: 2,
                                              height: 2,
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                                Container(
                                    width: size.width * 0.04,
                                    child: Image.asset(
                                      "assets/icons/two-arrows.png",
                                      fit: BoxFit.fill,
                                    )),
                                Container(
                                  height: size.height * 0.07,
                                  width: size.width * 0.45,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        height: size.height * 0.06,
                                        width: size.width * 0.4,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              isLogin = false;
                                              pageNumber = 0;
                                              print("kayıt");
                                            });
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: size.height * 0.06,
                                            width: size.width * 0.4,
                                            child: Text(
                                              "Kayıt Ol",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: anaRenkKoyu,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ),
                                      ),
                                      (!isLogin)
                                          ? Divider(
                                              color: anaRenkKoyu,
                                              thickness: 2,
                                              height: 2,
                                            )
                                          : Container(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        (isLogin) ? girisYap() : kayitSayfasi(),
                        GestureDetector(
                          onTap: () {
                            print("facebook");
                          },
                          child: Container(
                            width: size.width * 0.9,
                            height: size.height * 0.1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: size.width * 0.44,
                                  height: size.height * 0.07,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: size.width * 0.05,
                                          height: size.width * 0.05,
                                          child: Image.asset(
                                            "assets/social/facebook.png",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                        SizedBox(
                                          width: size.width * 0.02,
                                        ),
                                        AutoSizeText(
                                          "Facebook ile \nKayıt Ol",
                                          textAlign: TextAlign.start,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print("google");
                                  },
                                  child: Container(
                                    width: size.width * 0.44,
                                    height: size.height * 0.07,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey)),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: size.width * 0.05,
                                            height: size.width * 0.05,
                                            child: Image.asset(
                                              "assets/social/google.png",
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.02,
                                          ),
                                          AutoSizeText(
                                            "Google ile \nKayıt Ol",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget girisYap() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        emailField(context, "E-Mail"),
        passField(context, "Şifrenizi buraya yazınız..", isVisible),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 8),
          height: size.height * 0.06,
          width: size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Giriş Yap",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.06),
            ),
            style: ElevatedButton.styleFrom(
              primary: anaRenk,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 2),
          height: size.height * 0.06,
          width: size.width * 0.5,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "Şifremi Unuttum?",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: size.width * 0.03,
                  color: Colors.grey),
            ),
            style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.white,
            ),
          ),
        ),
      ]),
    );
  }

  Widget kayitSayfasi() {
    switch (pageNumber) {
      case 0:
        return kayitOl();
      case 1:
        return dogrulamaYap(telefonNo);
      case 2:
        return kayitOlFinal(telefonNo);
      default:
        return kayitOl();
    }
  }

  Widget kayitOlFinal(String telNo) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
         SizedBox(
          height: size.height * 0.05,
        ), 
        adsoyadField(context, "Ad-Soyad"),
        Container(
          margin: EdgeInsets.all(8),
          height: size.height * 0.06,
          color: Colors.grey[350],
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(left: size.width * 0.04),
            child: Text(
              "+90 " + telNo,
              style: TextStyle(fontSize: size.width * 0.04),
            ),
          ),
        ),
        emailField(context, "E-Mail buray yazınız.."),
        passField(context, "Şifrenizi buraya yazınız..", isVisible),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 8),
          height: size.height * 0.06,
          width: size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {},
            child: Text(
              "KAYIT OL",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.06),
            ),
            style: ElevatedButton.styleFrom(
              primary: anaRenk,
            ),
          ),
        ),
      ]),
    );
  }

  Widget kayitOl() {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: size.height * 0.05),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Kayıt Ol",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.height * 0.027),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Merhaba, Hemen üye olun, \n indirimli alışverişin keyfini çıkarın!",
            style: TextStyle(),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: size.height * 0.05),
        phoneField(context, "5-- --- -- --"),
        SizedBox(height: size.height * 0.02),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 8),
          height: size.height * 0.06,
          width: size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                pageNumber = 1;
                _start = 120;
                startTimer();
              });
            },
            child: Text(
              "İLERİ",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.06),
            ),
            style: ElevatedButton.styleFrom(
              primary: anaRenk,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05),
      ]),
    );
  }

  // ignore: unused_field
  late Timer _timer;
  int _start = 120;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  Widget dogrulamaYap(String telNo) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(children: [
        SizedBox(height: size.height * 0.05),
        Container(
          alignment: Alignment.center,
          child: Text(
            "Doğrulama Yap",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: size.height * 0.027),
          ),
        ),
        SizedBox(height: size.height * 0.01),
        Container(
          padding: EdgeInsets.all(size.height * 0.01),
          alignment: Alignment.center,
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: "Lütfen ",
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: telNo,
                    style: TextStyle(
                        color: anaRenkKoyu, fontWeight: FontWeight.bold)),
                TextSpan(
                    text:
                        "numaralı telefona gönderilen aktivasyon kodunu giriniz.",
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          ),
        ),
        dogrulamaKodu(context),
        Container(
          height: size.height * 0.07,
          width: size.width * 0.8,
          alignment: Alignment.center,
          child: Text(
            "KALAN SÜRE : $_start",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.height * 0.02,
                color: anaRenkKoyu),
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 8, right: 8, top: 8),
          height: size.height * 0.06,
          width: size.width * 0.9,
          child: ElevatedButton(
            onPressed: () {
              print(_pinPutController.text);
              pageNumber = 2;
            },
            child: Text(
              "DOĞRULA",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: size.width * 0.05),
            ),
            style: ElevatedButton.styleFrom(
              primary: anaRenk,
            ),
          ),
        ),
        SizedBox(height: size.height * 0.05),
      ]),
    );
  }

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: ikincilRenk),
      borderRadius: BorderRadius.circular(15.0),
    );
  }

  final TextEditingController _pinPutController = TextEditingController();
  final FocusNode _pinPutFocusNode = FocusNode();

  Widget dogrulamaKodu(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.6,
      child: PinPut(
        fieldsCount: 4,
        onSubmit: (String pin) => print(_pinPutController.text),
        focusNode: _pinPutFocusNode,
        controller: _pinPutController,
        submittedFieldDecoration: _pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(20.0),
        ),
        selectedFieldDecoration: _pinPutDecoration,
        followingFieldDecoration: _pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  String dropdownValue1 = 'TR+90';
  Widget acilirPhone(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(right: 8),
      width: size.width * 0.2,
      height: size.height * 0.06,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DropdownButton<String>(
              value: dropdownValue1,
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.grey),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue1 = newValue!;
                });
              },
              items: <String>['TR+90', 'GE+85']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget passField(BuildContext context, String labelText, bool visible) {
    Size size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: EdgeInsets.all(8),
          height: size.height * 0.06,
          width: size.width * 0.8,
          child: new Theme(
            data: new ThemeData(
              primaryColor: ikincilRenk,
              primaryColorDark: ikincilRenk,
            ),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: new OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Color(0xFFff9600), width: 2)),
                  enabledBorder: new OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  labelText: labelText,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                  )),
              obscureText: visible,
            ),
          ),
        ),
        Container(
          height: size.height * 0.06,
          width: size.width * 0.1,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isVisible = !isVisible;
                print("tolga");
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/icons/visibility.png",
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget phoneField(BuildContext context, String labelText) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(8),
      height: size.height * 0.06,
      width: size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          acilirPhone(context),
          Container(
            height: size.height * 0.06,
            width: size.width * 0.65,
            child: new Theme(
              data: new ThemeData(
                primaryColor: ikincilRenk,
                primaryColorDark: ikincilRenk,
              ),
              child: TextField(
                decoration: InputDecoration(
                    focusedBorder: new OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xFFff9600), width: 2)),
                    enabledBorder: new OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    hintText: labelText,
                    labelStyle: TextStyle(
                      color: Colors.grey,
                    )),
                keyboardType: TextInputType.phone,
                onChanged: (String value) async {
                  setState(() {
                    telefonNo = value;
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget emailField(BuildContext context, String labelText) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(8),
      height: size.height * 0.06,
      child: new Theme(
        data: new ThemeData(
          primaryColor: ikincilRenk,
          primaryColorDark: ikincilRenk,
        ),
        child: TextField(
          decoration: InputDecoration(
              focusedBorder: new OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFff9600), width: 2)),
              enabledBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                color: Colors.grey,
              )),
        ),
      ),
    );
  }

  Widget adsoyadField(BuildContext context, String labelText) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(8),
      height: size.height * 0.06,
      child: new Theme(
        data: new ThemeData(
          primaryColor: ikincilRenk,
          primaryColorDark: ikincilRenk,
        ),
        child: TextField(
          decoration: InputDecoration(
              focusedBorder: new OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFff9600), width: 2)),
              enabledBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey),
              ),
              labelText: labelText,
              labelStyle: TextStyle(
                color: Colors.grey,
              )),
        ),
      ),
    );
  }
}
