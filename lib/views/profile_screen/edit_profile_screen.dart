import 'package:flutter/material.dart';
import 'package:flutterwithfirebase/consts/consts.dart';
import 'package:flutterwithfirebase/consts/images.dart';
import 'package:flutterwithfirebase/widget_common/bg_widget.dart';
import 'package:flutterwithfirebase/widget_common/custom_textfield.dart';
import 'package:flutterwithfirebase/widget_common/our_button.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [
              Image.asset(
                  imgProfile2,
                  width: 100,
                  fit: BoxFit.fill,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                ourButton(color: redColor, onPress: () {
                  // Logic to change profile picture
                }, textColor: whiteColor, title: 'Change'),
              20.heightBox,
              customTextField(hint: nameHint, title: name, isPass: false),
              customTextField(hint: emailHint, title: password, isPass: false),
            ],
          ).box.white.shadowSm.rounded.padding(const EdgeInsets.all(16)).margin(const EdgeInsets.only(top : 50 )).make(),
        ),
      ),
    );
  }
}