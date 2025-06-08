import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterwithfirebase/consts/consts.dart';
import 'package:flutterwithfirebase/views/home_screen/home.dart';
import 'package:flutterwithfirebase/views/home_screen/home_screen.dart';
import 'package:flutterwithfirebase/widget_common/applogo_widget.dart';
import 'package:get/get.dart';

import '../auth_screen/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  changeScreen(){
    Future.delayed(Duration(seconds: 3),(){
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          // User is signed out
          Get.to(()=> const LoginScreen());
        } else {
          // User is signed in
          Get.to(()=> const Home());
        }
      });
      // Get.to(()=>LoginScreen());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    changeScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(icSplashBg, width: 300),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            Spacer(),
            30.heightBox,

          ],
        ),
      ),

    );
  }
}
