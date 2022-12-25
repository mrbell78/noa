import 'package:flutter/material.dart';
import 'package:noa/product/product-controller.dart';
import 'package:noa/product/product-details.dart';
import 'package:noa/profile/my-profile.dart';
import 'package:noa/profile/profile-controller.dart';
import 'package:noa/service/service-controller.dart';
import 'package:noa/service/service-details.dart';
import 'package:noa/service/service.dart';
import 'package:noa/splash/splash.dart';
import 'package:noa/truck-details/truck-controller.dart';
import 'package:noa/product/all-product.dart';
import 'package:provider/provider.dart';

import 'Home/Home.dart';
import 'Home/home-controller.dart';
import 'category-preference/category-preference.dart';
import 'locator/locator.dart';
import 'login-registration/login-controller.dart';
import 'login-registration/login.dart';



void main()async {
  await setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(

      providers: [
        ChangeNotifierProvider(create: (context) => CustommerLoginController()),
        ChangeNotifierProvider(create: (context) => TruckController()),
        ChangeNotifierProvider(create: (context) => HomeController()),
        ChangeNotifierProvider(create: (context) => ProductController()),
        ChangeNotifierProvider(create: (context) => ProfileController()),
        ChangeNotifierProvider(create: (context) => ServiceController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          fontFamily: "Nunito"
        ),

        home: Splash(),
      ),
    );
  }
}

