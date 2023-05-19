import 'package:flutter/cupertino.dart';

class SettingsVm extends ChangeNotifier{
  bool switchOn = false;

   refresh() {
     notifyListeners();
   }
}