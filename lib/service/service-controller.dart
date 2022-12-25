
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:noa/locator/locator.dart';
import 'package:noa/login-registration/model/custommer-login.dart';
import 'package:noa/service/service-repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'model/body/noa-service-input.dart';
import 'model/body/noa-service-input.dart' as custommerreq;
import 'model/body/servicelist-response-data.dart';
import 'model/custom-inpput-responsedata.dart';
import 'model/upload-responsedata.dart';

class ServiceController extends ChangeNotifier{

  var _service_repo = locator<ServiceRepository>();
  CustommerLogin? custommerLogin;
  List<CustomInputResponseData?> customInputResponsedata=[];

  List<custommerreq.CustomInputDataRequestModels> csdata=[];

  List<TextEditingController> mycontroller=[];
  List<String> imagedata=[];
  List<ServiceListResponseData?>serviceList=[];

  UploadImageResponseData? uploadImagedata;
var data2;

String imurl="";
  postServiceInput()async{
    var custommerRequest = custommerreq.CustomInputDataRequestModels(
      name: "string",
      customInputDataId: 0,
      cartId: 0,
      invoiceMasterId: 0,
      invoiceDetailsId: 0,
      customInputId: 0,
      value: "",
      customerId: 0,
      tempId: "",
      values: [""]
    );
     var data = BodyServiceInput(
      name:  "NoaService",
      customInputDataRequestModels: [
        custommerRequest
      ]
    );

    var apiresponse = await _service_repo.serViceInput(data2!=null?data2:data);

    if(apiresponse.httpCode==200){
      customInputResponsedata.clear();
      customInputResponsedata.addAll(apiresponse.data);
      print("the dynamic size ${customInputResponsedata.length}");
      
      customInputResponsedata.forEach((element) {
        mycontroller.add(TextEditingController());
        
      });

    }


    notifyListeners();
  }

  Future<bool> upLoadProfileImage(fdata)async{
    var apiresponse  =await _service_repo.upLoadImage(fdata);
    notifyListeners();
    print("api response data ${apiresponse.data.data.list}");
    if(apiresponse.httpCode==200){
      uploadImagedata=apiresponse.data;
      imagedata.addAll(uploadImagedata!.data.list);
      return true;
    }else return false;

  }

  Future<List<ServiceListResponseData?>> getServiceList()async{

    await getTemptId().then((value)async{


      print("TemptId: ${value}");
      var apiresponse = await _service_repo.serviceList(value);
      if(apiresponse.httpCode==200){
        serviceList.clear();
        serviceList.addAll(apiresponse.data);
        print("total length of service list ${serviceList.length}");

      }
    } );


    notifyListeners();
    return serviceList;
  }



  Future<String> getTemptId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int counter = (prefs.getInt('counter') ?? 0) ;
    print('tempid is $counter');

    if(counter!=null && counter>0){
      return counter.toString();
    }else {
      int newTemtId = createTempId();

      setTemptId(newTemtId);

      return newTemtId.toString();
    }

  }
  setTemptId(int counter) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setInt('counter', counter);
  }
  int createTempId(){
    /*   Random random = new Random();
    int randomNumber = random.nextInt(100);
    return randomNumber;*/


    int min = 100000; //min and max values act as your 6 digit range
    int max = 999999;
    var randomizer = new Random();
    int rNum = min + randomizer.nextInt(max - min);

    print(rNum);
    return rNum;
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