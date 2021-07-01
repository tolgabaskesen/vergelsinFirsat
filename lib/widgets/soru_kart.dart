import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/utils/color.dart';

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
      shape: RoundedRectangleBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
      color: acma == false ? anaRenkKoyu : ikincilRenk,
      child: Column(
        children: [
          Row(
            children: [
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
                    acma == false ? Icons.add_rounded : Icons.remove,
                    size: size.width * 0.05,
                    color: acma == false ? Colors.orange : Colors.white,
                  )),
              Text(
                widget.soru,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                    color: Colors.white),
              ),
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
      return Container(
        color: Colors.white,
        child: Column(
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
        ),
      );
    } else {
      return Container();
    }
  }
}
