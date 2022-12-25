class BodyServiceInput {
  final String? name;
  final List<CustomInputDataRequestModels>? customInputDataRequestModels;

  BodyServiceInput({
    this.name,
    this.customInputDataRequestModels,
  });

  BodyServiceInput.fromJson(Map<String, dynamic> json)
      : name = json['name'] as String?,
        customInputDataRequestModels = (json['customInputDataRequestModels'] as List?)?.map((dynamic e) => CustomInputDataRequestModels.fromJson(e as Map<String,dynamic>)).toList();

  Map<String, dynamic> toJson() => {
    'name' : name,
    'customInputDataRequestModels' : customInputDataRequestModels?.map((e) => e.toJson()).toList()
  };
}

class CustomInputDataRequestModels {
  final int? customInputDataId;
  final int? cartId;
  final int? invoiceMasterId;
  final int? invoiceDetailsId;
  final int? customInputId;
  final String? value;
  final int? customerId;
  final String? name;
  final String? tempId;
  final List<String>? values;

  CustomInputDataRequestModels({
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

  CustomInputDataRequestModels.fromJson(Map<String, dynamic> json)
      : customInputDataId = json['customInputDataId'] as int?,
        cartId = json['cartId'] as int?,
        invoiceMasterId = json['invoiceMasterId'] as int?,
        invoiceDetailsId = json['invoiceDetailsId'] as int?,
        customInputId = json['customInputId'] as int?,
        value = json['value'] as String?,
        customerId = json['customerId'] as int?,
        name = json['name'] as String?,
        tempId = json['tempId'] as String?,
        values = (json['values'] as List?)?.map((dynamic e) => e as String).toList();

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