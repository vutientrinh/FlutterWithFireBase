import 'package:flutter/cupertino.dart';
import 'package:flutterwithfirebase/consts/consts.dart';

Widget applogoWidget(){
  return Image.asset(icAppLogo).box.white.size(77, 77).padding(const EdgeInsets.all(8)).rounded.make();
}