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
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Ink(
              //color: Colors.red,
              height: 300,
              child: ListView(
                children: [
                  Align(
                    alignment: AlignmentDirectional.bottomEnd,
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.all(7),
                      height: 35,
                      width: 50,
                      decoration: const BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20),
                              bottomLeft: Radius.circular(20),
                              bottomRight: Radius.circular(20))),
                      child: const Text(
                        "hi",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
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
