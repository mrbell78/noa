import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/product/product-controller.dart';
import 'package:noa/profile/profile-controller.dart';

import 'package:provider/provider.dart';

import 'model/bodydata/body-add-address.dart';


class EditProfile extends StatelessWidget{

  int customerId;

  EditProfile(this.customerId);

  TextEditingController fullName = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController homeAddress = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController address2 = TextEditingController();
  bool validateName=false;


  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(

      builder: (context,provider,child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.pureWhite,
            leading:InkWell(
              onTap: (){
                Navigator.pop(context);
              },
              child: Container(
                margin: EdgeInsets.all(12),
                height: 15,
                width:15,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.Blue077C9E
                ),
                child: Center(child: Image.asset("assets/images/ic-back-noa-white.png",height: 15,width: 15,)),
              ),
            ),
            title: Text("Edit Profile",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w600),),
            centerTitle: true,
          ),
          body: Column(
            children: [
              SizedBox(height: 20,),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    Container(
                        child:Image.asset("assets/images/ic-profile.png")

                    ),
                    SizedBox(width: 8,),
                    Text("Full Name",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: fullName,
                  style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                  decoration: InputDecoration(
                      hintText: "admin",
                      suffixIcon: Image.asset("assets/images/ic-edit.png"),
                      hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                      contentPadding: EdgeInsets.all(5),
                      errorText: validateName? 'Name Can\'t Be Empty':null
                  ),
                ),
              ),

              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    Container(
                        child:Image.asset("assets/images/ic-mail.png")

                    ),
                    SizedBox(width: 8,),
                    Text("Email",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  controller: mail,
                  style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                  decoration: InputDecoration(
                      hintText: "admin@gmail.com",
                      suffixIcon: Image.asset("assets/images/ic-edit.png"),
                      hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                      contentPadding: EdgeInsets.only(top: 20),
                      errorText: validateName? 'Name Can\'t Be Empty':null
                  ),
                ),
              ),


              SizedBox(height: 20,),

              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: Row(
                  children: [
                    Container(
                        child:Image.asset("assets/images/ic-phone.png")

                    ),
                    SizedBox(width: 8,),
                    Text("Mobile Number",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: mobileNumber,
                  style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                  decoration: InputDecoration(
                      hintText: "163265",
                      suffixIcon: Image.asset("assets/images/ic-edit.png"),
                      hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                      contentPadding: EdgeInsets.all(5),
                      errorText: validateName? 'Name Can\'t Be Empty':null
                  ),
                ),
              ),
              SizedBox(height: 20,),
             Spacer(),
              Container(
                width: double.infinity,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                  color: AppColors.pureWhite,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],

                ),
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    Expanded(
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(100)
                          ),
                          color: AppColors.LightRedFAF2EE,
                          border: Border.all(color: AppColors.DeepYelowF37226,width: 1)
                        ),
                        child: Center(child: Text("Cancel",style: TextStyle(color: AppColors.DeepYelowF37226,fontSize: 15,fontWeight: FontWeight.w600),)),
                      ),
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        height: 52,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(100)
                            ),
                            color: AppColors.Blue077C9E,

                        ),
                        child: Center(child: Text("Update",style: TextStyle(color: AppColors.pureWhite,fontSize: 15,fontWeight: FontWeight.w600),)),
                      ),
                    ),
                    SizedBox(width: 10,),

                  ],
                ),

              )

            ],
          ),
        );
      },

    );
  }

}