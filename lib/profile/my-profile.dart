import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/profile/profile-controller.dart';
import 'package:noa/utils/nav_utils.dart';

import 'package:provider/provider.dart';

import 'edit-profile.dart';



class MyProfile extends StatefulWidget{

  int userId;
  MyProfile(this.userId);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isToggled =false;
  bool isToggled_notification =false;

  final ImagePicker _picker = ImagePicker();
  // Pick an image
  late final XFile? image;


  Future<XFile?> selectImage()async{
    final XFile ? selected = await _picker.pickImage(source: ImageSource.gallery);
    if(selected!=null && selected!.path.isNotEmpty){
      setState(() {
        //image=selected;
      });

      return selected;
    }else return null;
  }

  @override
  void initState() {
    Provider.of<ProfileController>(context, listen: false).getUserData().then((value) {
      print("the user id is ${ Provider.of<ProfileController>(context, listen: false).custommerLogin!.customerId}");
      Provider.of<ProfileController>(context, listen: false).getUserProfile();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileController>(
      builder: (context,provider,child){
        return Scaffold(
          backgroundColor: AppColors.pureWhite,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: AppColors.Blue077C9E,
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
                    color: AppColors.defaultblack
                ),
                child: Center(child: Image.asset("assets/images/ic-back-noa-white.png",height: 15,width: 15,)),
              ),
            ),
            title: Text("Asif Rahaman",style: TextStyle(color: AppColors.pureWhite,fontSize: 22,fontWeight: FontWeight.bold),),
            centerTitle: true,
          ),
          body: Column(
           crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 40,
                color: AppColors.Blue077C9E,
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text("Category Preference",style: TextStyle(color: AppColors.pureWhite,fontSize: 16,fontWeight: FontWeight.bold),),
                        Spacer(),
                        Container(
                          height: 20,
                          width: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: AppColors.pureWhite
                          ),
                          child: Image.asset("assets/images/ic-edit.png"),
                        ),
                        SizedBox(width: 20,)
                      ],
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Image.asset("assets/images/ic-appbar.png"),
                  Wrap(
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: AppColors.Blue077C9E,
                            border: Border.all(color: AppColors.pureWhite,width: 1)
                        ),
                        child: Center(
                          child: Text("Water",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: AppColors.Blue077C9E,
                            border: Border.all(color: AppColors.pureWhite,width: 1)
                        ),
                        child: Center(
                          child: Text("Laundry",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: AppColors.Blue077C9E,
                            border: Border.all(color: AppColors.pureWhite,width: 1)
                        ),
                        child: Center(
                          child: Text("HandyMan",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: AppColors.Blue077C9E,
                            border: Border.all(color: AppColors.pureWhite,width: 1)
                        ),
                        child: Center(
                          child: Text("Mini Market",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: AppColors.Blue077C9E,
                            border: Border.all(color: AppColors.pureWhite,width: 1)
                        ),
                        child: Center(
                          child: Text("Flower Shop",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: AppColors.Blue077C9E,
                            border: Border.all(color: AppColors.pureWhite,width: 1)
                        ),
                        child: Center(
                          child: Text("Plants",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: AppColors.Blue077C9E,
                            border: Border.all(color: AppColors.pureWhite,width: 1)
                        ),
                        child: Center(
                          child: Text("Meat Shop",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: AppColors.Blue077C9E,
                            border: Border.all(color: AppColors.pureWhite,width: 1)
                        ),
                        child: Center(
                          child: Text("Fish",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w600),),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        width: 60,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(60)),
                            color: AppColors.Blue077C9E,
                            border: Border.all(color: AppColors.pureWhite,width: 1)
                        ),
                        child: Center(
                          child: Text("Fuel",style: TextStyle(color: AppColors.pureWhite,fontSize: 10,fontWeight: FontWeight.w600),),
                        ),
                      ),

                    ],
                    spacing: 5,
                    runSpacing: 3,
                  )
                ],
              ),
              SizedBox(height: 60,),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.pureWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius:2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ]

                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text("My Profile",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 20,fontWeight: FontWeight.bold),),
                        Spacer(),
                        GestureDetector(
                          onTap: (){
                            NavUtils.push(context, EditProfile(widget.userId));
                          },
                          child: Container(
                            height: 20,
                            width: 20,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(100)),
                                color: AppColors.Blue077C9E
                            ),
                            child: Image.asset("assets/images/ic-noa-edit-white.png"),
                          ),
                        ),

                      ],
                    ),

                    SizedBox(height: 15,),

                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.grayFAFAFA,

                      ),
                      child: Column(
                        children: [

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
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Row(
                              children: [


                                Text("${provider.userProfile?.userName}",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          SizedBox(height: 5,),

                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,),

                          ),


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
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Row(
                              children: [


                                Text("${provider.userProfile?.email}",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          SizedBox(height: 5,),

                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,),

                          ),

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
                          SizedBox(height: 10,),
                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Row(
                              children: [


                                Text("${provider.userProfile?.customerAddressViewModel?.phoneNumber}",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                              ],
                            ),
                          ),
                          SizedBox(height: 5,),

                          Container(
                            margin: EdgeInsets.only(left: 20,right: 20),
                            child: Divider(color: AppColors.grayDBDBDB,thickness: 1,),

                          ),

                          SizedBox(height: 5,),

                        ],
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Container(
                margin: EdgeInsets.only(left: 20),
                child:  Text("Reset Password",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 10,),
              Container(
                height: 40,
                margin: EdgeInsets.only(left: 28,right: 20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: AppColors.grayFAFAFA
                ),
                child:  Center(
                  child: Row(
                    children: [
                      SizedBox(width: 8,),
                      Text("Reset Now",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                      Spacer(),
                     Image.asset("assets/images/ic-arrow-right-black.png"),
                      SizedBox(width: 5,),
                    ],
                  ),
                ),
              ),
            ],
          ),

        );
      },

    );
  }
}