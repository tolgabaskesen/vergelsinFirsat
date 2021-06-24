import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class Adres extends StatefulWidget {
  final String tipi;
  final String adresi;
  final bool kontrol;
  const Adres(
      {Key? key,
      required this.tipi,
      required this.adresi,
      required this.kontrol})
      : super(key: key);

  @override
  _AdresState createState() => _AdresState();
}

class _AdresState extends State<Adres> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(widget.tipi == "İŞ ADRESİ"
                ? "assets/adres/work.png"
                : "assets/adres/house.png"),
          ),
          Expanded(
            child: ListTile(
              title: Flexible(
                  child: Text(
                widget.tipi,
                style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              )),
              subtitle: Flexible(
                  child: Text(
                widget.adresi,
                style: TextStyle(color: Colors.grey, fontSize: 12),
              )),
              trailing: widget.kontrol == false
                  ? Icon(Icons.delete)
                  : Icon(
                      Icons.check_circle,
                      color: ikincilRenk,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
