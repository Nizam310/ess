import 'package:flutter/cupertino.dart';

class ChatVm extends ChangeNotifier {
  TextEditingController chatController = TextEditingController();
  List<Map<String, dynamic>> messages = [
    {
      'message': 'Hello there!',
      'isMe': false,
    },
    {
      'message': 'How are you?',
      'isMe': true,
    },
    {
      'message': 'This is a test.',
      'isMe': false,
    },
    {
      'message': 'Welcome to the chat.',
      'isMe': false,
    },
    {
      'message': 'Why?.',
      'isMe': false,
    },
  ];

  void sendMessage() {
    String message = chatController.text;
    if (message.isNotEmpty) {
      messages.add({
        'message': message,
        'isMe': true,
      });
      chatController.clear();
      notifyListeners();
    }
  }
}
