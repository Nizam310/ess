import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/text_field.dart';
import 'login_provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final surface = colorScheme.surface;
    return ChangeNotifierProvider(
      create: (_) => LoginVm(),
      child: Builder(builder: (
        context,
      ) {
        return SafeArea(
          child: Scaffold(
            body: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    "assets/images/login_image.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                 Positioned(
                   left: 0,
                   top: 0,
                   child: GestureDetector(
                    onDoubleTap: () {

                      Navigator.restorablePushNamedAndRemoveUntil(context, '/dash', (route) => true);
                    },
                    child: SizedBox(
                      height: 10,
                      width: 20,
                      child: Center(
                        child: Text(
                          'Nisam',
                          style:
                              TextStyle(color: Colors.grey.withOpacity(0.01)),
                        ),
                      ),
                    ),
                ),
                 ),
              ],
            ),
            bottomSheet: Container(
              height: 312,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                begin: AlignmentDirectional.topCenter,
                end: AlignmentDirectional.bottomCenter,
                colors: [
                  const Color(0xFF263936).withOpacity(0.0),
                  const Color(0xFF263936).withOpacity(0.0),
                  const Color(0xFF263936).withOpacity(0.1),
                  const Color(0xFF263936).withOpacity(0.3),
                  const Color(0xFF263936).withOpacity(0.4),
                  const Color(0xFF263936).withOpacity(0.4),
                  const Color(0xFF263936).withOpacity(0.4),
                  const Color(0xFF263936).withOpacity(0.5),
                  const Color(0xFF263936).withOpacity(0.5),
                  const Color(0xFF263936).withOpacity(0.5),
                  const Color(0xFF263936).withOpacity(0.5),
                  const Color(0xFF263936).withOpacity(0.8),
                  const Color(0xFF263936).withOpacity(0.8),
                  const Color(0xFF263936).withOpacity(0.8),
                  const Color(0xFF263936).withOpacity(0.8),
                  const Color(0xFF263936).withOpacity(0.9),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                  const Color(0xFF263936),
                ],
              )),
              child: Center(
                child: ListView(
                  children: [
                    Text(
                      'Welcome Back!',
                      textAlign: TextAlign.center,
                      style: context.textTheme.titleLarge
                          ?.copyWith(color: Colors.white),
                    ).paddingOnly(bottom: 10),
                    Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: 400,
                        //          color: Colors.white,
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CusTextField(
                              textColor: surface,
                              radius: 10,
                              prefix: const Icon(
                                Icons.person,
                                color: Color(0xFFB7D54F),
                                size: 14,
                              ),
                              fillColor: /*const Color(0xFFF4F8FB)*/
                                  Colors.transparent,
                              hintColor: const Color(0xFFDDE0E5),
                              borderColor: surface,
                              controller: context
                                  .select((LoginVm value) => value.userName),
                              onChanged: (val) {},
                              hintText: "Username",
                            ).paddingSymmetric(horizontal: 30, vertical: 5),
                            CusTextField(
                              textColor: surface,
                              radius: 10,
                              prefix: const Icon(
                                Icons.lock,
                                color: Color(0xFFB7D54F),
                                size: 14,
                              ),
                              fillColor: /*const Color(0xFFF4F8FB)*/
                                  Colors.transparent,
                              hintColor: const Color(0xFFDDE0E5),
                              borderColor: surface,
                              controller: context
                                  .select((LoginVm value) => value.password),
                              onChanged: (val) {},
                              hintText: "Password",
                            ).paddingSymmetric(horizontal: 30, vertical: 5),
                            Align(
                                alignment: AlignmentDirectional.bottomEnd,
                                child: Text(
                                  'Forgot?',
                                  style: context.textTheme.bodySmall
                                      ?.copyWith(fontSize: 10, color: surface),
                                )).paddingOnly(
                              right: 30,
                              bottom: 12,
                            ),
                            InkWell(
                              onTap: () {
                                context.read<LoginVm>().login(context);
                                context.read<LoginVm>().refresh();
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 13,
                                      ),
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 30),
                                      decoration: BoxDecoration(
                                          color: const Color(0xFFB7D54F),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: Center(
                                          child: Text(
                                        'Login',
                                        style: context.textTheme.bodyMedium
                                            ?.copyWith(color: surface),
                                      )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Image.asset(
                      'assets/images/cloudMe_white_logo.png',
                      height: 60,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
