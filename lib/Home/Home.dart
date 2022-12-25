import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/drawer/drawer.dart';
import 'package:noa/login-registration/login.dart';
import 'package:noa/product/all-product.dart';
import 'package:noa/profile/my-orders.dart';
import 'package:noa/profile/my-profile.dart';
import 'package:noa/service/service.dart';
import 'package:noa/utils/nav_utils.dart';
import 'package:provider/provider.dart';

import 'home-controller.dart';

class Home extends StatefulWidget{
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  void initState() {
   // Provider.of<HomeController>(context, listen: false).getProductParentCategory(4);
    Provider.of<HomeController>(context, listen: false).getUserData();
    Provider.of<HomeController>(context, listen: false).getAllStoreList();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeController>(

      builder: (context,provider,child){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColors.pureWhite,
            leading: GestureDetector(
                onTap: (){
                  NavUtils.push(context, DrawerCustom(provider.custommerLogin));
                },
                child: Image.asset("assets/images/ic-menu-button.png")),
            title: Image.asset("assets/images/ic-noa-colored.png"),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset("assets/images/image-banner.png"),
                    SizedBox(height: 30,),

                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text("Near To You",style: TextStyle(color: AppColors.Blue276184,fontSize: 19,fontWeight: FontWeight.w600),),
                        Spacer(),
                        Text("View All",style: TextStyle(color: AppColors.Blue276184,fontSize: 10,),),
                        SizedBox(width: 30,),
                      ],
                    ),
                    SizedBox(height: 5,),

                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      height: 190,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,

                          itemCount: provider.storeList.length>0?provider.storeList.length:0,
                          itemBuilder: (context,index){
                            return Row(
                              children: [
                                GestureDetector(
                                  onTap:(){
                                    NavUtils.push(context, NoaService());
                                  },
                                  child: Container(
                                      width:158,
                                      height: 187,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          color: AppColors.BlueF2FAFF,
                                          border: Border.all(color: AppColors.Blue077C9E)
                                      ),
                                      child:Column(
                                        children: [
                                          SizedBox(height: 5,),

                                          CachedNetworkImage(
                                              imageUrl: "${provider.storeList!=null?provider.storeList[index]!.largeImage:""}",
                                          height: 102,
                                            width: 89,
                                            errorWidget: (ctx,url,error)=> Image.asset("assets/images/image-near-item.png",height: 102,width: 89,),
                                          ),
                                          SizedBox(height: 8,),
                                          Container(
                                              margin: EdgeInsets.only(left: 30,right: 30),
                                              child: Divider(color: AppColors.Blue265F82,thickness: 1,)),
                                          SizedBox(height: 8,),
                                          Container(
                                            width:80,
                                              child: Text("${provider.storeList[index]!.shopName}",style: TextStyle(color: AppColors.defaultblack,fontWeight: FontWeight.w600,fontSize: 15),overflow: TextOverflow.ellipsis,)),
                                          SizedBox(height: 8,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Image.asset("assets/images/ic-noa-location.png"),
                                              SizedBox(width: 5,),
                                              Text("2 KM",style: TextStyle(color: AppColors.gray8383,fontSize: 10),),
                                            ],
                                          ),
                                        ],
                                      )
                                  ),
                                ),

                                SizedBox(width: 8,)

                              ],
                            );
                          }),
                    ),

                    SizedBox(height: 30,),

                     Container(
                       margin: EdgeInsets.only(left: 10,right: 10),
                      child: Row(

                        children: [
                          Image.asset("assets/images/water.png",width: 79,height: 79,),
                          SizedBox(width: 11,),
                          Image.asset("assets/images/laundry.png",width: 79,height: 79,),
                          SizedBox(width: 11,),
                          Image.asset("assets/images/handyman.png",width: 79,height: 79),
                          SizedBox(width: 11,),
                          Image.asset("assets/images/mini-market.png",width: 79,height: 79),


                        ],
                      ),
                    ),
                  SizedBox(height: 20,),
                  Container(
                    margin: EdgeInsets.only(left: 10,right: 10),
                    child: Row(
                      children: [
                        Image.asset("assets/images/flower-shop.png",width: 79,height: 79,),
                        SizedBox(width: 11,),
                        Image.asset("assets/images/plants.png",width: 79,height: 79,),
                        SizedBox(width: 11,),
                        Image.asset("assets/images/meat-shop.png",width: 79,height: 79,),
                        SizedBox(width: 11,),
                        Image.asset("assets/images/fish.png",width: 79,height: 79,),
                      ],
                    ),
                  ),
                    SizedBox(height: 20,),
                    Container(
                      margin: EdgeInsets.only(left: 10,right: 10),
                      child: Row(
                        children: [
                          Image.asset("assets/images/fuel.png",width: 79,height: 79),
                          SizedBox(width: 11,),
                          Image.asset("assets/images/home-service.png",width: 79,height: 79),
                          SizedBox(width: 11,),
                          Image.asset("assets/images/bakery.png",width: 79,height: 79),
                          SizedBox(width: 11,),
                          Image.asset("assets/images/pet.png",width: 79,height: 79),
                        ],
                      ),
                    ),

                  /*  Container(
                      margin: EdgeInsets.only(left: 20,right: 20,bottom: 30),


                      child: GridView.builder(
                          shrinkWrap: true,
                          physics:NeverScrollableScrollPhysics(),
                          itemCount: provider.parentCategoryList.length>0?provider.parentCategoryList.length:0,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisSpacing: 2,
                              crossAxisSpacing: 3,
                              childAspectRatio: MediaQuery.of(context).size.height/(10*90)
                          ),
                          itemBuilder:(context,index){
                            return InkWell(
                                onTap: (){
                                  NavUtils.push(context, TruckDetails());
                                },
                                child: Stack(
                                  children: [
                                    Container(
                                      height: 100,
                                      width: 110,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10)),
                                          color: AppColors.pinkFFE6EF
                                      ),
                                      child: Center(child: Image.asset("assets/images/ic-item-place-holder.png",height:double.infinity,width:double.infinity,fit: BoxFit.fill,)),
                                    ),

                                    Container (
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,

                                          children: [
                                            SizedBox(height: 6,),
                                            Center(
                                              child: CachedNetworkImage(
                                                  imageUrl: "${provider.parentCategoryList[index]!.largeImage}",
                                              height: 50,
                                              width: 50,
                                              errorWidget: (ctx,url,error)=>Image.asset(""),
                                              ),
                                            ),
                                            SizedBox(height: 4,),
                                            Center(child: Container(width:60,child: Text("${provider.parentCategoryList[index]!.name}",overflow: TextOverflow.ellipsis,)))

                                          ],
                                        ),
                                      ),
                                    ),

                                  ],
                                )
                            );
                          } ),
                    ),
*/

                    SizedBox(height: 30,),

                    Row(
                      children: [
                        SizedBox(width: 20,),
                        Text("Our Partners",style: TextStyle(color: AppColors.Blue276184,fontSize: 19,fontWeight: FontWeight.w600),),
                        Spacer(),
                        Text("View All",style: TextStyle(color: AppColors.Blue276184,fontSize: 10,),),
                        SizedBox(width: 30,),
                      ],
                    ),

                    SizedBox(height: 5,),


                    Container(
                      margin: EdgeInsets.only(left: 20,right: 20),
                      height: 140,
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,

                          itemCount: 10,
                          itemBuilder: (context,index){
                            return Row(
                              children: [
                                SizedBox(width: 10,),
                                Container(

                                    height: 100,
                                    width: 139,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        color: AppColors.pureWhite,

                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.5),
                                            spreadRadius: 5,
                                            blurRadius: 7,
                                            offset: Offset(0, 3), // changes position of shadow
                                          ),
                                        ]

                                    ),
                                    child: Center(child: Image.asset("assets/images/ic-partner-item.png",))),
                                SizedBox(width: 10,)

                              ],
                            );
                          }),
                    ),

                    SizedBox(height: 90,),



                  ],
                ),
              ),

              Positioned(
                bottom: -0.5,
                left: 0.0,
                right: 0.0,
                child: Stack(
                  overflow: Overflow.visible,
                  children: [
                    Image.asset("assets/images/modified-footer.png",width: 1000,),
                    Container(
                      margin: EdgeInsets.only(top:30),
                      child: Row(
                        children: [
                          SizedBox(width: 30,),
                          Image.asset("assets/images/ic-noa-home.png"),
                          SizedBox(width: 25,),
                          GestureDetector(
                              onTap: (){
                                if(provider.custommerLogin!=null){
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
                                  NavUtils.push(context, Login());
                                }
                              },
                              child: Image.asset("assets/images/ic-noa-package.png")),
                          Spacer(),
                          GestureDetector(
                              onTap: (){

                                if(provider.custommerLogin!=null){
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
                                  NavUtils.push(context, Login());
                                }
                              },
                              child: Image.asset("assets/images/ic-noa-profile.png")),
                          SizedBox(width: 25,),
                          Image.asset("assets/images/ic-noa-notification.png"),
                          SizedBox(width:25,),
                        ],
                      ),
                    ),
                    Positioned(
                        top: -40,
                        left: 150,
                        right: 150,
                        child: Center(child: Image.asset("assets/images/ic-noa-center-location.png")))
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