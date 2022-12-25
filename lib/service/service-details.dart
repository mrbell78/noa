import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/product/add-to-cartlist.dart';
import 'package:noa/product/model/body/body-add-to-cart.dart';
import 'package:noa/product/product-controller.dart';
import 'package:noa/service/service-controller.dart';
import 'package:noa/utils/nav_utils.dart';
import 'package:provider/provider.dart';

import 'model/body/noa-service-input.dart';

class ServiceDetails extends StatelessWidget{

  List<XFile?>imageList=[];
  String description;
  String productMasterId;
  ServiceDetails(this.imageList,this.description,this.productMasterId);
  @override
  Widget build(BuildContext context) {
    Provider.of<ServiceController>(context, listen: false).getUserData().then((value) {
      Provider.of<ProductController>(context, listen: false).getCartItems(
          Provider.of<ServiceController>(context, listen: false).custommerLogin!.customerId
      );
    });

    return Consumer<ServiceController>(
      builder: (context,provider,child){
        return Scaffold(
          appBar: AppBar(
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
            title: Text("Service Request",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w600),),
            centerTitle: true,
            backgroundColor: AppColors.pureWhite,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                ListView(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15,top: 40),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.pureWhite,

                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.all(Radius.circular(10)),
                                        color: AppColors.pinkFFE6EF
                                    ),
                                    child: Center(child: Image.asset("assets/images/ic-item-place-holder.png",height:50,width:50,fit: BoxFit.fill,)),
                                  ),

                                  // Container (
                                  //   child: Center(
                                  //     child: Column(
                                  //       crossAxisAlignment: CrossAxisAlignment.center,
                                  //
                                  //       children: [
                                  //         SizedBox(height: 6,),
                                  //         Center(
                                  //           child: CachedNetworkImage(
                                  //             imageUrl: "${provider.parentCategoryList[index]!.largeImage}",
                                  //             height: 50,
                                  //             width: 50,
                                  //             errorWidget: (ctx,url,error)=>Image.asset(""),
                                  //           ),
                                  //         ),
                                  //         SizedBox(height: 4,),
                                  //         Center(child: Container(width:60,child: Text("${provider.parentCategoryList[index]!.name}",overflow: TextOverflow.ellipsis,)))
                                  //
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),

                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("Cleaning",
                                    style: TextStyle(color: AppColors.Blue077C9E,fontSize: 19,fontWeight: FontWeight.w600),
                                  ),
                                  Text("Full house cleaning",
                                    style: TextStyle(color: AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Spacer(),
                              Column(
                                children: [
                                  Text("AED",
                                    style: TextStyle(color: AppColors.Skyblue00A3E0,fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                  Text("400",
                                    style: TextStyle(color: AppColors.Skyblue00A3E0,fontSize: 16,fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),

                          Row(
                            children: [
                              Text("Details",
                                style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),
                              ),
                              Spacer(),
                              Image.asset("assets/images/ic-edit-prolvl.png"),
                              SizedBox(width: 5,),
                              Image.asset("assets/images/ic-delete.png")

                            ],
                          ),
                          SizedBox(height: 5,),
                          Text("${description}",
                            style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),
                          ),
                          SizedBox(height: 20,),
                          Text("Show More",
                            style: TextStyle(color: AppColors.NaveyBlue001489,fontSize: 10,fontWeight: FontWeight.w600),
                          ),
                          SizedBox(height: 10,),
                          Wrap(
                            runSpacing: 5,
                            spacing: 5,
                            children: imageList.map((e) => ClipRRect(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                child: Image.file(File(e!.path),height: 70,width: 110,))).toList(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15),
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(100)),
                        color: AppColors.pureWhite,
                        border: Border.all(color: AppColors.Blue077C9E,width: 1),

                      ),
                      child: Center(child: Text("Call Us",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 15,fontWeight: FontWeight.w600),)),
                    ),
                    SizedBox(height: 15,),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Text("Location",
                          style: TextStyle(color: AppColors.Blue077C9E,fontSize: 15,fontWeight: FontWeight.w600),
                        ),
                        Spacer(),
                        Container(
                          width: 100,
                          height: 20,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: AppColors.pureWhite,
                            border: Border.all(color: AppColors.defaultblack,width: 1),

                          ),
                          child: Center(child: Text("Change Address",style: TextStyle(color: AppColors.defaultblack,fontSize: 9,fontWeight: FontWeight.w600),)),
                        ),
                        SizedBox(width: 15,)
                      ],
                    ),
                    SizedBox(height: 20,),

                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15),
                      padding: EdgeInsets.all(10),
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColors.pureWhite,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius:3,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(width: 15,),
                              Text("Home",
                                style: TextStyle(color: AppColors.defaultblack,fontWeight: FontWeight.bold,fontSize: 13),),
                              Spacer(),
                              Container(
                                height: 20,
                                width: 20,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  color: AppColors.pureWhite,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius:1,
                                      blurRadius: 1,
                                      offset: Offset(0, 2), // changes position of shadow
                                    ),
                                  ],
                                ),
                                child: Center(child: Image.asset("assets/images/ic-edit.png")),
                              ),
                              SizedBox(width: 10,)
                            ],
                          ),
                          SizedBox(height: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            child: Text("Asif Rahaman",
                              style: TextStyle(color: AppColors.defaultblack,fontWeight: FontWeight.w600,fontSize: 12),),
                          ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              SizedBox(width: 15,),
                              Image.asset("assets/images/ic-location.png",height: 10,width: 7,),
                              SizedBox(width: 3,),
                              Container(
                                width: 150,
                                margin: EdgeInsets.only(left: 15),
                                child: Text("G3, New City Build, Ground Floor,Jumera Lake Lower, Dubai",
                                  style: TextStyle(color: AppColors.gray8383,fontSize: 9),),
                              ),
                              Spacer(),
                              Image.asset("assets/images/ic-phone.png",height: 10,width: 7,),
                              SizedBox(width: 3,),
                              Container(
                                margin: EdgeInsets.only(left: 15),
                                child: Text("+865123",
                                  style: TextStyle(color: AppColors.gray8383,fontSize: 9),),
                              ),
                              SizedBox(width: 15,)
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),

                  ],
                ),
                Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height:120,
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueDropShadow,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10)
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 4,
                            blurRadius: 5,
                            offset: Offset(0, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Total Price:",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),),

                                SizedBox(height: 8,),

                                Row(
                                  children: [
                                    Text("AED",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),),
                                    SizedBox(width: 6,),
                                    Text("450",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 28,fontWeight: FontWeight.w500),),


                                  ],
                                ),
                                SizedBox(height: 9,),

                                Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("(All prices include VAT)",style: TextStyle(color: AppColors.lightgrey,fontSize: 10,),)),

                              ],
                            ),
                          ),
                          SizedBox(width: 50,),
                          Container(
                            child: VerticalDivider(width: 1,color: AppColors.grayA0,),
                          ),
                          SizedBox(width: 50,),
                          InkWell(
                            onTap: () async {

                              //  double totalammount =provider.getTotalAmmountforCheckOut(provider.addtoCartList);
                              //
                              //
                              //
                              // var data = BodyOrder(
                              //   invoiceMasterId: 0,
                              //   customerId: custommerId,
                              //   refNumber: null,
                              //   invoiceDate: null,
                              //   courierCharge: 0,
                              //   carryingCost: 0,
                              //   paymentMethod: 1,
                              //   remark: null,
                              //   discountCode: null,
                              //   discountValue: null,
                              //   paymentStatus: 1,
                              //
                              //   createdAt: null,
                              //   status: "",
                              //   cityId: 2002,
                              //   stateId:2022,
                              //   invoiceStatusId: 1,
                              //   invoiceRequestModels:provider.getInvoiceRequestModel(provider.addtoCartList, totalammount),
                              //   billingShippingAddressRequestModels: [
                              //
                              //     listmaker.BillingShippingAddressRequestModels(
                              //         billingShippingAddressId: 0,
                              //         customerId: custommerId,
                              //         countryId: 13,
                              //         stateId: 2002,
                              //         cityId: 2002,
                              //         addressLine: "mirpur2",
                              //         customerAddressId: addressId
                              //
                              //     )
                              //   ],
                              //   inputFieldValueRequestModels: [],
                              //   paymentRequestModels: [
                              //     listmaker.PaymentRequestModels(
                              //         paymentId: 0,
                              //         currencyId: 1,
                              //         amount: 0,
                              //         courierCharge: 0,
                              //         paymentMethod: 1,
                              //         payDate: "Date(1640196000000)",
                              //         carryingCost: 0
                              //     )
                              //   ],
                              //   totalAmount: totalammount,
                              //   receivedAmt: totalammount,
                              //   countryId:13,
                              //
                              // );
                              //
                              // if(provider.deliveryAddresslist.length>0){
                              //   await provider.orderCheckout(data).then((value) async {
                              //
                              //     Fluttertoast.showToast(
                              //         msg: "Order Confirmed",
                              //         toastLength: Toast.LENGTH_SHORT,
                              //         gravity: ToastGravity.CENTER,
                              //         timeInSecForIosWeb: 1,
                              //         backgroundColor: Colors.red,
                              //         textColor: Colors.white,
                              //         fontSize: 16.0
                              //     );
                              //     var cartData=BodyRemoveAllCart(
                              //         customerId: custommerId,
                              //         cartId: provider.addtoCartList[0]!.cartId,
                              //         tempId: await provider.getTemptId()
                              //     );
                              //     provider.removeAllCartList(cartData).then((value) {
                              //       NavUtils.push(context, OrderThankyou());
                              //     });
                              //
                              //
                              //
                              //
                              //   });
                              //
                              // }else{
                              //   Fluttertoast.showToast(
                              //       msg: "Please add address first",
                              //       toastLength: Toast.LENGTH_SHORT,
                              //       gravity: ToastGravity.CENTER,
                              //       timeInSecForIosWeb: 1,
                              //       backgroundColor: Colors.red,
                              //       textColor: Colors.white,
                              //       fontSize: 16.0
                              //   );
                              // }

                              provider.csdata.add(
                                  CustomInputDataRequestModels(
                                      customInputDataId: 0,
                                      invoiceDetailsId: 0,
                                      invoiceMasterId: 0,
                                      cartId: Provider.of<ProductController>(context, listen: false).addtoCartList.length>0?Provider.of<ProductController>(context, listen: false).addtoCartList[0]!.cartId:null,
                                      customerId: provider.custommerLogin!.customerId,
                                      customInputId: provider.customInputResponsedata[6]?.customInputId,
                                      values: [],
                                      tempId: await provider.getTemptId(),
                                      value: "11424",
                                      name: "ProductMasterId"
                                  )
                              );

                              if(provider.custommerLogin!=null){


                                var data = BodyAddtoCart(
                                  customerId:provider.custommerLogin!.customerId,
                                  cartId: 0,
                                  currencyId: 1,
                                  productMasterId: int.parse('${productMasterId}'),

                                  quantity: 1,
                                  serviceDateTime:  "",
                                  status: "ok",
                                  storeId:23,
                                  supplierId: 10183,
                                  tempId: await provider.getTemptId(),
                                  unitPrice: 400,
                                  inputFieldValueRequestModels:[],
                                );

                                await  Provider.of<ProductController>(context, listen: false).addToCart(data).then((value) => {

                                  Fluttertoast.showToast(
                                      msg: "product added",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0
                                  ),
                                  NavUtils.push(context, AddtoCartList(provider.custommerLogin!.customerId))

                                });
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
                              height: 52,
                              width: 155,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(100)),
                                  color: AppColors.Blue077C9E
                              ),
                              child: Center(
                                child: Text("Request service",style: TextStyle(color: AppColors.pureWhite,fontSize: 14,fontWeight: FontWeight.w500),),

                              ),
                            ),
                          ),  
                        ],
                      ),
                    ),

                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}