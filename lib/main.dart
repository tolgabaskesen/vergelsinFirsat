import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vergelsinfirsat/provider/renkNotifier.dart';
import 'package:vergelsinfirsat/provider/seciliadres.dart';
import 'package:vergelsinfirsat/screens/adresekle_screen.dart';
import 'package:vergelsinfirsat/screens/adreslerim_screen.dart';
import 'package:vergelsinfirsat/screens/deneme_screen.dart';
import 'package:vergelsinfirsat/screens/first_screen.dart';
import 'package:vergelsinfirsat/screens/hakkimizda_screen.dart';
import 'package:vergelsinfirsat/screens/hesabim.dart';
import 'package:vergelsinfirsat/screens/hesabim_screen.dart';
import 'package:vergelsinfirsat/screens/iletisim_tercihleri.dart';
import 'package:vergelsinfirsat/screens/odemeyontemi_screen.dart';
import 'package:vergelsinfirsat/screens/popup_screen.dart';
import 'package:vergelsinfirsat/screens/sikca_sorulan_sorular_screen.dart';
import 'package:vergelsinfirsat/screens/uruniptal_screen.dart';
import 'package:vergelsinfirsat/utils/color.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => RenkNotifier(),
      ),
      ChangeNotifierProvider(
        create: (context) => SeciliAdresNotifier(),
      ),
    ],
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vergelsin Fırsat APP',
      theme: ThemeData(
        primaryColor: anaRenk,
        primarySwatch: Colors.blue,
        bottomSheetTheme:
            BottomSheetThemeData(backgroundColor: Colors.transparent),
      ),
      home: MyHomePage(title: 'Vergelsin Fırsat APP'),
      debugShowCheckedModeBanner: false,
      routes: {
        //EKLENECEK HER YENİ SAYFA BURAYA ROUTE EDİLECEK!!!
        "/deneme_screen": (context) => DenemeScreen(),
        "/first_screen": (context) => FirstScreen(),
        "/hesabim_screen": (context) => HesabimScreen(),
        "/adreslerim_screen": (context) => AdreslerimScreen(),
        "/iletisim_tercihleri": (context) => IletisimTercihleri(),
        "/hesabim": (context) => ProfileScreen(),
        "/adresekle": (context) => AdresEkle(),
        "/odemeyontemi_screen": (context) => OdemeYontemiScreen(),
        "/popup_screen": (context) => PopupScreen(),
        "/uruniptali_screen": (context) => UrunIptali(),
        "/hakkimizda": (context) => HakkimizdaScreen(),
        "/sikcasorulan": (context) => SikcaSorulanSorularScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: anaRenk,
        centerTitle: true,
        title: Container(
          width: size.width * 0.3,
          child: Image.asset(
            "assets/app_logo.png",
            fit: BoxFit.fill,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Deneme Screen",
                () => Navigator.pushNamed(context, "/deneme_screen"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Giris Ekranı",
                () => Navigator.pushNamed(context, "/first_screen"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Hesabım Ekranı",
                () => Navigator.pushNamed(context, "/hesabim_screen"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Adreslerim Ekranı",
                () => Navigator.pushNamed(context, "/adreslerim_screen"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "İletişim Tercihlerim",
                () => Navigator.pushNamed(context, "/iletisim_tercihleri"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Hesabım",
                () => Navigator.pushNamed(context, "/hesabim"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Adres Ekle Sayfası",
                () => Navigator.pushNamed(context, "/adresekle"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Ödeme Yöntemleri",
                () => Navigator.pushNamed(context, "/odemeyontemi_screen"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Popup Screen",
                () => Navigator.pushNamed(context, "/popup_screen"),
              ),
              Container(
                child: Text(
                  "2.EKRANLAR, ALT BÖLÜM",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Ürün İptal Ekranı",
                () => Navigator.pushNamed(context, "/uruniptali_screen"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Hakkımızda Ekranı",
                () => Navigator.pushNamed(context, "/hakkimizda"),
              ),
              sayfaGecis(
                //Oluşturulan her sayfa için geçişler buraya button olarak aynı şekilde tanımlanacak.
                context,
                "Sıkça Sorulan Sorular Screen",
                () => Navigator.pushNamed(context, "/sikcasorulan"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget sayfaGecis(
    BuildContext context, String sayfaAdi, void Function()? onpress) {
  Size size = MediaQuery.of(context).size;
  return Container(
    padding: EdgeInsets.all(8),
    width: size.width * 0.9,
    height: size.height * 0.07,
    child: ElevatedButton(
      child: Text(sayfaAdi),
      onPressed: onpress,
    ),
  );
}
