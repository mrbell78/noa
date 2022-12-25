import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:noa/Home/Home.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/login-registration/login-controller.dart';
import 'package:noa/login-registration/register.dart';
import 'package:noa/product/all-product.dart';
import 'package:noa/utils/nav_utils.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget{


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController mail = TextEditingController();

  TextEditingController password = TextEditingController();

  bool validateName=false;
  bool validatePassword=false;
  bool _isRemember=false;

  @override
  void initState() {


    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CustommerLoginController>(

      builder: (context,provider,child){
        return Scaffold(
          backgroundColor: AppColors.pureWhite,
          body: SingleChildScrollView(
            child: Column(
              children: [

                Stack(
                  children: [
                    Image.asset("assets/images/ic-appbar.png"),
                    Positioned(
                        top:70,
                        left: 160,
                        child: Image.asset("assets/images/ic-noa.png",height: 30,width: 90,)),
                  ],
                ),



                Row(
                  children: [

                    Stack(
                      overflow: Overflow.visible,
                      children: [
                        Image.asset("assets/images/lori.png",height: 240,width: 188,),
                        Positioned(
                            left:139,
                            top: 86,
                            child: Image.asset("assets/images/ic-person.png",height:110 ,)),
                        Positioned(
                            top: 90,
                            left:250,
                            child: Image.asset("assets/images/ic-noa-colored.png",height: 30,)),
                      ],
                    ),





                  ],
                ),

                SizedBox(height:10,),

                Container(


                  margin: EdgeInsets.only(left:20,right: 20 ),
                  padding: EdgeInsets.all(10),

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    color: AppColors.pureWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: ListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [

                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: Text("Welcome To Noa",style: TextStyle(color: AppColors.defaultblack,fontSize: 26),),
                      ),


                      SizedBox(height:10,),

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
                              hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                              contentPadding: EdgeInsets.only(top: 20),
                              errorText: validateName? 'Name Can\'t Be Empty':null
                          ),
                        ),
                      ),

                      SizedBox(height: 10,),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: Row(
                          children: [
                            Container(
                                child:Image.asset("assets/images/ic-phone.png")

                            ),
                            SizedBox(width: 8,),
                            Text("Password",style: TextStyle(color: AppColors.defaultblack,fontSize: 14),),

                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 20,right: 20),
                        child: TextField(
                          obscureText: true,
                          controller: password,
                          style: TextStyle(color: AppColors.defaultblack,fontSize: 10),
                          decoration: InputDecoration(
                              hintText: "***",

                              hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 10),
                              contentPadding: EdgeInsets.all(5),
                              errorText: validateName? 'Name Can\'t Be Empty':null
                          ),
                        ),
                      ),

                      SizedBox(height: 15,),

                      GestureDetector(
                        onTap: ()async{
                          setState(() {
                            mail.text.isEmpty? validateName=true:validateName=false;
                            password.text.isEmpty? validatePassword=true:validatePassword=false;
                          });

                          if(mail.text.isNotEmpty && password.text.isNotEmpty){

                            await  provider.postLogin(mail.text,password.text,_isRemember).then((value) {
                              print("the value is $value");

                              Fluttertoast.showToast(
                                  msg: "Login Success",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                              NavUtils.push(context, Home());

                            });
                          }
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 50,
                          decoration: BoxDecoration(
                              color: AppColors.Blue077C9E,
                              borderRadius: BorderRadius.all(Radius.circular(50))
                          ),
                          child: Center(child: Text("Login",style: TextStyle(color: AppColors.pureWhite,fontSize: 14,fontWeight: FontWeight.w600),)),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Center(
                        child: Container(
                          child: Text("Already Noa Member ?",style: TextStyle(color: AppColors.defaultblack, fontSize: 12)),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Center(
                        child: InkWell(
                          onTap: (){
                            NavUtils.push(context, Register());
                          },
                          child: Container(
                            child: Text("Register",style: TextStyle(color: AppColors.DeepYelowF37226, fontSize: 16,fontWeight: FontWeight.bold)),
                          ),
                        ),
                      ),

                    ],
                  ),
                ),


                Image.asset("assets/images/ic-footer.png"),

              ],
            ),
          ),
        );
      },

    );
  }
}