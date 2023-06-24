import 'dart:io';

import 'package:employee_self_service_flutter/design/employee_dash/employee_dash_provider.dart';
import 'package:employee_self_service_flutter/design/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/button.dart';
import '../common_widgets/list_cus_card.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final data = Provider.of<EmployeeDashVm>(context, listen: false);
    final Map<String,dynamic> e = data.list.firstOrNull??{};
    // final name = data.list.map((e) => e['first_name']);
   // final name=  e['first_name'];

    final position = data.list.map((e) => e["designation"]['name']);
    final department = data.list.map((e) => e["department"]['name']);
    final bankName = data.list.map((e) => e["bank_details"]['bank_name']);
    final bankAcc = data.list.map((e) => e["bank_details"]['acc_number']);
    final isbn = data.list.map((e) => e["bank_details"]['isbn_num']);
    final swift = data.list.map((e) => e["bank_details"]['swift_code']);
    final mobile = data.list.map((e) => e['mobile']);
    final doj = data.list.map((e) => e['doj']);
    final email = data.list.map((e) => e['email']);
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
            /* CusTextField(
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
            ).paddingAll(10),*/
            ListCusCard(
              text: "Name :   ${e['first_name']}".replaceAll(RegExp(r':'), ''),
            ).paddingAll(5),
            ListCusCard(
              text:
                  "Department :   $department".replaceAll(RegExp(r':'), ''),
            ).paddingAll(5),
            ListCusCard(
              text: "Position :   $position".replaceAll(RegExp(r':'), ''),
            ).paddingAll(5),
            ListCusCard(
              text: "Mobile :   $mobile".replaceAll(RegExp(r':'), ''),
            ).paddingAll(5),
            ListCusCard(
              text: "Email :   $email".replaceAll(RegExp(r':'), ''),
            ).paddingAll(5),
            Visibility(
              // visible: ,
              child: ListCusCard(
                onTap: (){

                },
                text: "Click to show bank details",
              ).paddingAll(5),
            ),

            Visibility(
               visible: true,
              child: Column(
                children: [
                  ListCusCard(
                    text: "Bank Name :   $bankName".replaceAll(RegExp(r':'), ''),
                  ).paddingAll(5),
                  ListCusCard(
                    text: "Account No :   $bankAcc".replaceAll(RegExp(r':'), ''),
                  ).paddingAll(5),
                  ListCusCard(
                    text: "ISBN :   $isbn".replaceAll(RegExp(r':'), ''),
                  ).paddingAll(5),
                  ListCusCard(
                    text: "Swift Code :   $swift".replaceAll(RegExp(r':'), ''),
                  ).paddingAll(5),
                ],
              ),
            ),
            ListCusCard(
              text: "Date Of  join :   $doj".replaceAll(RegExp(r':'), ''),
            ).paddingAll(5),
            Visibility(
              visible: context.read<ProfileVm>().enable == true,
              child: CusButton(
                  text: "Submit",
                  onTap: () {
                    context.read<ProfileVm>().onSubmit();
                  }).paddingSymmetric(horizontal: 10, vertical: 10),
            ),
          ],
        ).paddingSymmetric(vertical: 10),
      ),
    );
  }
}
