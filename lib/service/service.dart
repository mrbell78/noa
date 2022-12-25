
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:noa/app-colors/app-colors.dart';
import 'package:noa/service/service-controller.dart';
import 'package:noa/service/service-details.dart';
import 'package:noa/utils/nav_utils.dart';
import 'package:provider/provider.dart';
import 'model/body/noa-service-input.dart' as custommerreq;
import 'model/body/noa-service-input.dart';

class NoaService extends StatefulWidget{

  @override
  State<NoaService> createState() => _NoaServiceState();
}

class _NoaServiceState extends State<NoaService> {

  String? selectLocationAppbar;

  List<String>locationString=["AC cleaning","Sofa cleaning","Bed cleaning"];

  @override
  void initState() {
    Provider.of<ServiceController>(context, listen: false).postServiceInput();
    Provider.of<ServiceController>(context, listen: false).getUserData();
    super.initState();
  }

  TextEditingController description = TextEditingController();
  TextEditingController note = TextEditingController();
  final ImagePicker _picker = ImagePicker();
   List<XFile?>  selected=[];
  late final XFile? image;

  Future<List<XFile?>> selectImage()async{
    List<XFile>selecteImage = (await _picker.pickMultiImage())!;
    if(selecteImage!=null && selecteImage!.length>0){
      setState(() {
        //image=selected;
        selected.addAll(selecteImage);
      });

      return selected;
    }else return selecteImage;
  }

  @override
  void dispose() {
    description.dispose();
    note.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Consumer<ServiceController>(
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
            elevation: 0.0,
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 120,
                  color: AppColors.Blue077C9E,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Container(
                            width: 113,
                            height: 80,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: AppColors.pureWhite
                            ),
                            child: Image.asset("assets/images/image-wefix.png"),
                          ),
                          Spacer(),
                          Column(

                            children: [
                              Text("We Fix UAE",style: TextStyle(color: AppColors.pureWhite,fontSize: 22,fontWeight: FontWeight.w600),),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Image.asset("assets/images/ic-location-white.png"),
                                  SizedBox(width: 5,),

                                  Text("2 KM",style: TextStyle(color: AppColors.pureWhite,fontSize: 12,),),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(width: 20,)
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
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
                            Image.asset("assets/images/image-cleaning.png"),

                            SizedBox(width: 8,)

                          ],
                        );
                      }),
                ),
                SizedBox(height: 15,),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(left: 15,right: 15),
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: AppColors.pureWhite,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Cleaning",style: TextStyle(color: AppColors.Blue077C9E,fontSize: 19,fontWeight: FontWeight.w600),),
                      SizedBox(height: 8,),
                      Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            color: AppColors.blueF5F8FD
                        ),
                        child:Center(
                          child: DropdownButton(
                              hint: Text("Full house cleaning",style: TextStyle(color:AppColors.hintextColor,fontSize: 12, ),),
                              value: selectLocationAppbar,
                              underline: SizedBox(),
                              icon: Row(children: [
                                Image.asset("assets/images/ic-dropdown-appbar.png"),
                                SizedBox(width: 20,)
                              ],),
                              onChanged: (newValue){
                                setState(() {
                                  selectLocationAppbar=newValue.toString();
                                });
                              },
                              isExpanded: true,
                              items:locationString.map((e) =>
                                  DropdownMenuItem(
                                    value: e,
                                    child:Text("       $e",
                                      style: TextStyle(color: AppColors.hintextColor,fontSize:12,),),
                                  )).toList()),
                        ),
                      ),
                      SizedBox(height: 15,),

                      Row(
                        children: [
                          SizedBox(width: 15,),
                          Container(
                            child:Text("Full house cleaning",style: TextStyle(color:AppColors.defaultblack,fontSize: 13,fontWeight: FontWeight.bold ),),
                          ),
                          Spacer(),

                          Container(
                            child:Text("AED 400",
                              style: TextStyle(
                                  color:AppColors.Skyblue00A3E0,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          SizedBox(width: 15,)
                        ],
                      ),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child:Text("Description",style: TextStyle(color:AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.bold ),),

                          ),
                          SizedBox(height: 5,),
                          Container(
                                  margin: EdgeInsets.only(left: 15,right: 15),
                                  child:Text("(Optional)",style: TextStyle(color:AppColors.gray8383,fontSize: 8,),),
                                ),
                          SizedBox(height: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child: TextField(
                              controller: description,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 9),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Write your job details",
                                hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 9),
                                contentPadding:
                                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: AppColors.grayDBDBDB),
                            ),
                          ),
                          SizedBox(height: 15,),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child:Text("Add Image",style: TextStyle(color:AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.bold ),),

                          ),
                          SizedBox(height: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child:Text("Sum up your review in one line",style: TextStyle(color:AppColors.gray8383,fontSize: 8,),),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            height:35,
                            padding:EdgeInsets.all(8),
                            margin: EdgeInsets.only(left: 15,right: 15),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                color: AppColors.pureWhite,
                                border: Border.all(color: AppColors.GrayA8A7A7,width: 1)
                            ),

                            child: Center(
                              child: Row(
                                children: [
                                  Container(
                                    child:Text("Chose Image",style: TextStyle(color:AppColors.gray8383,fontSize: 9, ),),
                                  ),
                                  Spacer(),
                                  GestureDetector(
                                    onTap: (){


                                      selectImage().then((value) async {
                                         value.forEach((element) async {
                                           String fileName= element!.path.split('/').last;
                                           //List<String> fileNamee = element!.path.split('/').last;

                                           //print("customer id: ${provider.custommerLogin!.customerId}");

                                           FormData formdata = FormData.fromMap(
                                               {
                                                 "CustomerId":"${provider.custommerLogin!.customerId}",
                                                 "Image": await MultipartFile.fromFile(element!.path, filename: fileName,),
                                               }

                                           );
                                           print("image name: ${fileName}");
                                           await provider.upLoadProfileImage(formdata);


                                         });
                                      });

                                    },
                                    child: Container(
                                      width: 60,
                                      height: 26,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(4)),
                                          color: AppColors.Blue077C9E
                                      ),
                                      child: Center(
                                        child:Text("Upload",style: TextStyle(color:AppColors.pureWhite,fontSize: 7,),),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 3,),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child:Text("File Type .jpeg, .png (Max file size 25 MB)..",style: TextStyle(color:AppColors.gray8383,fontSize: 9,),),
                          ),
                          SizedBox(height: 15,),

                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child:Text("Any Special Note",style: TextStyle(color:AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.bold ),),

                          ),
                          SizedBox(height: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child:Text("(Optional)",style: TextStyle(color:AppColors.gray8383,fontSize: 8,),),
                          ),
                          SizedBox(height: 5,),
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child: TextField(
                              controller: note,
                              style: TextStyle(color: AppColors.defaultblack,fontSize: 9),
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintText: "Write any special note",
                                hintStyle: TextStyle(color: AppColors.gray8383,fontSize: 9),
                                contentPadding:
                                EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10)),
                              border: Border.all(color: AppColors.grayDBDBDB),
                            ),
                          ),
                        ],
                      )

                      // ListView.builder(
                      //     shrinkWrap: true,
                      //     physics: NeverScrollableScrollPhysics(),
                      //     itemCount: provider.customInputResponsedata.length,
                      //     itemBuilder: (context,index){
                      //       return Column(
                      //         crossAxisAlignment: CrossAxisAlignment.start,
                      //         children: [
                      //           Container(
                      //             margin: EdgeInsets.only(left: 15,right: 15),
                      //             child:Text("${provider.customInputResponsedata[index]?.name}",style: TextStyle(color:AppColors.defaultblack,fontSize: 15,fontWeight: FontWeight.bold ),),
                      //
                      //           ),
                      //           /*SizedBox(height: 5,),
                      //           Container(
                      //             margin: EdgeInsets.only(left: 15,right: 15),
                      //             child:Text("(Optional)",style: TextStyle(color:AppColors.gray8383,fontSize: 8,),),
                      //           ),*/
                      //           SizedBox(height: 5,),
                      //           provider.customInputResponsedata[index]?.name=="Images"?
                      //
                      //           Container(
                      //             height:35,
                      //             padding:EdgeInsets.all(8),
                      //             margin: EdgeInsets.only(left: 15,right: 15),
                      //             decoration: BoxDecoration(
                      //                 borderRadius: BorderRadius.all(Radius.circular(10)),
                      //                 color: AppColors.pureWhite,
                      //               border: Border.all(color: AppColors.GrayA8A7A7,width: 1)
                      //             ),
                      //
                      //             child: Center(
                      //               child: Row(
                      //                 children: [
                      //                   Container(
                      //                     child:Text("Chose Image",style: TextStyle(color:AppColors.gray8383,fontSize: 9, ),),
                      //                   ),
                      //                   Spacer(),
                      //                   GestureDetector(
                      //                     onTap: (){
                      //
                      //                     },
                      //                     child: Container(
                      //                       width: 60,
                      //                       height: 26,
                      //                       decoration: BoxDecoration(
                      //                         borderRadius: BorderRadius.all(Radius.circular(4)),
                      //                         color: AppColors.Blue077C9E
                      //                       ),
                      //                       child: Center(
                      //                         child:Text("Upload",style: TextStyle(color:AppColors.pureWhite,fontSize: 7,),),
                      //                       ),
                      //                     ),
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           )
                      //           :Container(
                      //             margin: EdgeInsets.only(left: 15,right: 15),
                      //             child: TextField(
                      //               controller:provider.mycontroller[index],
                      //               decoration: InputDecoration(
                      //                 border: InputBorder.none,
                      //                 focusedBorder: InputBorder.none,
                      //                 enabledBorder: InputBorder.none,
                      //                 errorBorder: InputBorder.none,
                      //                 disabledBorder: InputBorder.none,
                      //                 contentPadding:
                      //                 EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                      //               ),
                      //             ),
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.all(Radius.circular(10)),
                      //               border: Border.all(color: AppColors.grayDBDBDB),
                      //             ),
                      //           ),
                      //           SizedBox(height: 5,)
                      //         ],
                      //       );
                      //     })

                    ],
                  ),
                ),
                SizedBox(height: 25,),

                InkWell(
                  onTap: () async {
                    print("the image idata is ${provider.imagedata}");
                   await provider.getTemptId().then((value) {

                     provider.csdata.add(
                         CustomInputDataRequestModels(
                             customInputDataId: 0,
                             invoiceDetailsId: 0,
                             invoiceMasterId: 0,
                             customerId: provider.custommerLogin!.customerId,
                             customInputId: provider.customInputResponsedata[0]?.customInputId,
                             values: [],
                             tempId: "${value}",
                             value: "${374}",
                             name: provider.customInputResponsedata[0]?.name
                         )
                     );

                     provider.csdata.add(
                         CustomInputDataRequestModels(
                             customInputDataId: 0,
                             invoiceDetailsId: 0,
                             invoiceMasterId: 0,
                             customerId: provider.custommerLogin!.customerId,
                             customInputId: provider.customInputResponsedata[1]?.customInputId,
                             values: [],
                             tempId: "${value}",
                             value: "${40}",
                             name: provider.customInputResponsedata[1]?.name
                         )
                     );


                     provider.csdata.add(
                         CustomInputDataRequestModels(
                             customInputDataId: 0,
                             invoiceDetailsId: 0,
                             invoiceMasterId: 0,
                             customerId: provider.custommerLogin!.customerId,
                             customInputId: provider.customInputResponsedata[2]?.customInputId,
                             values: [],
                             tempId: "${value}",
                             value: "${description.text}",
                             name: provider.customInputResponsedata[2]?.name
                         )
                     );

                     provider.csdata.add(
                         CustomInputDataRequestModels(
                             customInputDataId: 0,
                             invoiceDetailsId: 0,
                             invoiceMasterId: 0,
                             customerId: provider.custommerLogin!.customerId,
                             customInputId: provider.customInputResponsedata[3]?.customInputId,
                             values: provider.imagedata,
                             tempId: "${value}",
                             value: "${provider.imurl}",
                             name: provider.customInputResponsedata[3]?.name
                         )
                     );

                     provider.csdata.add(
                         CustomInputDataRequestModels(
                             customInputDataId: 0,
                             invoiceDetailsId: 0,
                             invoiceMasterId: 0,
                             customerId: provider.custommerLogin!.customerId,
                             customInputId: provider.customInputResponsedata[4]?.customInputId,
                             values: [],
                             tempId: "${value}",
                             value: "${note.text}",
                             name: provider.customInputResponsedata[4]?.name
                         )
                     );

                     provider.csdata.add(
                         CustomInputDataRequestModels(
                             customInputDataId: 0,
                             invoiceDetailsId: 0,
                             invoiceMasterId: 0,
                             customerId: provider.custommerLogin!.customerId,
                             customInputId: provider.customInputResponsedata[5]?.customInputId,
                             values: [],
                             tempId: "${value}",
                             value: "${400}",
                             name: provider.customInputResponsedata[5]?.name
                         )
                     );

                     provider.csdata.add(
                         CustomInputDataRequestModels(
                             customInputDataId: 0,
                             invoiceDetailsId: 0,
                             invoiceMasterId: 0,
                             customerId: provider.custommerLogin!.customerId,
                             customInputId: provider.customInputResponsedata[6]?.customInputId,
                             values: [],
                             tempId: "${value}",
                             value: "11424",
                             name: "ProductMasterId"
                         )
                     );


                   });

                 provider.csdata.forEach((element) {
                   print("cs data is ${element.value}");
                 });



                   provider.data2= custommerreq.BodyServiceInput(
                      name: "NoaService",
                      customInputDataRequestModels: provider.csdata
                    );
                  await  provider.postServiceInput();
                    NavUtils.push(context, ServiceDetails(selected,description.text,"11424"));
                  },

                  child: Container(
                    margin: EdgeInsets.only(left: 15,right: 15),
                    height: 52,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: AppColors.pureWhite,
                      border: Border.all(color: AppColors.Blue077C9E,width: 1)
                    ),
                    child:Center(child: Text("Continue",style: TextStyle(color:AppColors.Blue077C9E,fontSize:15,fontWeight: FontWeight.w600 ),)),
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
        );
      },
    );
  }
}