import 'package:flutter/material.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/product/product-controller.dart';
import 'package:noa/utils/nav_utils.dart';

import 'package:provider/provider.dart';

class OrderThankyou extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
      builder: (context,provider,child){
        return Scaffold(
          appBar: _customappbar(context),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  border: Border.all(color: AppColors.Blue077C9E,width: 1.5),
                  color: AppColors.pureWhite,
                ),
                child: Center(child: Image.asset("assets/images/ic-noa-ok-thaku.png"),),
              ),
              SizedBox(height: 15,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Thank",style: TextStyle(color: AppColors.DeepYelowF37226,fontSize: 32,fontWeight: FontWeight.bold),),
                  SizedBox(width: 5,),
                  Text("You",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 32,fontWeight: FontWeight.bold),),

                ],
              ),
              Text("Your order has been received",style: TextStyle(color: AppColors.gray8383,fontSize: 9,),),
              SizedBox(height: 20,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Invoice Number",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,),),
                  SizedBox(width: 5,),
                  Container(child: Text("${provider.myOrderCheckOut!.refNumber}",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.bold),)),

                ],
              ),

              SizedBox(height: 10,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Estemated Delivery Date & Time : ",style: TextStyle(color: AppColors.defaultblack,fontSize:11,),),
                  SizedBox(width: 5,),
                  Text("28 Dec, 2021 | 1:20pm",style: TextStyle(color: AppColors.defaultblack,fontSize: 11,fontWeight: FontWeight.bold),),

                ],
              ),

              SizedBox(height: 15,),

              Row(

                children: [
                  SizedBox(width: 30,),
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        //NavUtils.pushAndRemoveUntil(context, Store(1,""));
                      },
                      child: Container(
                        height: 32,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppColors.Blue077C9E
                        ),
                        child: Center(child: Text("Back to home page",style: TextStyle(color: AppColors.pureWhite,fontSize: 9,fontWeight: FontWeight.w500),),),
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Container(
                      height: 32,

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: AppColors.DeepYelowF37226
                      ),
                      child: Center(child: Text("Track Your Order",style: TextStyle(color: AppColors.pureWhite,fontSize: 9,fontWeight: FontWeight.w500),),),
                    ),
                  ),
                  SizedBox(width: 30,),
                ],
              ),
            ],
          ),
        );
      },

    );
  }










  _customappbar(context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: AppColors.pureWhite,

      title: Center(
        child: Container(
          height: 106,
          child: Row(

            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Image.asset("assets/images/ic-back-appbar.png")),

              Spacer(),
              SizedBox(width: 5,),

              Image.asset("assets/images/ic-noa-colored.png",width:110,fit: BoxFit.cover,),
              Spacer(),
              //Image.asset('assets/menu_icon.png', width: 30, height: 30,)
            ],

          ),
        ),
      ),


    );
  }

}