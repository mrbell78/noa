// To parse this JSON data, do
//
//     final bodyRegistrationData = bodyRegistrationDataFromJson(jsonString);

import 'dart:convert';

BodyRegistrationData bodyRegistrationDataFromJson(String str) => BodyRegistrationData.fromJson(json.decode(str));

String bodyRegistrationDataToJson(BodyRegistrationData data) => json.encode(data.toJson());

class BodyRegistrationData {
  BodyRegistrationData({
    required this.customerId,
    required this.userName,
    required this.firstName,
    required  this.email,
    required this.phoneNo,
    required this.password,

  });

  int customerId;
  String userName;
  String firstName;
  String email;
  String phoneNo;
  String password;


  factory BodyRegistrationData.fromJson(Map<String, dynamic> json) => BodyRegistrationData(
    customerId: json["customerId"],
    userName: json["userName"],
    firstName: json["firstName"],
    email: json["email"],
    phoneNo: json["phoneNo"],
    password: json["password"],

  );

  Map<String, dynamic> toJson() => {
    "customerId": customerId,
    "userName": userName,
    "firstName": firstName,
    "email": email,
    "phoneNo": phoneNo,
    "password": password,
  };
}
