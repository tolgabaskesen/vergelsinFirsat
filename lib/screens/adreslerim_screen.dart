import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vergelsinfirsat/classes/adreslerim.dart';
import 'package:vergelsinfirsat/provider/seciliadres.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';
import 'package:vergelsinfirsat/widgets/adres_kart.dart';

class AdreslerimScreen extends StatefulWidget {
  const AdreslerimScreen({Key? key}) : super(key: key);

  @override
  _AdreslerimScreenState createState() => _AdreslerimScreenState();
}

class _AdreslerimScreenState extends State<AdreslerimScreen> {
  late List<Adreslerim> adresler;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      appBar: genelAppBar(context, "Adreslerim"),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              kullanici(context, "Miraç Yıldırım"),
              FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/jsonlar/adres.json"),
                  builder: (context, snapshot) {
                    final adresler =
                        adreslerimFromJson(snapshot.data.toString());

                    return Consumer<SeciliAdresNotifier>(
                        builder: (context, adres, child) {
                      var adresProvider =
                          Provider.of<SeciliAdresNotifier>(context, listen: false);
                      return ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: adresler.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  for (int i = 0; i < adresler.length; i++) {
                                    if (i < index) {
                                      adresProvider.secilmemis();
                                    } else if (i == index) {
                                      adresProvider.secilmis();
                                    } else {
                                      adresProvider.secilmemis();
                                    }
                                  }
                                });
                              },
                              child: Adres(
                                  tipi: adresler[index].title,
                                  adresi: adresler[index].adres,
                                  kontrol: adresProvider.seleceted),
                            );
                          });
                    });
                  }),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Yeni Adres Ekle",
                  style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                ),
              ),
              evekle(context),
              isekle(context),
              SizedBox(
                height: size.height * 0.12,
              )
            ],
          ),
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }

  Widget kullanici(BuildContext context, String adi) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.account_circle_rounded,
                  color: Colors.grey,
                ),
              ),
              Text(
                adi,
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 8, 0),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ikincilRenk, // background

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
                onPressed: () {},
                child: Text("Hesabıma Dön")),
          )
        ],
      ),
    );
  }

  Widget evekle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/adres/house.png"),
                ),
                Text("Ev Adresi Ekle"),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_box,
                  color: anaRenkKoyu,
                )),
          ],
        ),
      ),
    );
  }

  Widget isekle(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {});
      },
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("assets/adres/work.png"),
                ),
                Text("İş Adresi Ekle"),
              ],
            ),
            IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.add_box,
                  color: anaRenkKoyu,
                )),
          ],
        ),
      ),
    );
  }
}
