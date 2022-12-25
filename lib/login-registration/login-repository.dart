import 'dart:convert';

import 'package:noa/http-service/api_response.dart';
import 'package:noa/http-service/http-service.dart';
import 'package:noa/locator/locator.dart';
import 'package:noa/utils/api-constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/body-data/registration-body.dart';
import 'model/custommer-login.dart';
import 'model/registration-model.dart';

class LoginRepository{

  var _httpService = locator<HttpService>();

  Future<ApiResponse<CustommerLogin?>> userLogin(String userName, String password,bool isRember) async {

    var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.LOGIN,
        data: {
          "userName":userName,
          "password":password,
          "isRemimber":isRember
        }
    );

    if(apiResponse.httpCode==200){
      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString('logininfo', jsonEncode(apiResponse.data.data)).then((value) {
        print("login info saved");
      });


    }
    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data:CustommerLogin.fromJson(apiResponse.data.data)
    );

  }


  Future<ApiResponse<dynamic>> postRegistration(BodyRegistrationData data) async {

    var apiResponse = await _httpService.postRequest(ApiConstant.SERVER+ApiConstant.REGISTRATION_POST,
        data: data.toJson()
    );

    return ApiResponse(
        httpCode: apiResponse.httpCode,
        message: apiResponse.message,
        data: apiResponse.data.data
    );

  }


}