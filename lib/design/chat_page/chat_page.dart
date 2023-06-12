import 'package:employee_self_service_flutter/design/common_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'chat_provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ChatVm(),
      child: Builder(builder: (context) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount:
                    context.select((ChatVm value) => value.messages.length),
                itemBuilder: (context, index) {
                  final message = context.read<ChatVm>().messages[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: message['isMe']
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color:
                              message['isMe'] ? Colors.blue : Colors.grey[300],
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          message['message'],
                          style: TextStyle(
                            color:
                                message['isMe'] ? Colors.white : Colors.black,
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: CusTextField(
                      controller: context.read<ChatVm>().chatController,
                      hintText: 'Enter your message...',
                      onChanged: (v) {},
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.outline)),
                    height: 50,
                    width: 50,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: context.read<ChatVm>().sendMessage,
                      child: Icon(
                        Icons.send,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
