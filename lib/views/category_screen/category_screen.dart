import 'package:flutter/material.dart';
import 'package:flutterwithfirebase/consts/consts.dart';
import 'package:flutterwithfirebase/controller/product_controller.dart';
import 'package:flutterwithfirebase/views/category_screen/category_details.dart';
import 'package:flutterwithfirebase/widget_common/bg_widget.dart';
import 'package:get/get.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProductController());
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.fontFamily(bold).white.make(),
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 9,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 200),
          itemBuilder: (context, index) {
            return Column(
              children: [
                Image.asset(
                  categoryImage[index],
                  height: 120,
                  width: 200,
                  fit: BoxFit.cover,
                ),
                10.heightBox,
                categoryList[index].text.color(darkFontGrey).align(TextAlign.center).make(),
              ],
            ).box.rounded.clip(Clip.antiAlias).white.make().onTap((){
              controller.getSubCategories(categoryList[index]);
              Get.to(()=>CategoryDetails(title: categoryList[index]));
            });
          },
        ),
      ),
    ));
  }
}
