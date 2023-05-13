import 'package:flutter/material.dart';

class HomeVm extends ChangeNotifier {


  bool hover = false;

  refresh(){
    notifyListeners();
  }
}
