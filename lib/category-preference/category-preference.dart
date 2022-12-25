
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:noa/app-colors/app-colors.dart';

class CategoryPerence extends StatefulWidget{
  @override
  State<CategoryPerence> createState() => _CategoryPerenceState();
}

class _CategoryPerenceState extends State<CategoryPerence> {
  bool ch1=false;
  bool ch2=false;
  bool ch3=false;
  bool ch4=false;
  bool ch5=false;
  bool ch6=false;
  bool ch7=false;
  bool ch8=false;
  bool ch9=false;
  bool ch10=false;
  bool ch11=false;
  bool ch12=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Stack(
            children: [
              Image.asset("assets/images/ic-appbar.png",),
              Positioned(
                  top:70,
                  left: 160,
                  child: Image.asset("assets/images/ic-noa.png",height: 30,width: 90,)),
            ],
          ),
          Container(
            width:double.infinity,
            height: MediaQuery.of(context).size.height-185,
            child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              children: [


                Container(

                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Text("Category Preference",style: TextStyle(color: AppColors.defaultblack,fontSize: 30,fontWeight: FontWeight.bold),)),
                Container(

                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Text("Uncheck the categories you will never purchase.",style: TextStyle(color: AppColors.defaultblack,fontSize: 13,),)),
                SizedBox(height: 10,),
                Container(
                  margin: EdgeInsets.only(left: 20,right: 20),
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 20,
                    children: [

                      Stack(
                        children: [
                          Image.asset("assets/images/water.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch1==false){
                                    ch1=true;
                                  }else{
                                    ch1=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch1?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch1?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch1?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/laundry.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch2==false){
                                    ch2=true;
                                  }else{
                                    ch2=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch2?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch2?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch2?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/handyman.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch3==false){
                                    ch3=true;
                                  }else{
                                    ch3=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch3?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch3?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch3?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/mini-market.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch4==false){
                                    ch4=true;
                                  }else{
                                    ch4=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch4?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch4?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch4?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/flower-shop.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch5==false){
                                    ch5=true;
                                  }else{
                                    ch5=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch5?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch5?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch5?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/plants.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch6==false){
                                    ch6=true;
                                  }else{
                                    ch6=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch6?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch6?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch6?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/meat-shop.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch7==false){
                                    ch7=true;
                                  }else{
                                    ch7=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch7?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch7?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch7?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/fish.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch8==false){
                                    ch8=true;
                                  }else{
                                    ch8=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch8?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch8?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch8?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/fuel.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch9==false){
                                    ch9=true;
                                  }else{
                                    ch9=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch9?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch9?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch9?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/home-service.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch10==false){
                                    ch10=true;
                                  }else{
                                    ch10=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch10?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch10?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch10?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/bakery.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch11==false){
                                    ch11=true;
                                  }else{
                                    ch11=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch11?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch11?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch11?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),

                      Stack(
                        children: [
                          Image.asset("assets/images/pet.png"),
                          Positioned(
                            right: 6,
                            top: 5,
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  if(ch12==false){
                                    ch12=true;
                                  }else{
                                    ch12=false;
                                  }
                                });
                              },
                              child: Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                    color: ch12?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                    border: Border.all(color:ch12?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                                ),
                                child: ch12?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                              ),
                            ),
                          ),
                        ],
                      ),


                    ],
                  ),
                ),
                SizedBox(height: 15,),

                Container(

                    margin: EdgeInsets.only(left: 20,right: 20),
                    child: Text("Category Preference",style: TextStyle(color: AppColors.defaultblack,fontSize: 24,fontWeight: FontWeight.bold),)),
                SizedBox(height: 10,),
                Row(
                  children: [
                    SizedBox(width: 20,),
                    Stack(
                      children: [
                        Image.asset("assets/images/dietary.png"),
                        Positioned(
                          right: 6.5,
                          top: 6.5,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(ch1==false){
                                  ch1=true;
                                }else{
                                  ch1=false;
                                }
                              });
                            },
                            child: Container(
                              width: 21,
                              height: 21,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: ch1?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                  border: Border.all(color:ch1?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                              ),
                              child: ch1?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 11,),
                    Stack(
                      children: [
                        Image.asset("assets/images/planetary.png"),
                        Positioned(
                          right: 6.5,
                          top: 6.5,
                          child: GestureDetector(
                            onTap: (){
                              setState(() {
                                if(ch1==false){
                                  ch1=true;
                                }else{
                                  ch1=false;
                                }
                              });
                            },
                            child: Container(
                              width: 21,
                              height: 21,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                  color: ch1?AppColors.LightSkyblue3FADCD:AppColors.pureWhite,
                                  border: Border.all(color:ch1?AppColors.Blue077C9E:AppColors.GrayA8A7A7)
                              ),
                              child: ch1?Icon(Icons.check,size: 15,color: AppColors.pureWhite,):SizedBox(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 15,),

                Row(
                  children: [
                    Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 200,
                          height: 45,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                            color: AppColors.Blue077C9E
                          ),
                          child: Center(child: Text("Save & Continiue",style: TextStyle(color: AppColors.pureWhite,fontSize: 14,fontWeight: FontWeight.w600),)),
                        ),
                        SizedBox(height: 3,),
                        Container(
                          margin: EdgeInsets.only(left: 20),
                          width: 200,
                          child:Center(child: Text("You can change any time in the preference setting",style: TextStyle(color: AppColors.defaultblack,fontSize: 12,),overflow: TextOverflow.ellipsis,)),
                        ),

                      ],
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: (){

                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          border: Border.all(color: AppColors.DeepYelowF37226),
                          color: AppColors.pureWhite
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/ic-longarrow-right-black.png"),
                            SizedBox(height: 10,),
                            Text("Skip",style: TextStyle(color: AppColors.defaultblack,fontSize: 12),)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                  ],
                ),

                Spacer(),
                SizedBox(height: 30,)


              ],
            ),
          ),

          Image.asset("assets/images/ic-footer.png",width: double.infinity,height: 40,fit: BoxFit.fill,),
        ],
      )

    );
  }
}