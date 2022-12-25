// To parse this JSON data, do
//
//     final uploadImageResponseData = uploadImageResponseDataFromJson(jsonString);

import 'dart:convert';

UploadImageResponseData uploadImageResponseDataFromJson(String str) => UploadImageResponseData.fromJson(json.decode(str));

String uploadImageResponseDataToJson(UploadImageResponseData data) => json.encode(data.toJson());

class UploadImageResponseData {
  UploadImageResponseData({
    required this.data,
    required this.code,
    required this.message,
    required this.isSuccess,
  });

  Data data;
  int code;
  String message;
  bool isSuccess;

  factory UploadImageResponseData.fromJson(Map<String, dynamic> json) => UploadImageResponseData(
    data: Data.fromJson(json["data"]),
    code: json["code"],
    message: json["message"],
    isSuccess: json["isSuccess"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "code": code,
    "message": message,
    "isSuccess": isSuccess,
  };
}

class Data {
  Data({
    required this.list,
  });

  List<String> list;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    list: List<String>.from(json["list"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "list": List<String>.from(list.map((x) => x)),
  };
}
