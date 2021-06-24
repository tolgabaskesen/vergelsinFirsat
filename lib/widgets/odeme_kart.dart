import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class OdemeKart extends StatefulWidget {
  final bool isvisa;
  final bool isSelected;
  final String title;
  final String number;
  const OdemeKart(
      {Key? key,
      required this.isvisa,
      required this.isSelected,
      required this.title,
      required this.number})
      : super(key: key);

  @override
  _OdemeKartState createState() => _OdemeKartState();
}

class _OdemeKartState extends State<OdemeKart> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Image.asset(
              widget.isvisa
                  ? "assets/card/visa.png"
                  : "assets/card/mastercard.png",
              height: 25,
              width: 25,
            ),
          ),
          Expanded(
            child: ListTile(
              title: Text(
                widget.title,
                style: TextStyle(color: Colors.grey[800]),
              ),
              subtitle: Text(widget.number),
            ),
          ),
          widget.isSelected
              ? IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.check_circle,
                    color: ikincilRenk,
                  ))
              : IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.delete,
                    color: Colors.grey,
                  ))
        ],
      ),
    );
  }
}
