import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/profile/profile-controller.dart';
import 'package:noa/utils/date-time-utils.dart';
import 'package:noa/utils/nav_utils.dart';

import 'package:provider/provider.dart';

import 'my-order-details.dart';

class MyOrders extends StatefulWidget{

  int custommerId;
  MyOrders(this.custommerId);

  @override
  State<MyOrders> createState() => _MyOrdersState(custommerId);
}

class _MyOrdersState extends State<MyOrders> {

  int custommerId;
  _MyOrdersState(this.custommerId);

  String? selectLocationAppbar;

  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];

  bool isCurrent=true;

  @override
  void initState() {
    Provider.of<ProfileController>(context, listen: false).getMyOrderList(custommerId);
    Provider.of<ProfileController>(context, listen: false).getPreviousOrderedItems(custommerId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ProfileController>(

      builder: (ctx,provider,child){
        return Scaffold(
          appBar:AppBar(
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
            title: Text("My Order",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w600),),
            backgroundColor: AppColors.pureWhite,
          ) ,
          body: Column(
            children: [
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        isCurrent=true;
                      });
                    },
                    child: Container(
                      width: 136,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color: isCurrent?AppColors.Blue077C9E:AppColors.BlueE7F8FD,
                        border: Border.all(color:isCurrent?Colors.transparent:AppColors.Blue077C9E)
                      ),
                      child: Center(child: Text("Current order",style: TextStyle(color:isCurrent? AppColors.pureWhite:AppColors.Blue077C9E,fontSize: 9,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                  SizedBox(width: 10,),
                  InkWell(
                    onTap: (){
                      setState(() {
                        isCurrent=false;
                      });
                    },
                    child: Container(
                      width: 136,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          color:isCurrent? AppColors.BlueE7F8FD:AppColors.Blue077C9E,
                          border:Border.all(color: isCurrent?AppColors.Blue077C9E:Colors.transparent)
                      ),
                      child: Center(child: Text("Previous order",style: TextStyle(color:isCurrent?AppColors.Blue077C9E:AppColors.pureWhite,fontSize: 9,fontWeight: FontWeight.w500),)),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10,),

              isCurrent? Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.myorderList.length>0?provider.myorderList.length:0,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (ctx,index){
                      return InkWell(
                        onTap: (){

                          NavUtils.push(context, MyOrderDetails(provider.myorderList[index]!.invoiceDetailsViewModels,provider.myorderList[index]!.invoiceViewModels[0]));
                        },
                        child: Column(
                          children: [
                            SizedBox(height: 10,),
                            Container(
                              width: double.infinity,
                              height: 110,
                              margin: EdgeInsets.only(left: 10,right: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: AppColors.pureWhite,
                                  boxShadow: [
                              BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 4,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                              ),

                              child: Row(
                                children: [
                                  Container(
                                    padding:EdgeInsets.all(5),
                                    margin: EdgeInsets.only(left: 10,right: 10),
                                    height: 80,
                                    width: 110,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),
                                      color: AppColors.pureWhite,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 1,
                                          offset: Offset(0,1), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: CachedNetworkImage(
                                      imageUrl: "${provider.myorderList[index]!.invoiceDetailsViewModels.length>0?provider.myorderList[index]!.invoiceDetailsViewModels[0].mediumImage:""}",
                                      height: 60,
                                      width: 60,
                                      errorWidget: (ctx,uarl,error)=>Image.asset("assets/images/item-image-large.png"),
                                    ),
                                  ),

                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                          width:100,
                                          child: Text("${provider.myorderList[index]!.invoiceDetailsViewModels.length>0?provider.myorderList[index]!.invoiceDetailsViewModels[0].productName:"no Product Name available"}",style: TextStyle(color: AppColors.pureBlack,fontSize: 15,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,)),
                                      // Container(
                                      //
                                      //     child: Text("${provider.myorderList[index]!.invoiceDetailsViewModels.length>0?provider.myorderList[index]!.invoiceDetailsViewModels[0].quantity:"0"}",style: TextStyle(color: AppColors.gray8383,fontSize: 9),)),
                                      SizedBox(height: 5,),
                                      Container(
                                          width:155,
                                          child: Text("Order Id: ${provider.myorderList[index]!.refNumber}",style: TextStyle(color: AppColors.pureBlack,fontSize: 10),overflow: TextOverflow.ellipsis,)),
                                      SizedBox(height: 5,),
                                      Container(
                                          width:155,
                                          child: Text("Date : ${DateTimeUtil.getFormatedDateTimeFromServerFormat(provider.myorderList[index]!.invoiceDate!="" && provider.myorderList[index]!.invoiceDate!=null?provider.myorderList[index]!.invoiceDate:provider.myorderList[0]!.invoiceDate)}",style: TextStyle(color: AppColors.pureBlack,fontSize: 10),overflow: TextOverflow.ellipsis,)),



                                    ],
                                  ),

                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(

                                          child: Text("AED",style: TextStyle(color: AppColors.defaultblack,fontSize: 10),)),
                                      SizedBox(width: 5,),
                                      Container(

                                          child: Text("${provider.myorderList[index]!.invoiceDetailsViewModels.length>0?provider.myorderList[index]!.invoiceDetailsViewModels[0].price:"0"}",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 20,fontWeight: FontWeight.bold),)),
                                      SizedBox(width: 8,),
                                    ],
                                  ),
                                ]

                              ),
                            ),
                            SizedBox(height: 10,),
                          ],
                        ),
                      );
                    }),
              ):



              Expanded(
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: provider.previousOrderedItemslist.length>0?provider.previousOrderedItemslist.length:0,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (ctx,index){
                      return Column(
                        children: [
                          SizedBox(height: 10,),
                          Container(
                            child: Row(

                              children: [
                                Container(
                                  padding:EdgeInsets.all(5),
                                  margin: EdgeInsets.only(left: 10,right: 10),
                                  child: CachedNetworkImage(
                                    imageUrl: "${provider.previousOrderedItemslist[index]!.invoiceDetailsViewModels![0].mediumImage}",
                                    height: 60,
                                    width: 60,
                                    errorWidget: (ctx,uarl,error)=>Image.asset("assets/images/item-image-large.png"),
                                  ),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        width:150,
                                        child: Text("${provider.previousOrderedItemslist[index]!.shippingAddressViewModels!.name}",style: TextStyle(color: AppColors.defaultblack,fontSize: 13),)),
                                    Container(

                                        child: Text("${provider.previousOrderedItemslist[index]!.shippingAddressViewModels!.name}",style: TextStyle(color: AppColors.gray8383,fontSize: 9),)),

                                    Row(
                                      children: [
                                        Container(

                                            child: Text("AED",style: TextStyle(color: AppColors.defaultblack,fontSize: 10),)),
                                        SizedBox(width: 5,),
                                        Container(

                                            child: Text("${provider.previousOrderedItemslist[index]!.shippingAddressViewModels!.phoneNumber}",style: TextStyle(color: AppColors.primary,fontSize: 20,fontWeight: FontWeight.bold),)),
                                      ],
                                    ),

                                  ],
                                ),
                                Spacer(),

                                Column(
                                  children: [
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Image.asset("assets/images/ic-ok-order.png"),
                                        SizedBox(width: 5,),
                                        Container(

                                            child: Text("${provider.previousOrderedItemslist[index]!.status}",style: TextStyle(color: AppColors.green32A83E,fontSize:9,fontWeight: FontWeight.w500),)),
                                      ],
                                    ),
                                    SizedBox(height: 30,),

                                    Row(
                                      children: [
                                        Image.asset("assets/images/ic-order-calender.png"),
                                        SizedBox(width: 5,),
                                        Container(
                                            width: 100,

                                            child: Text("Order No: 7 Sept, 2021 | 5:21 pm",style: TextStyle(color: AppColors.defaultblack,fontSize: 9),)),
                                      ],
                                    ),
                                    SizedBox(height: 10,),

                                    Container(


                                        child: Text("Invoice Number: #SC124535",style: TextStyle(color: AppColors.defaultblack,fontSize: 9),)),
                                  ],
                                ),
                                SizedBox(width: 10,),
                              ],
                            ),
                          ),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    isCurrent=true;
                                  });
                                },
                                child: Container(
                                  width: 136,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),

                                      border: Border.all(color: AppColors.primary)
                                  ),
                                  child: Center(child: Text("Write a Review",style: TextStyle(color: AppColors.primary,fontSize: 9,fontWeight: FontWeight.w500),)),
                                ),
                              ),
                              SizedBox(width: 10,),
                              InkWell(
                                onTap: (){
                                  setState(() {
                                    isCurrent=false;
                                  });
                                },
                                child: Container(
                                  width: 136,
                                  height: 35,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(8)),
                                      color: AppColors.pureWhite,
                                      border:Border.all(color: AppColors.defaultblack)
                                  ),
                                  child: Center(child: Text("Buy It Again",style: TextStyle(color: AppColors.defaultblack,fontSize: 9,fontWeight: FontWeight.w500),)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    }),
              )


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

              Text("My Order",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w500),),
              Spacer(),
              Image.asset("assets/images/ic-location-appbar.png"),
              SizedBox(width: 5,),
              DropdownButton(
                  hint: Text("Dubai",style: TextStyle(color:AppColors.defaultblack,fontSize: 9, ),),
                  value: selectLocationAppbar,
                  underline: SizedBox(),
                  icon: Image.asset("assets/images/ic-dropdown-appbar.png"),
                  onChanged: (newValue){
                    setState(() {
                      selectLocationAppbar=newValue.toString();
                    });
                  },
                  items:locationString.map((e) =>
                      DropdownMenuItem(
                        value: e,
                        child:Text("$e",style: TextStyle(color: AppColors.defaultblack,fontSize:9,),),
                      )).toList()),
              SizedBox(width: 5,),


              //Image.asset('assets/menu_icon.png', width: 30, height: 30,)
            ],

          ),
        ),
      ),


    );
  }
}