import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FeedBackAndSignatureVm extends ChangeNotifier {
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
}
