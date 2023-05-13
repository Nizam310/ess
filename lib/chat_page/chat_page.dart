import 'package:employee_self_service_flutter/chat_page/chat_provider.dart';
import 'package:employee_self_service_flutter/common_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatVm(),
      child: Consumer<ChatVm>(builder: (context, data, _) {
        final widget = Align(
          alignment: AlignmentDirectional.bottomEnd,
          child: Container(
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(7),
            height: 35,
            width: 50,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)),
                color: Color(0xFF4C4C4A)),
            child: const Text(
              "hi",
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
        );
        return Stack(
          children: [
            Ink(
              // color: Colors.red,
              height: MediaQuery.of(context).size.height * 0.72,
              child: ListView(
                reverse: true,
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 100),
                children: [
                  widget,
                ],
              ),
            ),
            Align(
                alignment: AlignmentDirectional.bottomEnd,
                child: CusTextField(
                  controller: data.chatController,
                  onChanged: (val) {},
                  hintText: "Chat With HR",
                ).paddingSymmetric(horizontal: 30, vertical: 30)),
          ],
        );
      }),
    );
  }
}
