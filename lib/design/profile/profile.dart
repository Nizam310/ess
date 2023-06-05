import 'dart:io';

import 'package:employee_self_service_flutter/design/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/button.dart';
import '../common_widgets/list_cus_card.dart';
import '../common_widgets/text_field.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Consumer<ProfileVm>(builder: (context, data, _) {
              return SizedBox(
                width: 100,
                height: 100,
                child: Stack(
                  children: [
                    data.picked != null
                        ? Positioned.fill(
                      child: ClipOval(
                        child: Image.file(
                          File(data.picked!.path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                        : SizedBox(
                      height: 100,
                      width: 100,
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        child: const Icon(Icons.person),
                      ).paddingBottom(10),
                    ),
                  ],
                ),
              ).paddingBottom(10);
            }),
            CusTextField(
              enabled: context.select((ProfileVm value) => value.enable),
              controller: context.select((ProfileVm value) => value.name),
              onChanged: (v) {},
              hintText: "Name",
            ).paddingAll(10),
            CusTextField(
              enabled: context.select((ProfileVm value) => value.enable),
              controller: context.select((ProfileVm value) => value.position),
              onChanged: (v) {},
              hintText: "Position",
            ).paddingAll(10),
            CusTextField(
              enabled: context.select((ProfileVm value) => value.enable),
              controller: context.select(
                    (ProfileVm value) => value.mob,
              ),
              onChanged: (v) {},
              hintText: "Mobile",
            ).paddingAll(10),
            const ListCusCard(text: "Date Of  join :   ${"21/12/23"}",).paddingAll(10),
            const ListCusCard(text: "Total years with company :  ${'5'}",).paddingAll(10),


            Visibility(
              visible: context
                  .read<ProfileVm>()
                  .enable == true,
              child: CusButton(
                  text: "Submit",
                  onTap: () {
                    context.read<ProfileVm>().onSubmit();
                  }).paddingSymmetric(horizontal: 10,vertical: 10),
            ),
          ],
        ).paddingSymmetric(vertical: 10),
      ),
    );
  }
}

