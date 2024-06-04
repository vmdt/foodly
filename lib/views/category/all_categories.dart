import 'package:flutter/material.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/back_ground_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/category_controller.dart';
import 'package:get/get.dart';

import 'widgets/category_title.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      appBar: AppBar(
        title: ReusableText(
          text: 'All Categories',
          style: appStyle(15, kGray, FontWeight.w600),
        ),
      ),
      body: BackGroundContainer(
          color: kOffWhite,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Obx(() => ListView(
                  scrollDirection: Axis.vertical,
                  children: List.generate(
                      categoryController.allCategories.length, (index) {
                    var category = categoryController.allCategories[index];
                    return CategoryTitle(category: category);
                  }),
                )),
          )),
    );
  }
}
