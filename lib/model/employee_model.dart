import 'dart:convert';

EmployeeModel employeeModelFromJson(String str) =>
    EmployeeModel.fromJson(json.decode(str));
String employeeModelToJson(EmployeeModel data) => json.encode(data.toJson());

class EmployeeModel {
  EmployeeModel({
    this.id,
    this.empNumber,
    this.userId,
    this.firstName,
    this.middleName,
    this.lastName,
    this.gender,
    this.department,
    this.designation,
    this.martialStatus,
    this.mobile,
    this.altPhone,
    this.email,
    this.passportNo,
    this.nationality,
    this.poi,
    this.photo,
    this.placeOfBirth,
    this.breakTime,
    this.workingHours,
    this.dob,
    this.doj,
    this.cAddress,
    this.rAddress,
    this.leaveCount,
    this.salary,
    this.bankDetails,
    this.ppExpiry,
    this.idExpiry,
    this.visaExpiry,
    this.dlExpiry,
    this.emiratesId,
    this.drivingLNo,
  });

  EmployeeModel.fromJson(dynamic json) {
    id = json['_id'];
    empNumber = json['emp_number'];
    userId = json['user_id'];
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    gender = json['gender'];
    department = json['department'] != null
        ? Department.fromJson(json['department'])
        : null;
    designation = json['designation'] != null
        ? Designation.fromJson(json['designation'])
        : null;
    martialStatus = json['martial_status'];
    mobile = json['mobile'];
    altPhone = json['alt_phone'];
    email = json['email'];
    passportNo = json['passport_no'];
    nationality = json['nationality'];
    poi = json['poi'];
    photo = json['photo'];
    placeOfBirth = json['place_of_birth'];
    breakTime = json['break_time'];
    workingHours = json['working_hours'];
    dob = json['dob'];
    doj = json['doj'];
    cAddress = json['c_address'];
    rAddress = json['r_address'];
    leaveCount = json['leave_count'];
    salary = json['salary'] != null ? Salary.fromJson(json['salary']) : null;
    bankDetails = json['bank_details'] != null
        ? BankDetails.fromJson(json['bank_details'])
        : null;
    ppExpiry = json['pp_expiry'];
    idExpiry = json['id_expiry'];
    visaExpiry = json['visa_expiry'];
    dlExpiry = json['dl_expiry'];
    emiratesId = json['emirates_id'];
    drivingLNo = json['drivingl_no'];
  }
  String? id;
  String? empNumber;
  String? userId;
  String? firstName;
  dynamic middleName;
  String? lastName;
  String? gender;
  Department? department;
  Designation? designation;
  String? martialStatus;
  String? mobile;
  String? altPhone;
  String? email;
  dynamic passportNo;
  String? nationality;
  dynamic poi;
  dynamic photo;
  String? placeOfBirth;
  String? breakTime;
  String? workingHours;
  String? dob;
  String? doj;
  String? cAddress;
  String? rAddress;
  int? leaveCount;
  Salary? salary;
  BankDetails? bankDetails;
  String? ppExpiry;
  String? idExpiry;
  String? visaExpiry;
  String? dlExpiry;
  dynamic emiratesId;
  dynamic drivingLNo;
  EmployeeModel copyWith({
    String? id,
    String? empNumber,
    String? userId,
    String? firstName,
    dynamic middleName,
    String? lastName,
    String? gender,
    Department? department,
    Designation? designation,
    String? martialStatus,
    String? mobile,
    String? altPhone,
    String? email,
    dynamic passportNo,
    String? nationality,
    dynamic poi,
    dynamic photo,
    String? placeOfBirth,
    String? breakTime,
    String? workingHours,
    String? dob,
    String? doj,
    String? cAddress,
    String? rAddress,
    int? leaveCount,
    Salary? salary,
    BankDetails? bankDetails,
    String? ppExpiry,
    String? idExpiry,
    String? visaExpiry,
    String? dlExpiry,
    dynamic emiratesId,
    dynamic drivinglNo,
  }) =>
      EmployeeModel(
        id: id ?? this.id,
        empNumber: empNumber ?? this.empNumber,
        userId: userId ?? this.userId,
        firstName: firstName ?? this.firstName,
        middleName: middleName ?? this.middleName,
        lastName: lastName ?? this.lastName,
        gender: gender ?? this.gender,
        department: department ?? this.department,
        designation: designation ?? this.designation,
        martialStatus: martialStatus ?? this.martialStatus,
        mobile: mobile ?? this.mobile,
        altPhone: altPhone ?? this.altPhone,
        email: email ?? this.email,
        passportNo: passportNo ?? this.passportNo,
        nationality: nationality ?? this.nationality,
        poi: poi ?? this.poi,
        photo: photo ?? this.photo,
        placeOfBirth: placeOfBirth ?? this.placeOfBirth,
        breakTime: breakTime ?? this.breakTime,
        workingHours: workingHours ?? this.workingHours,
        dob: dob ?? this.dob,
        doj: doj ?? this.doj,
        cAddress: cAddress ?? this.cAddress,
        rAddress: rAddress ?? this.rAddress,
        leaveCount: leaveCount ?? this.leaveCount,
        salary: salary ?? this.salary,
        bankDetails: bankDetails ?? this.bankDetails,
        ppExpiry: ppExpiry ?? this.ppExpiry,
        idExpiry: idExpiry ?? this.idExpiry,
        visaExpiry: visaExpiry ?? this.visaExpiry,
        dlExpiry: dlExpiry ?? this.dlExpiry,
        emiratesId: emiratesId ?? this.emiratesId,
        drivingLNo: drivinglNo ?? this.drivingLNo,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['_id'] = id;
    map['emp_number'] = empNumber;
    map['user_id'] = userId;
    map['first_name'] = firstName;
    map['middle_name'] = middleName;
    map['last_name'] = lastName;
    map['gender'] = gender;
    if (department != null) {
      map['department'] = department?.toJson();
    }
    if (designation != null) {
      map['designation'] = designation?.toJson();
    }
    map['martial_status'] = martialStatus;
    map['mobile'] = mobile;
    map['alt_phone'] = altPhone;
    map['email'] = email;
    map['passport_no'] = passportNo;
    map['nationality'] = nationality;
    map['poi'] = poi;
    map['photo'] = photo;
    map['place_of_birth'] = placeOfBirth;
    map['break_time'] = breakTime;
    map['working_hours'] = workingHours;
    map['dob'] = dob;
    map['doj'] = doj;
    map['c_address'] = cAddress;
    map['r_address'] = rAddress;
    map['leave_count'] = leaveCount;
    if (salary != null) {
      map['salary'] = salary?.toJson();
    }
    if (bankDetails != null) {
      map['bank_details'] = bankDetails?.toJson();
    }
    map['pp_expiry'] = ppExpiry;
    map['id_expiry'] = idExpiry;
    map['visa_expiry'] = visaExpiry;
    map['dl_expiry'] = dlExpiry;
    map['emirates_id'] = emiratesId;
    map['drivingl_no'] = drivingLNo;
    return map;
  }
}

BankDetails bankDetailsFromJson(String str) =>
    BankDetails.fromJson(json.decode(str));
String bankDetailsToJson(BankDetails data) => json.encode(data.toJson());

class BankDetails {
  BankDetails({
    this.holderName,
    this.bankName,
    this.accNumber,
    this.isbnNum,
    this.swiftCode,
  });

  BankDetails.fromJson(dynamic json) {
    holderName = json['holder_name'];
    bankName = json['bank_name'];
    accNumber = json['acc_number'];
    isbnNum = json['isbn_num'];
    swiftCode = json['swift_code'];
  }
  String? holderName;
  String? bankName;
  String? accNumber;
  String? isbnNum;
  String? swiftCode;
  BankDetails copyWith({
    String? holderName,
    String? bankName,
    String? accNumber,
    String? isbnNum,
    String? swiftCode,
  }) =>
      BankDetails(
        holderName: holderName ?? this.holderName,
        bankName: bankName ?? this.bankName,
        accNumber: accNumber ?? this.accNumber,
        isbnNum: isbnNum ?? this.isbnNum,
        swiftCode: swiftCode ?? this.swiftCode,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['holder_name'] = holderName;
    map['bank_name'] = bankName;
    map['acc_number'] = accNumber;
    map['isbn_num'] = isbnNum;
    map['swift_code'] = swiftCode;
    return map;
  }
}

Salary salaryFromJson(String str) => Salary.fromJson(json.decode(str));
String salaryToJson(Salary data) => json.encode(data.toJson());

class Salary {
  Salary({
    this.basicSalary,
    this.totalSalary,
  });

  Salary.fromJson(dynamic json) {
    basicSalary = json['basic_salary'];
    totalSalary = json['total_salary'];
  }
  int? basicSalary;
  int? totalSalary;
  Salary copyWith({
    int? basicSalary,
    int? totalSalary,
  }) =>
      Salary(
        basicSalary: basicSalary ?? this.basicSalary,
        totalSalary: totalSalary ?? this.totalSalary,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['basic_salary'] = basicSalary;
    map['total_salary'] = totalSalary;
    return map;
  }
}

Designation designationFromJson(String str) =>
    Designation.fromJson(json.decode(str));
String designationToJson(Designation data) => json.encode(data.toJson());

class Designation {
  Designation({
    this.id,
    this.name,
  });

  Designation.fromJson(dynamic json) {
    id = json['_id'] != null ? DesignationId.fromJson(json['_id']) : null;
    name = json['name'];
  }
  DesignationId? id;
  String? name;
  Designation copyWith({
    DesignationId? id,
    String? name,
  }) =>
      Designation(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['_id'] = id?.toJson();
    }
    map['name'] = name;
    return map;
  }
}

DesignationId designationIdFromJson(String str) =>
    DesignationId.fromJson(json.decode(str));
String designationIdToJson(DesignationId data) => json.encode(data.toJson());

class DesignationId {
  DesignationId({
    this.oid,
  });

  DesignationId.fromJson(dynamic json) {
    oid = json['$oid'];
  }
  String? oid;
  DesignationId copyWith({
    String? oid,
  }) =>
      DesignationId(
        oid: oid ?? this.oid,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$oid'] = oid;
    return map;
  }
}

Department departmentFromJson(String str) =>
    Department.fromJson(json.decode(str));
String departmentToJson(Department data) => json.encode(data.toJson());

class Department {
  Department({
    this.id,
    this.name,
  });

  Department.fromJson(dynamic json) {
    id = json['_id'] != null ? DesignationId.fromJson(json['_id']) : null;
    name = json['name'];
  }
  DesignationId? id;
  String? name;
  Department copyWith({
    DesignationId? id,
    String? name,
  }) =>
      Department(
        id: id ?? this.id,
        name: name ?? this.name,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (id != null) {
      map['_id'] = id?.toJson();
    }
    map['name'] = name;
    return map;
  }
}

DesignationId departmentIdFromJson(String str) =>
    DesignationId.fromJson(json.decode(str));
String departmentIdToJson(DesignationId data) => json.encode(data.toJson());

class DepartmentId {
  DepartmentId({
    this.oid,
  });

  DepartmentId.fromJson(dynamic json) {
    oid = json['$oid'];
  }
  String? oid;
  DepartmentId copyWith({
    String? oid,
  }) =>
      DepartmentId(
        oid: oid ?? this.oid,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['$oid'] = oid;
    return map;
  }
}
