import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/button.dart';
import '../common_widgets/text_field.dart';
import 'login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginVm(),
      child: Builder(builder: (
        context,
      ) {
        return Scaffold(
          backgroundColor: Color(0xFF7158CD),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/employee_login.png",

                  ),
                  CusTextField(
                    hintColor: const Color(0xFFD1C9EF),
                    borderColor:const Color(0xFFD1C9EF),
                    controller:
                        context.select((LoginVm value) => value.userName),
                    onChanged: (val) {},
                    hintText: "Username",
                  ).paddingSymmetric(horizontal: 30, vertical: 10),
                  CusTextField(
                    hintColor: const Color(0xFFD1C9EF),
                    borderColor: const Color(0xFFD1C9EF),
                    controller:
                        context.select((LoginVm value) => value.password),
                    onChanged: (val) {},
                    hintText: "Password",
                  ).paddingSymmetric(horizontal: 30, vertical: 10),
                  Row(
                    children: [
                      Expanded(
                          child: CusButton(
                        text: 'Login',
                        textColor: const Color(0xFF7158CD),
                        color: const Color(0xFFD1C9EF),
                        hoverColor: const Color(0xFFD1C9EF),
                        onTap: () {
                          Navigator.pushNamed(context, "/dash");
                        },
                      ).paddingSymmetric(horizontal: 30, vertical: 10)),
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
