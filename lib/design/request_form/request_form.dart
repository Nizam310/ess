import 'package:employee_self_service_flutter/design/request_form/request_form_provider.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';

import '../../constant/enum.dart';
import '../common_widgets/button.dart';
import '../common_widgets/drop_down.dart';
import '../common_widgets/text_field.dart';
import '../dash_board/dash_board_provider.dart';

class RequestForm extends StatelessWidget {
  const RequestForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(color: Theme.of(context).colorScheme.primary);
    return ChangeNotifierProvider(
      create: (_) => RequestFormVm(),
      child: Consumer2<RequestFormVm, DashBoardVm>(
          builder: (context, data, dashData, _) {
        return SingleChildScrollView(
          child: Column(
            children: [
              CusDropdown<RequestType>(
                label: "Request Type",
                verPadding: 5,
                value: data.type,
                items: RequestType.values,
                itemBuilder: (type) => Text(type.name,style: style,),
                onChanged: (RequestType? value) {
                  if (value != null) data.type = value;
                  data.certifyType = null;
                  data.leaveType = null;
                  data.refresh();
                },
              ),
              Visibility(
                visible: data.type == RequestType.Certificates,
                child: Column(
                  children: [
                    Visibility(
                      visible: !(data.certifyType == "Other"),
                      child: CusDropdown<String>(
                        label: "Certificate Type",
                        verPadding: 5,
                        value: data.certifyType,
                        items: data.certificateTypeList,
                        itemBuilder: (type) => Text(type,style: style,),
                        onChanged: (String? value) {
                          if (value != null) {
                            data.certifyType = value;
                          }
                          data.refresh();
                        },
                      ),
                    ),
                    Visibility(
                      visible: data.certifyType == "Other",
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: CusTextField(
                                      controller: data.other,
                                      onChanged: (val) {})
                                  .paddingSymmetric(horizontal: 10)),
                          CusButton(
                              text: "Add",
                              onTap: () {
                                if (data.type == RequestType.Leave) {
                                  data.other.text == ""
                                      ? null
                                      : data.leaveTypeList.add(data.other.text);

                                  data.leaveType = data.leaveTypeList.last;
                                } else if (data.type ==
                                    RequestType.Certificates) {
                                  data.other.text == ""
                                      ? null
                                      : data.certificateTypeList
                                          .add(data.other.text);

                                  data.certifyType =
                                      data.certificateTypeList.last;
                                }
                                data.other.clear();
                                data.refresh();
                              }).paddingRight(11)
                        ],
                      ).paddingSymmetric(vertical: 5),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: data.type == RequestType.Leave,
                child: Column(
                  children: [
                    Card(shape:RoundedRectangleBorder(
                      side: BorderSide(color: Theme.of(context).colorScheme.primary),
                      borderRadius: BorderRadius.circular(10)
                    ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children:  [
                                Text("Available Leaves: 5",style: style),
                                Text("Leaves Taken: 5",style: style),
                              ],
                            ).paddingSymmetric(horizontal: 10, vertical: 10),
                          ),
                        ],
                      ),
                    ).paddingSymmetric(horizontal: 8, vertical: 5),
                    Visibility(
                      visible: !(data.leaveType == "Other"),
                      child: CusDropdown<String>(
                        label: "Leave Type",
                        verPadding: 5,
                        value: data.leaveType,
                        items: data.leaveTypeList,
                        itemBuilder: (type) => Text(type,style: style,),
                        onChanged: (String? value) {
                          if (value != null) {
                            data.leaveType = value;
                          }
                          data.refresh();
                        },
                      ),
                    ),
                    Visibility(
                      visible: (data.leaveType == "Other"),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                              child: CusTextField(
                                      hintText: "Leave type",
                                      controller: data.other,
                                      onChanged: (val) {})
                                  .paddingSymmetric(horizontal: 10)),
                          CusButton(
                              text: "Add",
                              onTap: () {
                                data.other.text == ""
                                    ? null
                                    : data.leaveTypeList.add(data.other.text);
                                data.leaveType = data.leaveTypeList.last;
                                data.refresh();
                              }).paddingRight(11)
                        ],
                      ).paddingSymmetric(vertical: 5),
                    ),
                    CusTextField(
                      controller: data.days,
                      onChanged: (val) {},
                      hintText: "How many days are you taking?",
                    ).paddingSymmetric(horizontal: 10, vertical: 5),
                    CusTextField(
                      controller: data.reason,
                      onChanged: (val) {},
                      maxLines: 3,
                      hintText: "Reason",
                    ).paddingSymmetric(horizontal: 10, vertical: 5),
                  ],
                ),
              ),
              CusButton(
                text: "Apply",
                onTap: () {
                  dashData.index = 0;
                  dashData.refresh();
                },
                // color: const red,
                // textColor: CupertinoColors.white,
                textSize: 13,
              ).paddingSymmetric(horizontal: 10, vertical: 10),
            ],
          ).paddingSymmetric(vertical: 5),
        );
      }),
    );
  }
}
