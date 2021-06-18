import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'dart:async';

import 'package:vergelsinfirsat/utils/color.dart';

class AdresEkle extends StatefulWidget {
  const AdresEkle({Key? key}) : super(key: key);

  @override
  _AdresEkleState createState() => _AdresEkleState();
}

class _AdresEkleState extends State<AdresEkle> {
  Completer<GoogleMapController> _haritaHazirlayici =
      Completer<GoogleMapController>();
  Map<MarkerId, Marker> _isaretler = <MarkerId, Marker>{};

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: genelAppBar(context, "Adres Ekle"),
      body: SingleChildScrollView(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set<Marker>.of(_isaretler.values),
                initialCameraPosition: CameraPosition(
                  target: LatLng(40.9956233, 28.7204478),
                  zoom: 17.0,
                ),
                onMapCreated: (GoogleMapController controller) {
                  _haritaHazirlayici.complete(controller);
                  final MarkerId isaretId = MarkerId("merkez");
                  final Marker isaret = Marker(
                    markerId: isaretId,
                    position: LatLng(40.9956233, 28.7204478),
                    infoWindow: InfoWindow(
                      title: "Teknokent",
                      snippet: "İstanbul Üniversitesi Teknokent Binası",
                      onTap: () {
                        debugPrint("İşaretleyici Tıklandı");
                      },
                    ),
                  );
                  setState(() {
                    _isaretler[isaretId] = isaret;
                  });
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: textField(context, "Adres Başlığı"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
              child: phoneField(context, "Telefon Numaranız", true),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Row(
                children: [acilirIl(context), acilirIlce(context)],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: Row(
                children: [acilirMahalle(context), postaKodu(context)],
              ),
            ),
            adres(context),
            Row(
              children: [
                binaNo(context),
                kat(context),
                daire(context),
              ],
            ),
            Container(
              width: size.width * 0.95,
              height: size.height * 0.07,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: anaRenkKoyu, // background
                    onPrimary: Colors.white, // foreground
                  ),
                  onPressed: () {},
                  child: Text(
                    "KAYDET",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
            ),
            SizedBox(
              height: size.height * 0.15,
            )
          ],
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }

  String dropdownValue1 = 'İl';
  String dropdownValue2 = 'İlçe';
  String dropdownValue3 = 'Mahalle';
  Widget acilirIl(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      width: size.width * 0.45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dropdownValue1),
            DropdownButton<String>(
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.grey),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue1 = newValue!;
                });
              },
              items: <String>['İstanbul', 'Bursa']
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

  Widget postaKodu(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(8, 0, 0, 8),
      width: size.width * 0.45,
      height: size.height * 0.078,
      child: Padding(
        padding: EdgeInsets.fromLTRB(3, 8, 0, 0),
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xFFff9600), width: 2)),
            enabledBorder: new OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            labelText: "Posta Kodu",
            labelStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  Widget adres(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      width: size.width * 0.95,
      // height: size.height * 0.4,
      child: Padding(
        padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
        child: TextField(
          maxLines: 5,
          decoration: InputDecoration(
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFFff9600),
              width: 2,
            )),
            enabledBorder: new OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: "Adres",
          ),
        ),
      ),
    );
  }

  Widget binaNo(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(8, 8, 0, 8),
      width: size.width * 0.3,
      height: size.height*0.07,
      child: Padding(
        padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFFff9600),
              width: 2,
            )),
            enabledBorder: new OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: "Bina No",
          ),
        ),
      ),
    );
  }

  Widget kat(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      width: size.width * 0.3,
      height: size.height*0.07,
      child: Padding(
        padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFFff9600),
              width: 2,
            )),
            enabledBorder: new OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: "Kat",
          ),
        ),
      ),
    );
  }

  Widget daire(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(0, 8, 8, 8),
      width: size.width * 0.3,
      height: size.height*0.07,
      child: Padding(
        padding: EdgeInsets.fromLTRB(3, 0, 0, 0),
        child: TextField(
          decoration: InputDecoration(
            focusedBorder: new OutlineInputBorder(
                borderSide: BorderSide(
              color: Color(0xFFff9600),
              width: 2,
            )),
            enabledBorder: new OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
            ),
            hintText: "Daire",
          ),
          keyboardType: TextInputType.number,
        ),
      ),
    );
  }

  Widget acilirIlce(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.all(8),
      width: size.width * 0.45,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dropdownValue2),
            DropdownButton<String>(
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.grey),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue2 = newValue!;
                });
              },
              items: <String>['Beyoğlu', 'Maslak', "Şişli", "Mudanya"]
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

  Widget acilirMahalle(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(8, 0, 8, 0),
      width: size.width * 0.45,
      height: size.height * 0.07,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(Radius.circular(5)),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(dropdownValue3),
            DropdownButton<String>(
              icon: const Icon(Icons.keyboard_arrow_down),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.grey),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue3 = newValue!;
                });
              },
              items: <String>['Atakent', 'Adnan Kahveci', "Zafer", "Karadeniz"]
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

  Widget textField(BuildContext context, String labelText) {
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

  Widget phoneField(BuildContext context, String labelText, bool onayli) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.all(8),
      height: size.height * 0.06,
      child: new Theme(
        data: new ThemeData(
          primaryColor: ikincilRenk,
          primaryColorDark: ikincilRenk,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              height: size.height * 0.06,
              width: (onayli) ? size.width * 0.67 : size.width * 0.9,
              child: TextField(
                keyboardType: TextInputType.number,
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
              ),
            ),
            (onayli)
                ? Row(
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: ikincilRenk,
                      ),
                      Text(
                        "ONAYLI",
                        style: TextStyle(
                            color: ikincilRenk,
                            fontWeight: FontWeight.bold,
                            fontSize: 15),
                      )
                    ],
                  )
                : Container()
          ],
        ),
      ),
    );
  }
}
