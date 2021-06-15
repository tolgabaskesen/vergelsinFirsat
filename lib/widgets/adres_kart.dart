import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class Adres extends StatefulWidget {
  final String tipi;
  final String adresi;
  const Adres({Key? key, required this.tipi, required this.adresi})
      : super(key: key);

  @override
  _AdresState createState() => _AdresState();
}

class _AdresState extends State<Adres> {
  bool iconkontrol = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          iconkontrol = true;
        });
      },
      child: Card(
        child: Row(
          children: [
            Image.asset(widget.tipi == "İŞ ADRESİ"
                ? "assets/adres/work.png"
                : "assets/adres/house.png"),
            ListTile(
              title: Flexible(child: Text(widget.tipi)),
              subtitle: Text(widget.adresi),
              trailing: iconkontrol == false
                  ? IconButton(onPressed: () {}, icon: Icon(Icons.delete))
                  : Icon(
                      Icons.check_circle,
                      color: ikincilRenk,
                    ),
            )
          ],
        ),
      ),
    );
  }
}
