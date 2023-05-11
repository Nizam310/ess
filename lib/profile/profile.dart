import 'package:employee_self_service_flutter/common_widgets/text_field.dart';
import 'package:employee_self_service_flutter/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c) => ProfileVm(),
      child: Consumer<ProfileVm>(builder: (context, data, _) {
        final shape = RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(width: 0.3, color: Colors.grey.shade500),
        );
        const textStyle = TextStyle(fontSize: 13, color: Colors.black54);
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                  width: 100,
                  height: 100,
                  child: CircleAvatar(
                    backgroundColor: Colors.grey[300],
                    child: const Icon(Icons.person),
                  )).paddingBottom(10),
              CusTextField(
                controller: data.name,
                onChanged: (v) {},
                hintText: "Name",
              ).paddingAll(10),
              CusTextField(
                controller: data.position,
                onChanged: (v) {},
                hintText: "Position",
              ).paddingAll(10),
              CusTextField(
                controller: data.mob,
                onChanged: (v) {},
                hintText: "Mobile",
              ).paddingAll(10),
              ListTile(
                shape: shape,
                tileColor: Colors.grey[50],
                title: const Text(
                  "Date Of join",
                  style: textStyle,
                ),
              ).paddingAll(10),
              ListTile(
                shape: shape,
                tileColor: Colors.grey[50],
                title: const Text(
                  "Years with company",
                  style: textStyle,
                ),
              ).paddingAll(10),
              /* CusTextField(
                controller: data.dateOfJoin,
                onChanged: (v) {},
                hintText: ,
              ).paddingAll(10),
              CusTextField(
                controller: data.yearsWithCompany,
                onChanged: (v) {},
                hintText: "years with company",
              ).paddingAll(10),*/
            ],
          ).paddingSymmetric(vertical: 10),
        );
      }),
    );
  }
}
