import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 17);
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xFFB3D452),
                    borderRadius: BorderRadius.circular(5)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Name :",
                      style: style,
                    ).paddingTop(10),
                    const Text(
                      "Resignation :",
                      style: style,
                    ).paddingTop(10),
                    const Text(
                      "Date Of Join :",
                      style: style,
                    ).paddingTop(10),
                    const Text(
                      "Successful years with company :",
                      style: style,
                    ).paddingTop(10),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
