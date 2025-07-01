import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutterwithfirebase/consts/consts.dart';
import 'package:flutterwithfirebase/controller/profile_controller.dart';
import 'package:flutterwithfirebase/widget_common/bg_widget.dart';
import 'package:flutterwithfirebase/widget_common/custom_textfield.dart';
import 'package:flutterwithfirebase/widget_common/our_button.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

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
                data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                    ? Image.asset(
                        imgProfile2,
                        width: 100,
                        fit: BoxFit.fill,
                      ).box.roundedFull.clip(Clip.antiAlias).make()
                    : data['imageUrl'] != '' &&
                            controller.profileImageLink.isEmpty
                        ? Image.network(
                            data['imageUrl'],
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
                customTextField(
                    controller: controller.nameController,
                    hint: nameHint,
                    title: name,
                    isPass: false),
                10.heightBox,
                customTextField(
                    controller: controller.oldPassController,
                    hint: passwordHint,
                    title: oldPass,
                    isPass: false),
                10.heightBox,
                customTextField(
                    controller: controller.oldPassController,
                    hint: passwordHint,
                    title: newPass,
                    isPass: false),
                20.heightBox,
                controller.isLoading.value
                    ? CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      )
                    : SizedBox(
                        width: context.screenWidth - 60,
                        child: ourButton(
                            color: redColor,
                            onPress: () async {
                              controller.isLoading(true);


                              if(controller.profileImagePath.value.isNotEmpty){
                                await controller.uploadProfileImage();
                              }
                              else{
                                controller.profileImageLink = data['imageUrl'];
                              }

                              if(data['password'] == controller.oldPassController.text){
                                await controller.updateProfile(
                                  imageUrl: controller.profileImageLink,
                                  name: controller.nameController.text,
                                  password: controller.newPassController.text,
                                );
                                VxToast.show(context, msg: 'Profile updated');
                              }
                              else{
                                VxToast.show(context, msg: 'Wrong old password');
                                controller.isLoading(false);
                              }

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
