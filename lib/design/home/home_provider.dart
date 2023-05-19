import 'package:flutter/material.dart';

class HomeVm extends ChangeNotifier {


  bool hover = false;

  double sliderValue = 5;

  TextEditingController feedbackComment = TextEditingController();

  refresh(){
    notifyListeners();
  }
}
