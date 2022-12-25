class ServiceListResponseData {
  final int? customInputDataId;
  final dynamic cartId;
  final int? invoiceMasterId;
  final int? invoiceDetailsId;
  final int? customInputId;
  final String? value;
  final int? customerId;
  final String? name;
  final String? tempId;
  final dynamic values;

  ServiceListResponseData({
    this.customInputDataId,
    this.cartId,
    this.invoiceMasterId,
    this.invoiceDetailsId,
    this.customInputId,
    this.value,
    this.customerId,
    this.name,
    this.tempId,
    this.values,
  });

  ServiceListResponseData.fromJson(Map<String, dynamic> json)
      : customInputDataId = json['customInputDataId'] as int?,
        cartId = json['cartId'],
        invoiceMasterId = json['invoiceMasterId'] as int?,
        invoiceDetailsId = json['invoiceDetailsId'] as int?,
        customInputId = json['customInputId'] as int?,
        value = json['value'] as String?,
        customerId = json['customerId'] as int?,
        name = json['name'] as String?,
        tempId = json['tempId'] as String?,
        values = json['values'];

  Map<String, dynamic> toJson() => {
    'customInputDataId' : customInputDataId,
    'cartId' : cartId,
    'invoiceMasterId' : invoiceMasterId,
    'invoiceDetailsId' : invoiceDetailsId,
    'customInputId' : customInputId,
    'value' : value,
    'customerId' : customerId,
    'name' : name,
    'tempId' : tempId,
    'values' : values
  };
}