
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/profile/my-orders.dart';
import 'package:noa/profile/my-profile.dart';
import 'package:noa/profile/profile-controller.dart';
import 'package:noa/utils/nav_utils.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerCustom extends StatefulWidget{

  final custommerId;

  DrawerCustom(this.custommerId);

  @override
  State<DrawerCustom> createState() => _DrawerCustomState();
}

class _DrawerCustomState extends State<DrawerCustom> {
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

      print("the custommer id is ${ Provider.of<ProfileController>(context, listen: false).custommerLogin!.customerId}");

      Provider.of<ProfileController>(context, listen: false).getUserProfile();



    });
    super.initState();
  }



  @override
  Widget build(BuildContext context) {

    return Consumer<ProfileController>(

      builder: (ctx,provider,child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.Blue077C9E,
            elevation: 0.0,
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
          actions: [
            InkWell(
                onTap: (){
                  Navigator.pop(context);
                },
                child: Image.asset("assets/images/ic-close-white.png"))
          ],
          ),

          body: Column(
            children: [

              Image.asset("assets/images/ic-appbar.png"),

              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [

                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                          Navigator.pop(context,true);
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-home-coilored.png"),
                            SizedBox(width: 20,),
                            Text("Home",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                            NavUtils.push(context, MyOrders(provider.custommerLogin!.customerId));
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-package-colored.png"),
                            SizedBox(width: 20,),
                            Text("My Orders",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                            NavUtils.push(context, MyProfile(provider.custommerLogin!.customerId));
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-profile-colored.png"),
                            SizedBox(width: 20,),
                            Text("Profile",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),


                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                          //  NavUtils.push(context, MyProfile());
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-list-colored.png"),
                            SizedBox(width: 20,),
                            Text("Preference",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                          //  NavUtils.push(context, MyProfile());
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-notification-colored.png"),
                            SizedBox(width: 20,),
                            Text("Notification",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                          //  NavUtils.push(context, MyProfile());
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-workflow-colored.png"),
                            SizedBox(width: 20,),
                            Text("How It works",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                          //  NavUtils.push(context, MyProfile());
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-deal-colored.png"),
                            SizedBox(width: 20,),
                            Text("Partners",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                          //  NavUtils.push(context, MyProfile());
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-location-colored.png"),
                            SizedBox(width: 20,),
                            Text("Address Book",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),


                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                          //  NavUtils.push(context, MyProfile());
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-payment-colored.png"),
                            SizedBox(width: 20,),
                            Text("Payment Method",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),


                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                          //  NavUtils.push(context, MyProfile());
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-love-colored.png"),
                            SizedBox(width: 20,),
                            Text("Wish List",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),

                    InkWell(
                      onTap: (){
                        if(provider.custommerLogin!.customerId!=null){
                          //  NavUtils.push(context, MyProfile());
                        }else{
                          Fluttertoast.showToast(
                              msg: "You are not loged in",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.BlueF2FAFF,
                            border:Border.all(color: AppColors.Blue276184)
                          //color: Colors.red
                        ),
                        child: Row(
                          children: [
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-logout-colored.png"),
                            SizedBox(width: 20,),
                            Text("Logout",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),),
                            Spacer(),
                            Image.asset("assets/images/ic-arrow-right-blue.png"),
                            SizedBox(width: 5,)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 15,),
                  ],
                ),
              )
            ],
          )
        );
      },

    );
  }
}