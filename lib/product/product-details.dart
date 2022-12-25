import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/product/product-controller.dart';
import 'package:noa/product/tabbar-items/ingradients.dart';
import 'package:noa/product/tabbar-items/rating-reviews.dart';
import 'package:noa/product/tabbar-items/tabbar-items.dart';
import 'package:noa/utils/nav_utils.dart';
import 'package:provider/provider.dart';

import 'add-to-cartlist.dart';
import 'model/body/body-add-to-cart.dart';

class ProductDetailsIndividual extends StatefulWidget{

  int quantity;
  int productId;
  int custommerId;

  ProductDetailsIndividual(this.productId,this.quantity,this.custommerId);

  @override
  State<ProductDetailsIndividual> createState() => _ProductDetailsIndividualState(productId,quantity,custommerId);



}

class _ProductDetailsIndividualState extends State<ProductDetailsIndividual> with TickerProviderStateMixin{

  int quantity;
  int productId;
  int custommerId;

  _ProductDetailsIndividualState(this.productId,this.quantity,this.custommerId);

  bool isNotiifed=false;
  String? selectLocationAppbar;
  List<String>locationString=["Dubai","Arab Amirat","Abudabi"];

  var _tabController;
  var bodyArray=[];
  var selectedIndex;

  @override
  void initState() {
    print("the id is $productId");
    Provider.of<ProductController>(context, listen: false).getProductDetails(productId,4,1,1,custommerId);
    Provider.of<ProductController>(context, listen: false).getRelatedProductYoumayLike(productId, 4, 1);

    _tabController=TabController(length:3, vsync: this);

    setState(() {
      selectedIndex=0;
    });

    bodyArray=[
      Description(),
      Ingredients(),
      RatingReviews(),

    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(

      builder: (context,provider,child){
        return Scaffold(
          backgroundColor: AppColors.pureWhite,
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
            title: Text("Product Details",style: TextStyle(color: AppColors.defaultblack,fontSize: 20,fontWeight: FontWeight.w600),),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 285,
                  child: Stack(

                    children: [


                      Positioned(
                          top: -178,

                          child: Image.asset("assets/images/product-background.png",)),

                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          children: [
                            SizedBox(width: 20,),
                            Text("Still few left in the truck",style: TextStyle(color: AppColors.defaultblack,fontSize:13,),),
                            SizedBox(width: 5,),
                            Image.asset("assets/images/ic-noa-ok.png"),
                            Spacer(),
                            Image.asset("assets/images/ic-noa-share.png"),
                            SizedBox(width: 8,),
                            Image.asset("assets/images/ic-noa-heart.png"),
                            SizedBox(width: 20,),
                          ],
                        ),
                      ),


                      Positioned(
                          top: 50,
                          left: 150,
                          child: Center(
                            child: CachedNetworkImage(
                              imageUrl: "${provider.productDetails!=null?provider.productDetails!.productSubSkuRequestModels[0].mediumImage:""}",
                              height: 100,
                              width: 100,
                              errorWidget: (context,url,error)=> Container(
                                margin: EdgeInsets.all(5),
                                height: 30,
                                width: 30,

                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(color: AppColors.Blue077C9E)
                                ),
                                child: Image.asset("assets/images/item-image-large.png",height: 46,width: 46),
                              ),
                            ),
                          )),


                      Positioned(
                        top: 165,
                        left: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                                onTap:(){
                                  for(int i =provider.productDetails!.productSubSkuRequestModels.length;i>0;i--){

                                    setState(() {

                                      provider.skuRequestModel=provider.productDetails!.productSubSkuRequestModels[i];

                                    });

                                  }
                                },

                                child: Image.asset("assets/images/ic-back-appbar.png",height: 12,width: 17,)),
                            SizedBox(width: 9,),
                            Container(
                              height: 50,
                              width: 195,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: provider.productDetails!=null && provider.productDetails!.productSubSkuRequestModels.length>0?provider.productDetails!.productSubSkuRequestModels.length:0,
                                  itemBuilder: (context,index){
                                    return Container(
                                      height: 47,
                                      width: 47,
                                      margin:  EdgeInsets.all(5),
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          color: AppColors.pureWhite,
                                          border: Border.all(color: AppColors.Blue077C9E,width: 0.5)
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.all(Radius.circular(8)),
                                        child: CachedNetworkImage(
                                          imageUrl: "${provider.productDetails!=null?provider.productDetails!.productSubSkuRequestModels[index].mediumImage:""}",
                                          errorWidget: (context,url,error)=> Container(
                                            margin: EdgeInsets.all(5),
                                            height: 47,
                                            width: 47,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(8)),
                                                border: Border.all(color: AppColors.Blue077C9E)
                                            ),
                                            child: Image.asset("assets/images/item-image-large.png",height: 46,width: 46),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(width: 9,),
                            RotatedBox(
                                quarterTurns:2,
                                child: InkWell(
                                    onTap: (){


                                      for(int i =0;i<provider.productDetails!.productSubSkuRequestModels.length;i++){

                                        setState(() {

                                          provider.skuRequestModel=provider.productDetails!.productSubSkuRequestModels[i];

                                        });

                                      }



                                    },
                                    child: Image.asset("assets/images/ic-back-appbar.png",height: 12,width: 17,))),

                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    border: Border.all(color: AppColors.GrayA8A7A7,width: 0.5),
                    color: AppColors.pureWhite
                  ),

                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text("Pomegranate",style: TextStyle(color: AppColors.defaultblack,fontSize: 22,fontWeight: FontWeight.w600),),
                          Spacer(),
                          Text("NES: 629110375",style: TextStyle(color: AppColors.gray8383,fontSize: 10,),),

                        ],
                      ),

                      SizedBox(height: 10,),

                      Row(
                        children: [
                          Text("(4 Pieces- 500g)",style: TextStyle(color: AppColors.gray8383,fontSize: 11,),),
                          Spacer(),
                          Container(
                            width:32,
                            height: 15,
                            padding: EdgeInsets.only(top: 2.5,bottom: 3,left: 5,right: 4.5),
                            decoration: BoxDecoration(
                              color: AppColors.yelow,
                              borderRadius: BorderRadius.all(Radius.circular(15)),
                            ),
                            child: Row(children: [
                              Image.asset("assets/images/ic-star-white.png"),
                              SizedBox(width: 5,),
                              Text("4.8",style: TextStyle(color: AppColors.pureWhite,fontSize: 7,fontWeight: FontWeight.w500),),

                            ],),
                          ),
                          SizedBox(width: 8,),
                          Text("(172 Reviews)",style: TextStyle(color: AppColors.gray8383,fontSize: 9,),),


                        ],
                      ),

                      SizedBox(height: 15,),

                      Row(
                        children: [
                        Column(children: [
                          RichText(
                            text:TextSpan(
                                children: [
                                  TextSpan(text: "AED",style: TextStyle(color: AppColors.defaultblack,fontSize: 10)),
                                  TextSpan(text: " ${provider.productDetails!=null?(provider.productDetails!.productSubSkuRequestModels.length>0?provider.productDetails!.productSubSkuRequestModels[0].price:0)*quantity:0}",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 28,fontWeight: FontWeight.bold)),
                                ]
                            ),
                          ),
                          SizedBox(height: 5,),
                          Text("(All prices include VAT)",style: TextStyle(color: AppColors.gray8383,fontSize: 10,),),

                        ],),
                          Spacer(),
                          InkWell(
                            onTap: (){
                              if(isNotiifed==false){
                                setState(() {
                                  isNotiifed=true;
                                });
                              }else{
                                setState(() {
                                  isNotiifed=false;
                                });
                              }
                            },
                            child: Container(
                              height: 20,
                              width: 20,

                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.GrayA8A7A7,width: 0.5),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: AppColors.pureWhite
                              ),
                              child: Center(
                                child: Container(
                                  height: 10,
                                  width: 10,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(100)),
                                    color:isNotiifed? AppColors.Blue077C9E:AppColors.pureWhite
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 8,),
                          Text("(All prices include VAT)",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),),





                        ],
                      ),

                      SizedBox(height: 28,),

                      ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: provider.productDetails!=null && provider.productDetails!.attributeRequestModels.length>0?provider.productDetails!.attributeRequestModels.length:0,

                          itemBuilder: (context,index){


                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("Select ${ provider.productDetails!.attributeRequestModels[index].attributeTitle}",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w500),),

                                SizedBox(height: 13,),

                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  height:50,
                                  child: ListView.builder(


                                    itemBuilder: (context,i){


                                      /*  provider.getskuePrice(
                                            provider.productDetails!.attributeRequestModels[index].skuInitials,
                                            provider.productDetails!.attributeRequestModels[index].attributeDetailsRequestModels[i].value,


                                          );
*/

                                      return

                                        Row(
                                          children: [

                                            InkWell(
                                              onTap:(){
                                                setState(() {

                                                  provider.skqueinit[index]=provider.productDetails!.attributeRequestModels[index].skuInitials;
                                                  provider.skquvalue[i]=provider.productDetails!.attributeRequestModels[index].attributeDetailsRequestModels[i].value;

                                                  provider.getskuePrice(
                                                      index,i
                                                  );

                                                  provider.singleTry[index]=i;
                                                });
                                              },
                                              child: Container(
                                                height: 33,
                                                width: 57,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                                  border: Border.all(color: AppColors.DeepGray),
                                                  color:  provider.singleTry[index]==i?AppColors.DeepYelowF37226:AppColors.pureWhite,
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: AppColors.dropShadow.withOpacity(0.2),
                                                      spreadRadius: 1,
                                                      blurRadius: 1,
                                                      offset: Offset(0, 1), // changes position of shadow
                                                    ),
                                                  ],
                                                ),

                                                child: Center(
                                                  child:Text("${provider.productDetails!.attributeRequestModels[index].attributeDetailsRequestModels[i].value}",style: TextStyle(color:  provider.singleTry[index]==i?AppColors.pureWhite:AppColors.defaultblack,fontSize: 11,),),
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 5,),
                                          ],
                                        );
                                    },
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics: BouncingScrollPhysics(),
                                    itemCount:provider.productDetails!.attributeRequestModels[index].attributeDetailsRequestModels.length??0,

                                  ),
                                ),

                                SizedBox(height: 25,),
                              ],
                            );
                          }),



                      SizedBox(height: 40,),

                      Row(
                        children: [
                          Image.asset("assets/images/ic-location-appbar.png",height: 14,width: 11,fit: BoxFit.cover,),
                          SizedBox(width: 7,),

                          Text("Country of Origin: Dubai",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,),),

                        ],
                      ),

                      SizedBox(height: 36,),

                      Row(
                        children: [
                          Text("Sold By:",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w500),),

                          SizedBox(width: 5,),
                          Text("${provider.productDetails!=null?provider.productDetails!.supplierRequestModel.supplierName:"N/A"}",style: TextStyle(color: AppColors.defaultblack,fontSize: 16,fontWeight: FontWeight.bold),),

                        ],
                      ),

                      SizedBox(height: 37,),

                      Container(


                        child: TabBar(

                            indicatorColor: AppColors.Blue077C9E,
                            unselectedLabelColor: AppColors.defaultblack,
                            labelColor: AppColors.Blue077C9E,

                            indicator: UnderlineTabIndicator(
                                borderSide: BorderSide(width: 2.0,color: AppColors.Blue077C9E,),
                                insets: EdgeInsets.symmetric(horizontal: 18)),

                            isScrollable: true,
                            labelStyle: TextStyle(color:AppColors.Blue077C9E,fontSize: 13,fontFamily: "Poppins",), //For Selected tab
                            unselectedLabelStyle: TextStyle(color:AppColors.defaultblack,fontSize: 13,fontFamily: "Poppins",),
                            onTap: (index) {
                              setState(() {
                                selectedIndex=index;
                              });
                            },
                            tabs: [
                              Tab(
                                text: "Description",
                              ),

                              Tab(
                                text: "Ingredients",
                              ),

                              Tab(
                                text: "Rating And Review",
                              ),


                            ],
                            controller: _tabController,
                            indicatorSize: TabBarIndicatorSize.tab),
                      ),

                      SizedBox(height:6,),
                      bodyArray[selectedIndex],
                      SizedBox(height: 43,),

                      Row(
                        children: [
                          Text("We Also Have",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 19,fontWeight: FontWeight.w600),),
                          Spacer(),
                          Text("View all",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 10,),),




                        ],
                      ),

                      SizedBox(height: 15,),

                      provider.relatedProductList.length>0?  Container(
                        height: 260,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: provider.relatedProductList.length>0?provider.relatedProductList.length:0,
                            itemBuilder: (context,j){
                              return Container(
                                margin: EdgeInsets.only(right: 10),

                                width: 160,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(8)),
                                    border: Border.all(color: AppColors.Blue077C9E),
                                    color: AppColors.pureWhite
                                ),

                                child: Container(

                                  child: Column(
                                    children: [
                                      Container(
                                        child: Stack(
                                          overflow: Overflow.visible,
                                          children: [

                                            Container(
                                              color:Colors.red,
                                              child: CachedNetworkImage(
                                                imageUrl: "${ provider.relatedProductList.length>0? provider.relatedProductList[j]:""}",

                                                fit: BoxFit.fill,
                                                errorWidget: (ctx,url,error)=>Image.asset("assets/images/item-image-large.png",fit: BoxFit.fill,),
                                              ),
                                            ),
                                            Positioned(
                                              right: 10,
                                              top: 5,
                                              child: Row(
                                                mainAxisAlignment: MainAxisAlignment.end,
                                                children: [
                                                  Container(
                                                      width: 25,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                          color: AppColors.pureBlack.withOpacity(0.8),
                                                          borderRadius: BorderRadius.all(Radius.circular(100))
                                                      ),
                                                      child: Center(child: Image.asset("assets/images/ic-noa-love.png"))),

                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 5,right: 5),
                                        width: 80,
                                        child: Center(

                                            child: Text("${ provider.relatedProductList[j]!.productName}",style: TextStyle(color: AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,)),
                                      ),
                                      SizedBox(height: 10,),

                                      Container(
                                        child: RichText(
                                          text: TextSpan(
                                            children: [
                                              TextSpan(text: "${ provider.relatedProductList[j]!.productSubSkuRequestModels[0].symbol}  ",style: TextStyle(color: AppColors.defaultblack,fontSize: 8),),
                                              TextSpan(text:"${provider.relatedProductList[j]!.productSubSkuRequestModels[0].price}  ",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 13,fontWeight: FontWeight.bold),),
                                              TextSpan(text: "(5 Pieces- 500g)",style: TextStyle(color: AppColors.gray8383,fontSize: 7,),),

                                            ]
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),

                                      Container(
                                        height: 24,
                                        width: 24,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(7)),
                                            color: AppColors.Blue077C9E
                                        ),
                                        child: Center(child: Icon(Icons.add,size: 10,color: AppColors.pureWhite,)),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ):SizedBox(),

                    ],
                  ),
                ),

                SizedBox(height: 34,),
                Stack(

                  children: [
                    Container(
                      width: double.infinity,
                      height:120,
                      padding: EdgeInsets.only(top: 10,bottom: 10),
                      decoration: BoxDecoration(
                        color: AppColors.lightBlueDropShadow,
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
                                Text("Total Price",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),),

                                SizedBox(height: 8,),

                                Row(
                                  children: [
                                    Text("AED",style: TextStyle(color: AppColors.defaultblack,fontSize: 10,),),
                                    SizedBox(width: 6,),
                                    Container(

                                        width: 70,
                                        child: Text(" ${provider.productDetails!=null?(provider.productDetails!.productSubSkuRequestModels.length>0?provider.productDetails!.productSubSkuRequestModels[0].price:0)*quantity:0}",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 28,fontWeight: FontWeight.w500),overflow: TextOverflow.ellipsis,)),


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
                          Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text("Quantity:",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,fontWeight: FontWeight.w500),),

                                SizedBox(height: 16,),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap:(){
                                        setState(() {
                                          if(quantity>0){
                                            quantity--;
                                          }
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.all(color: AppColors.defaultblack),
                                            color: AppColors.pureWhite
                                        ),
                                        child: Center(child: Icon(Icons.remove,color: AppColors.defaultblack,size: 15,)) ,
                                      ),
                                    ),

                                    SizedBox(width: 6,),

                                    Container(
                                      height: 40,
                                      width: 40,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          color: AppColors.pureWhite
                                      ),
                                      child: Center(child:  Text("${quantity}",style: TextStyle(color: AppColors.defaultblack,fontSize: 14,),),
                                      ) ,
                                    ),

                                    SizedBox(width: 6,),

                                    InkWell(
                                      onTap: (){
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(Radius.circular(8)),
                                            border: Border.all(color: AppColors.defaultblack),
                                            color: AppColors.Blue077C9E
                                        ),
                                        child: Center(child: Icon(Icons.add,color: AppColors.pureWhite,size: 15,)) ,
                                      ),
                                    ),
                                  ],
                                ),

                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: -1,
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8)),
                            color: AppColors.defaultblack
                        ),
                        child: Center(child:Icon(Icons.clear,color: AppColors.pureWhite,size: 10,)),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10,),

                Row(
                  children: [
                    SizedBox(width: 20,),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var data = BodyAddtoCart(
                            customerId:custommerId,
                            cartId: 0,
                            currencyId: 1,
                            productMasterId: provider.productDetails!.productMasterId,
                            productSubSKUId: provider.productDetails!.productSubSkuRequestModels[0].productSubSkuId,
                            quantity: quantity,
                            serviceDateTime:  provider.productDetails!.productDetailsRequestModel.serviceDateTime,
                            status: "ok",
                            storeId: provider.productDetails!.storeId,
                            supplierId: provider.productDetails!.supplierRequestModel.supplierId,
                            tempId: await provider.getTemptId(),
                            unitPrice:  provider.productDetails!.productSubSkuRequestModels[0].price.floor(),
                            inputFieldValueRequestModels:[],
                          );

                          await provider.addToCart(data).then((value) => {

                            Fluttertoast.showToast(
                                msg: "product added",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            ),
                            NavUtils.push(context, AddtoCartList(custommerId))

                          });
                        },
                        child: Container(
                          height: 52,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: AppColors.pureWhite,
                            border: Border.all(color: AppColors.Blue077C9E,width: 0.5),

                          ),

                          child: Center(child: Text("Go Back",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 15,fontWeight: FontWeight.w600),),),
                        ),
                      ),
                    ),
                    SizedBox(width: 14,),
                    Expanded(
                      child: InkWell(
                        onTap: () async {
                          var data = BodyAddtoCart(
                            customerId:custommerId,
                            cartId: 0,
                            currencyId: 1,
                            productMasterId: provider.productDetails!.productMasterId,
                            productSubSKUId: provider.productDetails!.productSubSkuRequestModels[0].productSubSkuId,
                            quantity: quantity,
                            serviceDateTime:  provider.productDetails!.productDetailsRequestModel.serviceDateTime,
                            status: "ok",
                            storeId: provider.productDetails!.storeId,
                            supplierId: provider.productDetails!.supplierRequestModel.supplierId,
                            tempId: await provider.getTemptId(),
                            unitPrice:  provider.productDetails!.productSubSkuRequestModels[0].price.floor(),
                            inputFieldValueRequestModels:[],
                          );

                          await provider.addToCart(data).then((value) => {

                            Fluttertoast.showToast(
                                msg: "product added",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            ),
                            NavUtils.push(context, AddtoCartList(custommerId))

                          });
                        },
                        child: Container(
                          height: 52,

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: AppColors.Blue077C9E,

                          ),

                          child: Center(child: Text("Add to cart",style: TextStyle(color: AppColors.pureWhite,fontSize: 14,fontWeight: FontWeight.w500),),),
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                  ],
                ),

                SizedBox(height: 20,),

              ],
            ),
          ),
        );
      },
    );
  }
}