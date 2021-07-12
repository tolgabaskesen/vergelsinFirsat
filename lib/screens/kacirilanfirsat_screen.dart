import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:vergelsinfirsat/classes/kacirilanfirsat_model.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class KacirilanFirsatScreen extends StatefulWidget {
  const KacirilanFirsatScreen({Key? key}) : super(key: key);

  @override
  _KacirilanFirsatScreenState createState() => _KacirilanFirsatScreenState();
}

class _KacirilanFirsatScreenState extends State<KacirilanFirsatScreen> {
  @override
  Widget build(BuildContext context) {
    String firsatbilgi = "Lorem Ipsum is simply dummy text of the printing";
    Size size = MediaQuery.of(context).size;

    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: arkaplanRenk,
        appBar: genelAppBar(context, "verGelsin"),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 12, 0, 2),
                child: Text(
                  "Kaçırdığın Fırsatlar",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(8, 0, 0, 16),
                child: Text(firsatbilgi),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 0, 8, 8),
                child: Container(
                  height: size.height * 0.15,
                  child: TabBar(
                    indicatorPadding: EdgeInsets.all(8),
                    isScrollable: true,
                    labelColor: Colors.white,
                    indicatorColor: anaRenkKoyu,
                    unselectedLabelColor: Colors.grey[800],
                    dragStartBehavior: DragStartBehavior.start,
                    indicator: BoxDecoration(
                        color: anaRenkKoyu,
                        borderRadius: BorderRadius.circular(5)),
                    tabs: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Tab(
                          icon: Icon(
                            Icons.laptop_mac_rounded,
                            size: 40,
                          ),
                          text: "Bilgisayar",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Tab(
                          iconMargin: EdgeInsets.only(bottom: 16),
                          icon: Icon(
                            Icons.phonelink_ring_rounded,
                            size: 35,
                          ),
                          text: "Telefon",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Tab(
                          icon: Icon(
                            Icons.desktop_mac_rounded,
                            size: 40,
                          ),
                          text: "Televizyon",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Tab(
                          icon: Icon(
                            Icons.kitchen_rounded,
                            size: 40,
                          ),
                          text: "Beyaz Eşya",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Tab(
                          icon: Icon(
                            Icons.weekend_rounded,
                            size: 40,
                          ),
                          text: "Ev Eşyası",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              urunler(context),
              SizedBox(height: size.height * 0.12)
            ],
          ),
        ),
        bottomSheet: navSheet(context),
      ),
    );
  }

  Widget urunler(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height * 0.9);
    final double itemWidth = size.width / 2;
    return Container(
        color: arkaplanRenk,
        
        child: FutureBuilder(
            future: DefaultAssetBundle.of(context)
                .loadString("assets/jsonlar/kacirilanfirsat_urun.json"),
            builder: (context, snapshot) {
              //log(snapshot.connectionState.toString());
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData) {
                final kacirilanFirsatJson =
                    kacirilanFirsatJsonFromJson(snapshot.data.toString());

                return GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  childAspectRatio: (itemWidth * 2.1 / itemHeight),
                  children: List.generate(kacirilanFirsatJson.length, (index) {
                    return kacirilanFirsatUrun(
                            context,
                            kacirilanFirsatJson[index].urun,
                            kacirilanFirsatJson[index].urunAdi,
                            kacirilanFirsatJson[index].yuzde,
                            kacirilanFirsatJson[index].satisFiyati,
                            kacirilanFirsatJson[index].isoy)
                        /* Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                      color: Colors.red,
                    ),
                        ) */
                        ;
                  }),
                );
              } else {
                return Center(child: CircularProgressIndicator());
              }
            }));
  }

  Widget kacirilanFirsatUrun(BuildContext context, String urun, String adi,
      double yuzde, String satisfiyat, bool isoy) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Text(
                "%" + (yuzde * 100).toString(),
                style: TextStyle(color: ikincilRenk),
              ),
            ),
            CircularPercentIndicator(
              radius: 160,
              lineWidth: 4,
              percent: yuzde,
              center: ClipRRect(
                  borderRadius: BorderRadius.circular(25),
                  child: Image.asset(
                    urun,
                    width: size.width * 0.45,
                    height: size.height * 0.15,
                  )),
              progressColor: ikincilRenk,
            ),
            Text(
              adi,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "$satisfiyat'den satıldı",
              style: TextStyle(color: Colors.grey),
            ),
            Container(
              width: size.width * 0.42,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: isoy ? Colors.blueGrey[900] : anaRenkKoyu),
                  onPressed: () {
                    //Bu kısımda api isteği olacak
                  },
                  child: Text(
                    isoy ? "OY VERDİNİZ" : "FIRSATA OY VER",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
