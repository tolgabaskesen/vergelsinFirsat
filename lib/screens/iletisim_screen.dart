import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class IletisimScreen extends StatefulWidget {
  const IletisimScreen({Key? key}) : super(key: key);

  @override
  _IletisimScreenState createState() => _IletisimScreenState();
}

class _IletisimScreenState extends State<IletisimScreen> {
  Completer<GoogleMapController> _haritaHazirlayici =
      Completer<GoogleMapController>();
  Map<MarkerId, Marker> _isaretler = <MarkerId, Marker>{};
  String isimsoyisimbilgisi = "";
  String emailbilgisi = "";
  String mesajbasligibilgisi = "";
  String mesajbilgisi = "";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: Text("İletişim"),
        centerTitle: true,
        backgroundColor: anaRenkKoyu,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: size.height * 0.3,
              width: size.width,
              child: GoogleMap(
                mapType: MapType.normal,
                markers: Set<Marker>.of(_isaretler.values),
                initialCameraPosition: CameraPosition(
                  target: LatLng(40.9956233,
                      28.7204478), //Bu kısma şirketin long ve lat bilgileri girilecek
                  zoom: 15.0,
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
              child: isimsoyisim(context, "İsim Soyisim"),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: email(context, "E-mail adresinizi yazınız..."),
            ),
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: mesajbasligi(context, "Mesaj başlığını yazınız..."),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 4),
              child: konubasligi(context),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 4, 0),
              child: mesaj(context),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color: arkaplanRenk,
                height: size.height * 0.35,
                child: Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    childAspectRatio: 2.0 /* (itemWidth*1  / itemHeight) */,
                    crossAxisCount: 2,
                    children: [
                      cagrimerkezi(context, "Çağrı Merkezi",
                          "0000 000 0000"), //Burdaki stringlere apiden alınan değerler girilecek..
                      unvani(context, "Ünvanı", "Müşteri Sorumlusu"),
                      ticarino(
                          context, "Ticari Sicil Numarası", "0000 000 0000"),
                      genelmudurluk(
                          context, "Genel Müdürlük", "verGelsin Lorem Ipsum")
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
            )
          ],
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }

  String dropdownValue1 = 'Konu Başlığı';

  Widget konubasligi(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(right: 4),
      child: Container(
        height: size.height * 0.06,
        alignment: Alignment.center,
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dropdownValue1,
                style: TextStyle(color: Colors.grey),
              ),
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
                items: <String>['Şikayet', 'İstek', 'Diğer']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mesaj(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.fromLTRB(8, 8, 8, 8),
      width: size.width * 0.95,
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
            hintText:
                "Lütfen mesajınızı açıklayıcı bir biçimde ve anlaşılır bir biçimde yazınız...",
          ),
          onChanged: (mesaj) {
            setState(() {
              mesajbilgisi = mesaj;
            });
          },
        ),
      ),
    );
  }

  Widget isimsoyisim(BuildContext context, String labelText) {
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
          onChanged: (mesaj) {
            setState(() {
              isimsoyisimbilgisi = mesaj;
            });
          },
        ),
      ),
    );
  }

  Widget email(BuildContext context, String labelText) {
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
          onChanged: (mesaj) {
            setState(() {
              emailbilgisi = mesaj;
            });
          },
        ),
      ),
    );
  }

  Widget mesajbasligi(BuildContext context, String labelText) {
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
          onChanged: (mesaj) {
            setState(() {
              mesajbasligibilgisi = mesaj;
            });
          },
        ),
      ),
    );
  }

  Widget cagrimerkezi(BuildContext context, String baslik, String numara) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        margin: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                baslik,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(numara)
          ],
        ),
      ),
    );
  }

  Widget unvani(BuildContext context, String baslik, String bilgi) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        margin: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                baslik,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(bilgi)
          ],
        ),
      ),
    );
  }

  Widget ticarino(BuildContext context, String baslik, String numara) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        margin: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                baslik,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(numara)
          ],
        ),
      ),
    );
  }

  Widget genelmudurluk(BuildContext context, String baslik, String bilgi) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8), color: Colors.white),
        margin: EdgeInsets.all(4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                baslik,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Text(bilgi)
          ],
        ),
      ),
    );
  }
}
