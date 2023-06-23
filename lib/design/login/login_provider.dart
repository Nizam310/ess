import 'package:flutter/material.dart';

class LoginVm extends ChangeNotifier {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  void login(BuildContext context) {
    String expectedUserName = 'cloudme';
    String expectedPassword = '123';

    if (userName.text == expectedUserName &&
        password.text == expectedPassword) {
      Navigator.pushNamed(context, '/dash');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Incorrect username or password!',
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black,
        ),
      );
    }
    notifyListeners();
  }

  refresh() {
    notifyListeners();
  }
}
