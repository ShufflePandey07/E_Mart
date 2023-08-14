import 'package:Indi_shark/consts/colors.dart';
import 'package:Indi_shark/consts/consts.dart';
import 'package:Indi_shark/views/auth_screen/login_screen.dart';
import 'package:Indi_shark/views/home_screen/home.dart';
import 'package:Indi_shark/widgets_common/applogo_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //creating a method to change screen
  changeScreen(){
    Future.delayed(const Duration(seconds: 3),(){
        Get.to(()=>const LoginScreen());
    });
  }

  @override
  void initState(){
    changeScreen();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //background color for the first page when loading
      backgroundColor: blackColor,
      body: Center(
        child: Column(
          children: [
            Align(alignment: Alignment.topLeft, child: Image.asset(icSplashBg, width: 300)),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            const Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,


          ],
        ),

      ),
    );
  }
}