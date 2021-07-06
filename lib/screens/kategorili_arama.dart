import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/classes/kategori_model.dart';
import 'package:vergelsinfirsat/classes/marka_model.dart';
import 'package:vergelsinfirsat/classes/populer_aramalar_model.dart';
import 'package:vergelsinfirsat/classes/urunler_gecmis_model.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';
import 'package:vergelsinfirsat/widgets/kategori.dart';

class KategoriliAramaScreen extends StatefulWidget {
  const KategoriliAramaScreen({Key? key}) : super(key: key);

  @override
  _KategoriliAramaScreenState createState() => _KategoriliAramaScreenState();
}

class _KategoriliAramaScreenState extends State<KategoriliAramaScreen> {
  int yorumsayisi = 121;
  double fiyat = 77.77;
  int adet = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Arama",
          ),
          centerTitle: true,
          backgroundColor: anaRenkKoyu,
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                height: size.height * 0.07,
                child: TabBar(
                  labelColor: Colors.black,
                  indicatorColor: Colors.grey,
                  unselectedLabelColor: Colors.grey,
                  tabs: [
                    Tab(
                      text: "Kategoriler",
                    ),
                    Tab(
                      text: "Markalar",
                    ),
                    Tab(
                      text: "Geçmiş",
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.8,
                child: TabBarView(children: [
                  kategoriler(context),
                  markalar(context),
                  gecmis(context)
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget kategoriler(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        color: arkaplanRenk,
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * 0.01,
                ),
                Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search_rounded),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: "ürün ara",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mic_none_outlined,
                              color: Colors.grey,
                              size: 20,
                            )),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                FutureBuilder(
                    future: DefaultAssetBundle.of(context)
                        .loadString("assets/jsonlar/kategoriler.json"),
                    builder: (context, snapshot) {
                      //log(snapshot.connectionState.toString());
                      if (snapshot.connectionState == ConnectionState.done &&
                          snapshot.hasData) {
                        final kategoriModel =
                            kategoriModelFromJson(snapshot.data.toString());

                        return ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: kategoriModel.length,
                            itemBuilder: (context, index) {
                              return Kategori(
                                  kategoriadi: kategoriModel[index].adi,
                                  ikon: kategoriModel[index].ikon);
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    }),
                SizedBox(
                  height: size.height * 0.1,
                ),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }

  Widget markalar(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //var mydata = jsonDecode("assets/datas/markalar.json");
    return Scaffold(
      body: Container(
        color: arkaplanRenk,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.all(2.0),
                child: Card(
                  child: Row(
                    children: [
                      Expanded(
                        flex: 8,
                        child: TextField(
                          decoration: InputDecoration(
                              suffixIcon: Icon(Icons.search_rounded),
                              enabledBorder: new OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              hintText: "marka ara",
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.mic_none_outlined,
                              color: Colors.grey,
                              size: 20,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/jsonlar/markalar.json"),
                  builder: (context, snapshot) {
                    //log(snapshot.connectionState.toString());
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final markaModel =
                          markaModelFromJson(snapshot.data.toString());

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "A",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: markaModel.a.length,
                              itemBuilder: (context, index) {
                                return marka(context, markaModel.a[index].marka,
                                    markaModel.a[index].adet);
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "B",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: markaModel.b.length,
                              itemBuilder: (context, index) {
                                return marka(context, markaModel.b[index].marka,
                                    markaModel.b[index].adet);
                              }),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "C",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          ListView.builder(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemCount: markaModel.c.length,
                              itemBuilder: (context, index) {
                                return marka(context, markaModel.c[index].marka,
                                    markaModel.c[index].adet);
                              }),
                          SizedBox(
                            height: size.height * 0.1,
                          )
                        ],
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ],
          ),
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }

  Widget marka(BuildContext context, String ad, String adet) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: size.height * 0.07,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.065,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Text(ad),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        adet,
                        style: TextStyle(color: Colors.grey),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.grey,
                            size: 20,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: size.height * 0.001,
            )
          ],
        ),
      ),
    );
  }

  Widget gecmisUrun(BuildContext context, String ad, String tarih) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: size.height * 0.067,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: size.height * 0.065,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(4, 0, 0, 0),
                    child: Text(ad),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        tarih,
                        style: TextStyle(color: Colors.grey),
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.chevron_right_rounded,
                            color: Colors.grey,
                            size: 20,
                          ))
                    ],
                  )
                ],
              ),
            ),
            Divider(
              height: size.height * 0.001,
            )
          ],
        ),
      ),
    );
  }

  Widget gecmis(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height * 0.2);
    final double itemWidth = size.width / 2;
    return Container(
      color: arkaplanRenk,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.02,
            ),
            FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/jsonlar/urunler_gecmis.json"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final urunlerGecmis =
                        urunlerGecmisFromJson(snapshot.data.toString());

                    return Column(
                      children: [
                        ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: urunlerGecmis.length,
                            itemBuilder: (context, index) {
                              return gecmisUrun(
                                  context,
                                  urunlerGecmis[index].adi,
                                  urunlerGecmis[index].tarih);
                            }),
                        Container(
                          height: size.height * 0.067,
                          color: Colors.white,
                          alignment: Alignment.center,
                          child: GestureDetector(
                              onTap: () {
                                //geçmişi temizleme api isteği kısmı burada olacak
                              },
                              child: Text(
                                "Geçmişi Temizle",
                                style: TextStyle(color: Colors.grey),
                              )),
                        )
                      ],
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "Popüler Aramalar",
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            Container(
              height: size.height * 0.35,
              child: FutureBuilder(
                  future: DefaultAssetBundle.of(context)
                      .loadString("assets/jsonlar/populer_aramalar.json"),
                  builder: (context, snapshot) {
                    //log(snapshot.connectionState.toString());
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.hasData) {
                      final populerAramalar =
                          populerAramalarFromJson(snapshot.data.toString());

                      return GridView.count(
                        crossAxisCount: 2,
                        childAspectRatio: (itemWidth * 3 / itemHeight),
                        children:
                            List.generate(populerAramalar.length, (index) {
                          return populerUrun(
                              context, populerAramalar[index].adi);
                        }),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget populerUrun(BuildContext context, String adi) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: GestureDetector(
          onTap: () {
            //Bu kısımda popüler aramalara tıklandığında yapılacak işlemler olacak
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(adi),
          ),
        ),
      ),
    );
  }
}
