class BodyAddAddress {
  final int? customerAddressId;
  final int? customerId;
  final String? addressType;
  final int? countryId;
  final int? stateId;
  final int? cityId;
  final String? address;
  final String? buildingName;
  final String? flatNo;
  final int? latitude;
  final int? longitude;
  final String? nearByLocation;
  final bool? isDefault;
  final dynamic status;
  final String? createdAt;
  final dynamic updatedAt;
  final dynamic countryName;
  final dynamic stateName;
  final dynamic cityName;
  final String? addressLine2;
  final String? zipCode;
  final String? phoneNumber;
  final dynamic customerViewModel;

  BodyAddAddress({
    this.customerAddressId,
    this.customerId,
    this.addressType,
    this.countryId,
    this.stateId,
    this.cityId,
    this.address,
    this.buildingName,
    this.flatNo,
    this.latitude,
    this.longitude,
    this.nearByLocation,
    this.isDefault,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.countryName,
    this.stateName,
    this.cityName,
    this.addressLine2,
    this.zipCode,
    this.phoneNumber,
    this.customerViewModel,
  });

  BodyAddAddress.fromJson(Map<String, dynamic> json)
      : customerAddressId = json['customerAddressId'] as int?,
        customerId = json['customerId'] as int?,
        addressType = json['addressType'] as String?,
        countryId = json['countryId'] as int?,
        stateId = json['stateId'] as int?,
        cityId = json['cityId'] as int?,
        address = json['address'] as String?,
        buildingName = json['buildingName'] as String?,
        flatNo = json['flatNo'] as String?,
        latitude = json['latitude'] as int?,
        longitude = json['longitude'] as int?,
        nearByLocation = json['nearByLocation'] as String?,
        isDefault = json['isDefault'] as bool?,
        status = json['status'],
        createdAt = json['createdAt'] as String?,
        updatedAt = json['updatedAt'],
        countryName = json['countryName'],
        stateName = json['stateName'],
        cityName = json['cityName'],
        addressLine2 = json['addressLine2'] as String?,
        zipCode = json['zipCode'] as String?,
        phoneNumber = json['phoneNumber'] as String?,
        customerViewModel = json['customerViewModel'];

  Map<String, dynamic> toJson() => {
    'customerAddressId' : customerAddressId,
    'customerId' : customerId,
    'addressType' : addressType,
    'countryId' : countryId,
    'stateId' : stateId,
    'cityId' : cityId,
    'address' : address,
    'buildingName' : buildingName,
    'flatNo' : flatNo,
    'latitude' : latitude,
    'longitude' : longitude,
    'nearByLocation' : nearByLocation,
    'isDefault' : isDefault,
    'status' : status,
    'createdAt' : createdAt,
    'updatedAt' : updatedAt,
    'countryName' : countryName,
    'stateName' : stateName,
    'cityName' : cityName,
    'addressLine2' : addressLine2,
    'zipCode' : zipCode,
    'phoneNumber' : phoneNumber,
    'customerViewModel' : customerViewModel
  };
}