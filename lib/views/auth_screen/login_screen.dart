import 'package:flutter/material.dart';
import 'package:flutterwithfirebase/consts/consts.dart';
import 'package:flutterwithfirebase/views/auth_screen/signup_screen.dart';
import 'package:flutterwithfirebase/widget_common/applogo_widget.dart';
import 'package:flutterwithfirebase/widget_common/bg_widget.dart';
import 'package:flutterwithfirebase/widget_common/custom_textfield.dart';
import 'package:flutterwithfirebase/widget_common/our_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              (context.screenHeight*0.1).heightBox,
              applogoWidget(),
              10.heightBox,
              "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
              10.heightBox,
              Column(
                children: [
                  customTextField(hint: emailHint, title: email),
                  customTextField(hint: passwordHint, title: password),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(onPressed: (){}, child: forgetPass.text.make()),
                  ),
                  5.heightBox,
                  ourButton(color: redColor, title: login, textColor: whiteColor, onPress: (){})
                      .box.width(context.screenWidth - 50).make(),
                  5.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  ourButton(title: signUp, color: lightGolden, textColor: redColor, onPress: (){
                    Get.to(()=> SignupScreen());
                  })
                      .box.width(context.screenWidth - 50).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  5.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      3, (index) =>Padding(padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: lightGrey,
                        radius: 25,
                        child: Image.asset(socialIconList[index],width: 30,),
                      ),
                    ),
                    )
                  )

                ],
              ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth-70).shadowSm.make(),
            ],
          ),
        ),
      )
    );
  }
}
