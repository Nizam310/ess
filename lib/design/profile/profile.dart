import 'package:employee_self_service_flutter/design/profile/profile_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../common_widgets/text_field.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (c) => ProfileVm(),
      child: Consumer<ProfileVm>(builder: (context, data, _) {
        /// textStyle

        const textStyle = TextStyle(
          fontSize: 13,
        );

        return SingleChildScrollView(
          child: Padding(
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
                  enabled: data.enable,
                  controller: data.name,
                  onChanged: (v) {},
                  hintText: "Name",
                ).paddingAll(10),
                CusTextField(
                  enabled: data.enable,
                  controller: data.position,
                  onChanged: (v) {},
                  hintText: "Position",
                ).paddingAll(10),
                CusTextField(
                  enabled: data.enable,
                  controller: data.mob,
                  onChanged: (v) {},
                  hintText: "Mobile",
                ).paddingAll(10),
              /*  Visibility(
                  visible: data.en==false,
                  child: CusButton(text: "Edit", onTap: (){
                    data.en =true;
                    data.refresh();
                  }).paddingSymmetric(horizontal: 10),
                ),
                Visibility(
                  visible: data.en==true,
                  child: CusButton(text: "Submit", onTap: (){
                    data.en = false;
                    data.refresh();
                  }).paddingSymmetric(horizontal: 10),
                ),*/
                const ListTile(
                  title: Text(
                    "Date Of  join :   ${"21/12/23"}",
                    style: textStyle,
                  ),
                ).paddingAll(10),
                const ListTile(
                  title: Text(
                    "Total years with company :  ${'5'}",
                    style: textStyle,
                  ),
                ).paddingAll(10),
              ],
            ).paddingSymmetric(vertical: 10),
          ),
        );
      }),
    );
  }
}
