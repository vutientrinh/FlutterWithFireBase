import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutterwithfirebase/consts/consts.dart';
import 'package:flutterwithfirebase/controller/auth_controller.dart';
import 'package:flutterwithfirebase/controller/profile_controller.dart';
import 'package:flutterwithfirebase/services/firestore_services.dart';
import 'package:flutterwithfirebase/views/auth_screen/login_screen.dart';
import 'package:flutterwithfirebase/views/profile_screen/components/details_card.dart';
import 'package:flutterwithfirebase/views/profile_screen/edit_profile_screen.dart';
import 'package:flutterwithfirebase/widget_common/bg_widget.dart';
import 'package:get/get.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());
    return bgWidget(
      child: Scaffold(
          body: StreamBuilder(
              stream: FireStoreServices.getUser(currentUser!.uid),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return const Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor)));
                }
                if (snapshot.data!.docs.isEmpty) {
                  return const Center(
                    child: Text('No user data found'),
                  );
                }
                else {
                  var data = snapshot.data!.docs[0];
                  return SafeArea(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: const Align(
                          alignment: Alignment.topRight,
                          child: Icon(
                            Icons.edit,
                            color: whiteColor,
                          ),
                        ).onTap(() {
                          Get.to(() => const EditProfileScreen());
                        }),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Image.asset(
                              imgProfile2,
                              width: 100,
                              fit: BoxFit.fill,
                            ).box.roundedFull.clip(Clip.antiAlias).make(),
                            Expanded(
                                child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                "${data['name']}"
                                    .text
                                    .fontFamily(semibold)
                                    .white
                                    .make(),
                                5.heightBox,
                                "customer@example.com".text.white.make(),
                              ],
                            )),
                            OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                    side: const BorderSide(
                                  color: whiteColor,
                                )),
                                onPressed: () async {
                                  await Get.put(AuthController())
                                      .signoutMethod();
                                  Get.offAll(() => const LoginScreen());
                                },
                                child: logout.text.make())
                          ],
                        ),
                      ),
                      20.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          detailsCard(
                              count: "00",
                              title: "in your cart",
                              width: context.screenWidth / 3.4),
                          detailsCard(
                              count: "32",
                              title: "in your wishlist",
                              width: context.screenWidth / 3.4),
                          detailsCard(
                              count: "675",
                              title: "your order",
                              width: context.screenWidth / 3.4),
                        ],
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: lightGrey,
                          );
                        },
                        itemCount: profileButtonList.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.asset(
                              profileButtonIcon[index],
                              width: 22,
                            ),
                            title: profileButtonList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          );
                        },
                      )
                          .box
                          .white
                          .rounded
                          .margin(const EdgeInsets.all(12))
                          .padding(const EdgeInsets.symmetric(horizontal: 16))
                          .shadowSm
                          .make()
                          .box
                          .color(redColor)
                          .make(),
                    ],
                  ));
                }
              })),
    );
  }
}
