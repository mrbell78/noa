
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:noa/locator/locator.dart';
import 'package:noa/login-registration/model/custommer-login.dart';
import 'package:noa/truck-details/truck-repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home-repository.dart';
import 'model/parent-category-response-data.dart';
import 'model/store-list-response-data.dart';

class HomeController extends ChangeNotifier{


  bool isLoading=false;
  CustommerLogin? custommerLogin;

  var _store_repo = locator<HomeRepository>();
  List<StoreListResponseData?> storeList=[];
  List<ParentCategory?> parentCategoryList=[];
  getProductParentCategory(int  languageId,)async{
    isLoading=true;
    var apiresponse = await _store_repo.getProductParentCategory(languageId);

    if(apiresponse.httpCode==200){
      parentCategoryList.clear();
      parentCategoryList.addAll(apiresponse.data);
      isLoading=false;
    }

    notifyListeners();

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


  getAllStoreList()async{
    var apiresponse = await _store_repo.getAllStoreList();

    if(apiresponse.httpCode==200){
      storeList.clear();
      storeList.addAll(apiresponse.data);
      print("total store size is ${storeList.length}");

    }

    notifyListeners();

  }

}