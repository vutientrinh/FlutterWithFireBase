import 'package:flutter/services.dart';
import 'package:flutterwithfirebase/consts/consts.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ProfileController extends GetxController {
  var profileImagePath = ''.obs;

  changeImage(context) async {
    var status = await Permission.photos.request();
    if (status.isDenied || status.isPermanentlyDenied) {
      VxToast.show(context, msg: "Permission denied to access gallery");
      return;
    }

    try {
      final img = await ImagePicker().pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (img == null) return;
      profileImagePath.value = img.path;
    } on PlatformException catch (e) {
      VxToast.show(context, msg: e.toString());
    }
  }
}

