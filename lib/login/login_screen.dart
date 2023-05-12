import 'package:employee_self_service_flutter/common_widgets/button.dart';
import 'package:employee_self_service_flutter/common_widgets/text_field.dart';
import 'package:employee_self_service_flutter/login/login_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => LoginVm(),
      child: Consumer<LoginVm>(builder: (context, data, _) {
        return Scaffold(
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    "https://cloudmesoft.com/wp-content/uploads/2017/03/origin-logo.png",
                    width: 300,
                  ).paddingSymmetric(horizontal: 30),
                  CusTextField(
                    controller: data.userName,
                    onChanged: (val) {},
                    hintText: "Username",
                  ).paddingSymmetric(horizontal: 30, vertical: 10),
                  CusTextField(
                    controller: data.password,
                    onChanged: (val) {},
                    hintText: "Password",
                  ).paddingSymmetric(horizontal: 30, vertical: 10),
                  Row(
                    children: [
                      Expanded(
                          child: CusButton(
                        text: 'Login',
                        textColor: Colors.white,
                        onTap: () {Navigator.pushNamed(context, "/dash");},
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
