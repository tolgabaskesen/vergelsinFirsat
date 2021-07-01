import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/classes/sorularim.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';
import 'package:vergelsinfirsat/widgets/soru_kart.dart';

class SikcaSorulanSorularScreen extends StatefulWidget {
  const SikcaSorulanSorularScreen({Key? key}) : super(key: key);

  @override
  _SikcaSorulanSorularScreenState createState() =>
      _SikcaSorulanSorularScreenState();
}

class _SikcaSorulanSorularScreenState extends State<SikcaSorulanSorularScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Sıkça Sorulan Sorular"),
        centerTitle: true,
        backgroundColor: anaRenkKoyu,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                alignment: Alignment.center,
                height: size.height * 0.3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
                      child: Container(
                          height: size.height * 0.13,
                          width: size.width * 0.23,
                          child: Image.asset(
                            "assets/icons/sss.png",
                            fit: BoxFit.fill,
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Text(
                        "What is Lorem Ipsum?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                        "It is a long established fact that a reader The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English."),
                  ],
                ),
              ),
            ),
            FutureBuilder(
                future: DefaultAssetBundle.of(context)
                    .loadString("assets/jsonlar/sorular.json"),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData) {
                    final sorular = sorularFromJson(snapshot.data.toString());

                    return ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: sorular.length,
                        itemBuilder: (context, index) {
                          return Soru(
                              soru: sorular[index].soru,
                              cevap: sorular[index].cevap);
                        });
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
            SizedBox(
              height: size.height * 0.12,
            )
          ],
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }
}
