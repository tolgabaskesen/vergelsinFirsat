import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class PopupScreen extends StatefulWidget {
  PopupScreen({Key? key}) : super(key: key);

  @override
  _PopupScreenState createState() => _PopupScreenState();
}

class _PopupScreenState extends State<PopupScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genelAppBar(context, "Popup Screen"),
      bottomSheet: navSheet(context),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            popupButton(context, "Green Popup", () {
              _showImageDialog(context, "green");
            }),
            popupButton(context, "Red Popup", () {
              _showImageDialog(context, "red");
            }),
            popupButton(context, "Map Popup", () {
              _showImageDialog(context, "map");
            }),
            popupButton(context, "Normal Popup", () {
              _showEmptyDialog(context);
            }),
          ],
        ),
      ),
    );
  }
}

Future<void> _showImageDialog(BuildContext context, String image) async {
  Size size = MediaQuery.of(context).size;
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
            child: Container(
          color: Colors.transparent,
          width: size.width * 0.9,
          height: size.height * 0.3,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    width: size.width * 0.9,
                    height: size.height * 0.05,
                  ),
                  Container(
                    color: Colors.white,
                    width: size.width * 0.9,
                    height: size.height * 0.25,
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    color: Colors.transparent,
                    width: size.width * 0.9,
                    height: size.height * 0.1,
                    alignment: Alignment.center,
                    child: Container(
                      width: size.height * 0.1,
                      height: size.height * 0.1,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(
                          "assets/alertpopup/$image.png",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  (image == "map")
                      ? Container(
                          color: Colors.white,
                          width: size.width * 0.9,
                          height: size.height * 0.2,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ListTile(
                                title: AutoSizeText(
                                  "Lorem Ipsum",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: AutoSizeText(
                                  "Lorem Ipsum is simply dummy text of the printing",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    width: size.width * 0.4,
                                    height: size.height * 0.08,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.black, // background
                                      ),
                                      child: Text("Hayır"),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(8),
                                    width: size.width * 0.4,
                                    height: size.height * 0.08,
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: anaRenkKoyu, // background
                                      ),
                                      child: Text("Evet"),
                                      onPressed: () => Navigator.pop(context),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      : Container(
                          color: Colors.white,
                          width: size.width * 0.9,
                          height: size.height * 0.2,
                          alignment: Alignment.center,
                          child: Column(
                            children: [
                              ListTile(
                                title: AutoSizeText(
                                  "Lorem Ipsum",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                subtitle: AutoSizeText(
                                  "Lorem Ipsum is simply dummy text of the printing",
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(8),
                                width: size.width * 0.9,
                                height: size.height * 0.08,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: anaRenkKoyu, // background
                                  ),
                                  child: Text("Tamam"),
                                  onPressed: () => Navigator.pop(context),
                                ),
                              )
                            ],
                          ),
                        )
                ],
              )
            ],
          ),
        )),
      );
    },
  );
}

Future<void> _showEmptyDialog(BuildContext context) async {
  Size size = MediaQuery.of(context).size;
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.zero,
        content: SingleChildScrollView(
            child: Container(
          color: Colors.white,
          width: size.width * 0.9,
          height: size.height * 0.27,
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: size.width * 0.9,
                height: size.height * 0.15,
                alignment: Alignment.center,
                padding: EdgeInsets.all(8),
                child: AutoSizeText(
                  "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable.",
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(8),
                width: size.width * 0.9,
                height: size.height * 0.08,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: anaRenkKoyu, // background
                  ),
                  child: Text("Tamam"),
                  onPressed: () => Navigator.pop(context),
                ),
              )
            ],
          ),
        )),
      );
    },
  );
}

Widget popupButton(
    BuildContext context, String buttonName, void Function()? onpress) {
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.all(8),
    width: size.width * 0.9,
    height: size.height * 0.07,
    child: ElevatedButton(
      child: Text(buttonName),
      onPressed: onpress,
    ),
  );
}
