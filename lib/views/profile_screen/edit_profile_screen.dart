import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterwithfirebase/consts/consts.dart';
import 'package:flutterwithfirebase/consts/images.dart';
import 'package:flutterwithfirebase/controller/profile_controller.dart';
import 'package:flutterwithfirebase/widget_common/bg_widget.dart';
import 'package:flutterwithfirebase/widget_common/custom_textfield.dart';
import 'package:flutterwithfirebase/widget_common/our_button.dart';
import 'package:get/get.dart';
import 'package:velocity_x/velocity_x.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  var controller = Get.find<ProfileController>();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Edit Profile'),
            centerTitle: true,
          ),
          body: Obx(
            () => Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                controller.profileImagePath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.fill,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : Image.file(
                        File(controller.profileImagePath.value),
                        width: 100,
                        fit: BoxFit.fill,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourButton(
                    color: redColor,
                    onPress: () {
                      controller.changeImage(context);
                    },
                    textColor: whiteColor,
                    title: 'Change'),
                const Divider(),
                20.heightBox,
                customTextField(hint: nameHint, title: name, isPass: false),
                customTextField(
                    hint: emailHint, title: password, isPass: false),
                20.heightBox,
                SizedBox(
                  width: context.screenWidth - 60,
                  child: ourButton(
                      color: redColor,
                      onPress: () {
                        // Logic to change profile picture
                      },
                      textColor: whiteColor,
                      title: 'Save'),
                ),
              ],
            )
                .box
                .white
                .shadowSm
                .rounded
                .padding(const EdgeInsets.all(16))
                .margin(
                  const EdgeInsets.only(top: 50, left: 12, right: 12),
                )
                .rounded
                .make(),
          )),
    );
  }
}
