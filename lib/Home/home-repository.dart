import 'package:noa/http-service/api_response.dart';
import 'package:noa/http-service/http-service.dart';
import 'package:noa/locator/locator.dart';

import 'package:noa/utils/api-constant.dart';

import 'model/parent-category-response-data.dart';
import 'model/store-list-response-data.dart';

class HomeRepository{


  var _httpService = locator<HttpService>();


  Future<ApiResponse<List<ParentCategory?>>> getProductParentCategory(int languageId) async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.PRODUCT_PARENT_CATEGORY+"/${languageId}",);


    List<ParentCategory> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            ParentCategory.fromJson(element),
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

  Future<ApiResponse<List<StoreListResponseData?>>> getAllStoreList() async {

    var apiResponse = await _httpService.getRequest(ApiConstant.SERVER+ApiConstant.STORE_LIST,

    );


    List<StoreListResponseData> list = List.empty(growable: true);

    if (apiResponse.httpCode == 200 &&
        apiResponse.data.data is List) {
      (apiResponse.data.data as List).forEach(
            (element) {
          list.add(
            StoreListResponseData.fromJson(element),
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