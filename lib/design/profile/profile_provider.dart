import 'package:flutter/cupertino.dart';

class ProfileVm extends ChangeNotifier {
  bool enable = false;

  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController dateOfJoin = TextEditingController();
  TextEditingController yearsWithCompany = TextEditingController();

   refresh() {
     notifyListeners();
   }
}
