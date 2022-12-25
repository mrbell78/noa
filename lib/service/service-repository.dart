import 'package:dio/dio.dart';
import 'package:noa/http-service/api_response.dart';
import 'package:noa/http-service/http-service.dart';
import 'package:noa/locator/locator.dart';
import 'package:noa/utils/api-constant.dart';

import 'model/body/noa-service-input.dart';
import 'model/body/servicelist-response-data.dart';
import 'model/custom-inpput-responsedata.dart';
import 'model/upload-responsedata.dart';

class ServiceRepository{


  var _httpService = locator<HttpService>();


  Future<ApiResponse<List<CustomInputResponseData?>>> serViceInput(BodyServiceInput data) async {

    var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.NOA_SERVICE,data: data.toJson());


    List<CustomInputResponseData> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            CustomInputResponseData.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }

  Future<ApiResponse<UploadImageResponseData>> upLoadImage(FormData fdata) async {
    print("upload method is called");

    var apiResponse = await _httpService.postRequesturlencoded(ApiConstant.SERVER+ApiConstant.UPLOAD_SERVICE_IMAGE,

        data: fdata
    );

    return ApiResponse(httpCode: apiResponse.httpCode, message: "success", data: UploadImageResponseData.fromJson(apiResponse.data.data));




  }

  Future<ApiResponse<List<ServiceListResponseData?>>> serviceList( String  tempid) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.SERVICE_LIST,qp: {"temp":tempid});


    List<ServiceListResponseData> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            ServiceListResponseData.fromJson(element),
          );
        },
      );
    }

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:list
    );

  }

}