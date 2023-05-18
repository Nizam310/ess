import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

class ProfileVm extends ChangeNotifier {

  bool enable = false;

  TextEditingController name = TextEditingController();
  TextEditingController position = TextEditingController();
  TextEditingController mob = TextEditingController();
  TextEditingController dateOfJoin = TextEditingController();
  TextEditingController yearsWithCompany = TextEditingController();

  File? picked;

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? "");

      picked = File(file.path);
      notifyListeners();
    }
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }

   onSubmit() {
    enable = false;
    notifyListeners();
   }
}
