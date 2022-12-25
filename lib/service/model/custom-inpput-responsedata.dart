// To parse this JSON data, do
//
//     final customInputResponseData = customInputResponseDataFromJson(jsonString);

import 'dart:convert';

List<CustomInputResponseData> customInputResponseDataFromJson(String str) => List<CustomInputResponseData>.from(json.decode(str).map((x) => CustomInputResponseData.fromJson(x)));

String customInputResponseDataToJson(List<CustomInputResponseData> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CustomInputResponseData {
  CustomInputResponseData({
    required this.customInputDataId,
    this.cartId,
    this.invoiceMasterId,
    this.invoiceDetailsId,
    required this.customInputId,
    this.value,
    this.customerId,
    required this.name,
    this.tempId,
    this.values,
  });

  int customInputDataId;
  dynamic cartId;
  dynamic invoiceMasterId;
  dynamic invoiceDetailsId;
  int customInputId;
  dynamic value;
  dynamic customerId;
  String name;
  dynamic tempId;
  dynamic values;

  factory CustomInputResponseData.fromJson(Map<String, dynamic> json) => CustomInputResponseData(
    customInputDataId: json["customInputDataId"],
    cartId: json["cartId"],
    invoiceMasterId: json["invoiceMasterId"],
    invoiceDetailsId: json["invoiceDetailsId"],
    customInputId: json["customInputId"],
    value: json["value"],
    customerId: json["customerId"],
    name: json["name"],
    tempId: json["tempId"],
    values: json["values"],
  );

  Map<String, dynamic> toJson() => {
    "customInputDataId": customInputDataId,
    "cartId": cartId,
    "invoiceMasterId": invoiceMasterId,
    "invoiceDetailsId": invoiceDetailsId,
    "customInputId": customInputId,
    "value": value,
    "customerId": customerId,
    "name": name,
    "tempId": tempId,
    "values": values,
  };
}
