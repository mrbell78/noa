
import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:noa/locator/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login-repository.dart';
import 'model/custommer-login.dart';
import 'model/registration-model.dart';

class CustommerLoginController extends ChangeNotifier{

  var _login_repo = locator<LoginRepository>();

  CustommerLogin ?custommerLogin;

  RegistrationResponseData? registrationResponseData;

  Future<bool>  postLogin(String userName,String password,bool isRemember)async{
    var apiresponse = await _login_repo.userLogin(userName,password,isRemember);
    if(apiresponse.httpCode==200){
      custommerLogin=apiresponse.data;

      return true;
    }else return false;
  }


  Future<bool>  postRegistration(data)async{
    var apiresponse = await _login_repo.postRegistration(data);
    if(apiresponse.httpCode==200){
     // registrationResponseData=apiresponse.data;
      return true;
    }else return false;
  }

  Future<bool> getUserData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String loginData = (prefs.getString('logininfo') ?? "") ;

    if(loginData!=null && loginData.isNotEmpty){

      print("the data is ${loginData}");

      Map<String,dynamic> mapdata= jsonDecode(loginData);
      custommerLogin  =CustommerLogin.fromJson(mapdata);
      notifyListeners();
      return true;

    }else return false;

  }

}