import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../api/api.dart';
import '../../model/employee_model.dart';

class EmployeeDashVm extends ChangeNotifier {
  List<EmployeeModel> list = [];
  Response? res;
  EmployeeModel? model;
  bool c = false;
  Future<dynamic> getData() async {
    String url = 'https://app-dev.cloudmesoft.com/hrm/api/employee_details_api';
    String token = 'c5fQiLGSGItfRxq6kv6DVtaux1T0AjYqiSkUW9G1';

    try {
      final response = await Api.get(url, token);
      res = response;
      if (response?.statusCode == 200) {
        List<dynamic> responseData = response?.data['data'];
        if (responseData.isNotEmpty) {
          EmployeeModel employee = EmployeeModel.fromJson(responseData[0]);
          list.add(employee);
          model = employee;
        }
      } else {
        if (kDebugMode) {
          print('Problem!!!!!!!!!');
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
    notifyListeners();
  }

  EmployeeDashVm() {
    getData();
  }
}
