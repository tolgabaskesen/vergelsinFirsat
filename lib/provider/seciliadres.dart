import 'package:flutter/cupertino.dart';

class SeciliAdresNotifier with ChangeNotifier {
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
