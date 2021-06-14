import 'package:flutter/material.dart';

class Soru extends StatefulWidget {
  final String soru;
  final String cevap;
  const Soru({Key? key, required this.soru, required this.cevap})
      : super(key: key);

  @override
  _SoruState createState() => _SoruState();
}

class _SoruState extends State<Soru> {
  bool acma = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.soru,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              IconButton(
                  onPressed: () {
                    setState(() {
                      if (acma == false) {
                        acma = true;
                      } else {
                        acma = false;
                      }
                    });
                  },
                  icon: Icon(
                    acma == false ? Icons.add : Icons.remove,
                    size: size.width * 0.04,
                  ))
            ],
          ),
          kontrol(context)
        ],
      ),
    );
  }

  Widget kontrol(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (acma == true) {
      return Column(
        children: [
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.cevap),
          ),
          SizedBox(
            height: size.height * 0.04,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}
