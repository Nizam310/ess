import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/Material.dart';

class DocumentsVm extends ChangeNotifier {
  bool haveData = false;
  bool saveClicked = false;

  Future<void> pickFile(DocModel list, {bool isFront = true}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path ?? "");
      if (isFront) {
        list.frontImage = file;
        notifyListeners();
      } else {
        list.backImage = file;
        notifyListeners();
      }

      notifyListeners();
    }
    if (result != null && result.files.isNotEmpty) {
      list.save = true;
      notifyListeners();
    }
  }

  List<DocModel> listFrontAndBack = [
    DocModel(
      docName: 'Aadhaar',

    ),
    DocModel(
      docName: 'Pan',

    ),
    DocModel(
      docName: 'Licence',

    ),
    DocModel(
      docName: 'ID',

    ),
  ];
  List<DocModel> list = [
    DocModel(
      docName: 'Passport',
    ),
    DocModel(
      docName: 'Visa',
    ),
  ];

  refresh() {
    notifyListeners();
  }

  onSaveImage() {
    log('jhhhhhhhhhhhhhhhhhhhhhhhhd');
  }

  onSaveFrontAndBackImage(DocModel model) {
    model.save = false;
    notifyListeners();
  }
}

class DocModel {
  String? docName;
  File? frontImage;
  File? backImage;
  bool? oneOnly;
  bool ? save ;
  DocModel({this.docName, this.frontImage, this.backImage, this.oneOnly,this.save});
}
