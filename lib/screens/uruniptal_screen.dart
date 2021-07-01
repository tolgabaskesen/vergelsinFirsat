import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';

class UrunIptali extends StatefulWidget {
  UrunIptali({Key? key}) : super(key: key);

  @override
  _UrunIptaliState createState() => _UrunIptaliState();
}

class _UrunIptaliState extends State<UrunIptali> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genelAppBar(context, "İptal, İade, Değişim"),
      bottomSheet: navSheet(context),
      body: Container(),
    );
  }
}
