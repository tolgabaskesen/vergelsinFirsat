import 'package:flutter/cupertino.dart';

class SeciliAdres with ChangeNotifier {
  bool _selected = false;

  bool get seleceted => _selected;

  secilmemis() {
    _selected = false;

    notifyListeners();
  }
  secilmis(){
    _selected = true;

    notifyListeners();
  }
}
