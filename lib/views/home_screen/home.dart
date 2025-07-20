import 'package:flutter/material.dart';
import 'package:flutterwithfirebase/consts/consts.dart';
import 'package:flutterwithfirebase/controller/home_controller.dart';
import 'package:flutterwithfirebase/views/cart_screen/cart_screen.dart';
import 'package:flutterwithfirebase/views/category_screen/category_screen.dart';
import 'package:flutterwithfirebase/views/home_screen/home_screen.dart';
import 'package:flutterwithfirebase/views/profile_screen/profile_screen.dart';
import 'package:get/get.dart';

import '../../widget_common/exit_dialog.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  //init home controller

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(HomeController());

    var navbarItems = [
      BottomNavigationBarItem(
          icon: Image.asset(icHome, width: 26), label: home),
      BottomNavigationBarItem(
          icon: Image.asset(icCategories, width: 26), label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(icCart, width: 26), label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(icProfile, width: 26), label: account),
    ];

    var navBody = [
      HomeScreen(),
      CategoryScreen(),
      CartScreen(),
      ProfileScreen()
    ];

    return WillPopScope(
      onWillPop: () async {
        showDialog(context: context, builder: (context)=> exitDialog());
        return false;
      },
      child: Scaffold(
        body: Column(
          children: [
            Obx(
              () => Expanded(
                  child: navBody.elementAt(controller.currentNavIndex.value)),
            )
          ],
        ),
        bottomNavigationBar: Obx(
          () => BottomNavigationBar(
            currentIndex: controller.currentNavIndex.value,
            selectedItemColor: redColor,
            selectedLabelStyle: TextStyle(fontFamily: semibold),
            type: BottomNavigationBarType.fixed,
            backgroundColor: whiteColor,
            items: navbarItems,
            onTap: (value) {
              controller.currentNavIndex.value = value;
            },
          ),
        ),
      ),
    );
  }
}
