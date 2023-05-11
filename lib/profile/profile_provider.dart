import 'package:flutter/cupertino.dart';

class ProfileVm extends ChangeNotifier {
  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController dateOfJoin = TextEditingController();
  TextEditingController yearsWithCompany = TextEditingController();
}
