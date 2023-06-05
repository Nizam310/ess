import 'dart:io';

import 'package:employee_self_service_flutter/design/common_widgets/button.dart';
import 'package:employee_self_service_flutter/design/dash_board/widgets/signature.dart';
import 'package:flutter/cupertino.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant/enum.dart';
import 'feedback_and_signature_vm.dart';

class FeedBackAndSignature extends StatelessWidget {
  const FeedBackAndSignature({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => FeedBackAndSignatureVm(),
      child: ListView(
        children: [
          Consumer<FeedBackAndSignatureVm>(builder: (context, data, _) {
            return Column(
              children: [
                Signature(
                    image: data.picked != null
                        ? Image.file(
                            File(data.picked!.path),
                            height: 300,
                          )
                        : const Text('Nothing Picked!'),
                    name: 'Customer',
                    type: CusAttendeeType.customer),
                CusButton(
                    text: 'Add Image',
                    onTap: () {
                      data.pickFile();
                      data.refresh();
                    }).paddingSymmetric(horizontal: 13),
              ],
            );
          }),
        ],
      ),
    );
  }
}
