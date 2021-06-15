import 'package:flutter/material.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

class HesabimScreen extends StatefulWidget {
  const HesabimScreen({Key? key}) : super(key: key);

  @override
  _HesabimScreenState createState() => _HesabimScreenState();
}

class _HesabimScreenState extends State<HesabimScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: genelAppBar(context, "Hesabım"),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: SingleChildScrollView(
           // physics: NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                kupon(context),
                adres(context),
                kart(context),
                magaza(context),
                begen(context),
                SizedBox(
                  height: size.height * 0.1,
                )
              ],
            ),
          ),
        ),
      ),
      bottomSheet: navSheet(context),
    );
  }

  Widget kupon(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.14,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/hesabim/coupon.png"),
            Text(
              "Kupon bulunamadı",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Hesabınıza tanımlı kupon bulunmuyor",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget adres(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/hesabim/locator.png"),
            Text(
              "Kayıtlı adresiniz bulunamadı",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            RichText(
              text: TextSpan(
                  text:
                      "Siparişleriniz için kullanabileceğiniz adres eklemek için ekranın üstünden \"",
                  style: TextStyle(color: Colors.grey),
                  children: [
                    TextSpan(
                      text: "Yeni Adres Ekle",
                      style: TextStyle(color: Colors.black),
                    ),
                    TextSpan(
                      text: "\" linkine tıklayarak adres oluşturabilirsiniz.",
                      style: TextStyle(color: Colors.grey),
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget kart(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.22,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/hesabim/credit-card.png"),
            Text(
              "Kayıtlı kartınız bulunmamaktadır.",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Hesabınıza tanımlı kupon bulunmuyor",
              style: TextStyle(color: Colors.grey),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ikincilRenk, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {},
                child: Text("Alışverişe Devam Et"))
          ],
        ),
      ),
    );
  }

  Widget magaza(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.2,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/hesabim/store.png"),
            Text(
              "Takip Edilen Mağaza Bulunamadı",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Mağaza sayfalarının üsüt bölümünden \"Takip Et\" butonlarına tıklayarak favori mağazalarınızı takip edebilirsiniz.",
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget begen(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.26,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/hesabim/heart.png"),
            Text(
              "Beğenilenler",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "Lorem Ipsum is simply dummy text of the printing and tince the 1500s",
              style: TextStyle(color: Colors.grey),
            ),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ikincilRenk, // background
                  onPrimary: Colors.white, // foreground
                ),
                onPressed: () {},
                child: Text("Alışverişe Devam Et"))
          ],
        ),
      ),
    );
  }
}
