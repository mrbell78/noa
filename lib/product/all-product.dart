import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/product/product-controller.dart';
import 'package:noa/product/product-details.dart';
import 'package:noa/truck-details/truck-controller.dart';
import 'package:noa/utils/nav_utils.dart';
import 'package:provider/provider.dart';

import 'model/product-details.dart';
import 'model/product-response-data.dart';

class TruckDetails extends StatefulWidget{
  @override
  State<TruckDetails> createState() => _TruckDetailsState();
}

class _TruckDetailsState extends State<TruckDetails> {

  List<ProductResponseData?> producNewtList=[];

  @override
  void initState() {

    //Provider.of<TruckController>(context, listen: false).getProductParentCategory(4);
    Provider.of<ProductController>(context, listen: false).getProducts(4,1,1,1);
    producNewtList=Provider.of<ProductController>(context, listen: false).productList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   return Consumer<ProductController>(
     builder: (context,provider,child){
       return Scaffold(
         appBar:  AppBar(
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
           title: Image.asset("assets/images/ic-noa-colored.png"),
           centerTitle: true,
         ),
         body: SingleChildScrollView(
           child: Column(
             children: [
               Container(

                 width: double.infinity,
                 height: 150,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.only(
                       bottomLeft: Radius.circular(12),
                       bottomRight: Radius.circular(12)
                   ),
                   color: AppColors.Blue077C9E,
                 ),
                 child: Row(

                   children: [
                     Container(
                       margin: EdgeInsets.only(left: 20),
                       height: 80,
                       width: 113,
                       decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(8)),
                           color: AppColors.pureWhite
                       ),
                       child: Center(child: Image.asset("assets/images/item-image-beris.png")),
                     ),
                     SizedBox(width: 10,),
                     Column(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Text("Kibsons",style: TextStyle(color: AppColors.pureWhite,fontSize: 22,fontWeight: FontWeight.w600),),
                         SizedBox(height: 5,),

                         Row(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             Image.asset("assets/images/ic-noa-location.png"),
                             SizedBox(width: 5,),
                             Text("2 KM",style: TextStyle(color: AppColors.pureWhite,fontSize: 12),),
                           ],
                         ),

                       ],
                     )
                   ],
                 ),
               ),
               SizedBox(height: 20,),
               Container(
                 margin: EdgeInsets.only(left: 20,right: 20),
                 height: 92,
                 child: ListView.builder(
                     shrinkWrap: true,
                     scrollDirection: Axis.horizontal,

                     itemCount: 10,
                     itemBuilder: (context,index){
                       return Row(
                         children: [
                           Image.asset("assets/images/item-image3.png"),

                           SizedBox(width: 8,)

                         ],
                       );
                     }),
               ),

               SizedBox(height: 20,),

               Container(
                 height: 40,
                 margin: EdgeInsets.only(left: 20,right: 20),
                 decoration: BoxDecoration(
                     borderRadius: BorderRadius.all(Radius.circular(10)),
                     color: AppColors.pureWhite
                 ),
                 width: double.infinity,
                 child: TextField(
                   style: TextStyle(color: AppColors.defaultblack,fontSize: 11),
                   decoration: InputDecoration(
                       border: InputBorder.none,
                       focusedBorder: InputBorder.none,
                       enabledBorder: InputBorder.none,
                       errorBorder: InputBorder.none,
                       disabledBorder: InputBorder.none,
                       prefixIcon: Image.asset("assets/images/ic-noa-search.png"),
                       hintText: "Search heare",
                       hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 11)
                   ),
                 ),
               ),

               SizedBox(height: 20,),

               Container(
                 padding: EdgeInsets.all(10),
                 margin: EdgeInsets.only(left: 20,right: 20,bottom: 30),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.all(Radius.circular(10)),
                   color: AppColors.pureWhite,
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 1,
                       blurRadius: 2,
                       offset: Offset(0, 1), // changes position of shadow
                     ),
                   ],

                 ),

                 child:  Container(
                   margin: EdgeInsets.only(left: 20,right: 20,bottom: 30),



                   child:producNewtList.length>0? GridView.builder(
                       shrinkWrap: true,
                       physics:NeverScrollableScrollPhysics(),
                       itemCount: producNewtList.length>0?producNewtList.length:0,
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           mainAxisSpacing: 8,
                           crossAxisSpacing: 5,
                           childAspectRatio: MediaQuery.of(context).size.height/(10*110)
                       ),
                       itemBuilder:(context,index){
                         return InkWell(
                           onTap: ()async{
                             await provider.getUserData().then((value){
                               if(value==true){
                                 print("the id is in all product ${producNewtList[index]!.productMasterId}");
                                 NavUtils.push(context, ProductDetailsIndividual( producNewtList[index]!.productMasterId, provider.productUnit[index],provider.custommerLogin!.customerId));

                               }else{
                                 //NavUtils.push(context, Login());
                               }

                             } );
                           },
                           child: Container(
                             padding: EdgeInsets.only(left: 5,right: 5,top: 5),
                             width: 60,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(8)),
                                 color:AppColors.pureWhite,
                                 border: Border.all(color: AppColors.Blue276184,width: 1)
                             ),
                             child: Column(
                               children: [
                                CachedNetworkImage(
                                    imageUrl:'${producNewtList.length>0?producNewtList[index]!.productMasterMediaViewModels.length>0?producNewtList[index]!.productMasterMediaViewModels[0].fileLocation:"":""}',
                                  height: 90,
                                  width: 163,
                                  errorWidget: (context,url,error)=> Image.asset("assets/images/image-item4.png",fit: BoxFit.fill,width: 163,height: 90,),
                                ),
                                 SizedBox(height: 8,),
                                 Container(
                                     width: 120,
                                     height: 20,
                                     child: Text("${producNewtList.length>0?producNewtList[index]!.productName:""}",
                                       style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),
                                     overflow: TextOverflow.ellipsis,
                                     )),
                                 RichText(text: TextSpan(
                                     children: [
                                       TextSpan(text: "${producNewtList.length>0?producNewtList[index]!.productSubSkuRequestModels.length>0?producNewtList[index]!.productSubSkuRequestModels[0].symbol:"AED":"AED"}  ",style: TextStyle(color: AppColors.defaultblack,fontSize: 8)),
                                       TextSpan(text: "${producNewtList.length>0?producNewtList[index]!.productSubSkuRequestModels.length>0?producNewtList[index]!.productSubSkuRequestModels[0].price :"0" :"0"} / Kg  ",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 14,fontWeight: FontWeight.bold)),
                                       TextSpan(text: "(4 pices = 500g)",style: TextStyle(color: AppColors.gray8383,fontSize: 7)),
                                     ]
                                 )),
                                 SizedBox(height: 20,),

                                 provider.productUnit[index]!=0 ? Container(
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [

                                       InkWell(
                                         onTap:(){

                                           setState(() {
                                             if(producNewtList.length>0 && producNewtList[index]!.productSubSkuRequestModels.length>0 && provider.productList[index]!.productSubSkuRequestModels[0].quantity>0){

                                               provider.productUnit[index]--;
                                             }
                                           });

                                         },
                                         child: Container(
                                           height: 24,
                                           width: 24,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.all(Radius.circular(6)),
                                             color: AppColors.LightRedFAF2EE,
                                             border: Border.all(color: AppColors.DeepYelowF37226,width: 1),

                                           ),

                                           child: Center(
                                             child: Icon(Icons.remove,size: 10,color: AppColors.DeepYelowF37226,),
                                           ),
                                         ),
                                       ),
                                       SizedBox(width: 9,),
                                       Center(
                                           child: Text("${provider.productUnit[index]}",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),)),
                                       SizedBox(width: 9,),
                                       InkWell(

                                         onTap: (){

                                           setState(() {
                                             if(producNewtList.length>0 && producNewtList[index]!.productSubSkuRequestModels.length>0 && provider.productList[index]!.productSubSkuRequestModels[0].quantity>provider.productUnit[index]){
                                               provider.productUnit[index]++;
                                             }else{
                                               Fluttertoast.showToast(
                                                   msg: "Stock over",
                                                   toastLength: Toast.LENGTH_SHORT,
                                                   gravity: ToastGravity.CENTER,
                                                   timeInSecForIosWeb: 1,
                                                   backgroundColor: Colors.red,
                                                   textColor: Colors.white,
                                                   fontSize: 16.0
                                               );
                                             }
                                           });

                                         },
                                         child: Container(
                                           height: 24,
                                           width: 24,
                                           decoration: BoxDecoration(
                                             borderRadius: BorderRadius.all(Radius.circular(6)),
                                            color: AppColors.Blue077C9E,

                                           ),

                                           child: Center(
                                             child: Icon(Icons.add,size: 10,color: AppColors.pureWhite,),
                                           ),
                                         ),
                                       ),


                                     ],
                                   ),
                                 ):SizedBox(),

                                 provider.productUnit[index]==0?
                                 InkWell(
                                   onTap: (){

                                     setState(() {
                                       if(producNewtList.length>0 && producNewtList[index]!.productSubSkuRequestModels.length>0 && provider.productList[index]!.productSubSkuRequestModels[0].quantity>provider.productUnit[index]){
                                         provider.productUnit[index]++;
                                       }else{
                                         Fluttertoast.showToast(
                                             msg: "Stock over",
                                             toastLength: Toast.LENGTH_SHORT,
                                             gravity: ToastGravity.CENTER,
                                             timeInSecForIosWeb: 1,
                                             backgroundColor: Colors.red,
                                             textColor: Colors.white,
                                             fontSize: 16.0
                                         );
                                       }
                                     });

                                   },
                                   child: Container(
                                     height: 24,
                                     width: 24,
                                     decoration: BoxDecoration(
                                         borderRadius: BorderRadius.all(Radius.circular(7)),
                                         color: AppColors.Blue077C9E
                                     ),
                                     child: Center(child: Icon(Icons.add,size: 10,color: AppColors.pureWhite,)),
                                   ),
                                 ):
                                 SizedBox(),
                                 SizedBox(height: 8,)
                               ],
                             ),

                           ),
                         );
                       } ):Text("No Items Available",style: TextStyle(color: AppColors.primary),),
                 ),
               ),
             ],
           ),
         ),
       );

     },

   );
  }
}