// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/category_controller.dart';
import 'package:foodly/views/category/all_categories.dart';
import 'package:get/get.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({
    super.key,
    required this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    var controller = Get.put((CategoryController()));
    return GestureDetector(
        onTap: () {
          if (controller.categoryValue == category.id) {
            controller.updateCategory = '';
            controller.updateTitle = '';
          } else if (category.value == 'more') {
            controller.getAllCategories();
            Get.to(
              () => AllCategories(),
              transition: Transition.fade,
              duration: const Duration(milliseconds: 900),
            );
          } else {
            controller.updateCategory = category.id;
            controller.updateTitle = category.title;
          }
        },
        child: Obx(
          () => Container(
            margin: EdgeInsets.only(right: 5.w),
            padding: EdgeInsets.only(top: 3.h),
            width: width * 0.19,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    color: controller.categoryValue == category.id
                        ? kSecondary
                        : kOffWhite,
                    width: 1.w)),
            child: Column(
              children: [
                SizedBox(
                  height: 35.h,
                  child: Image.network(category.imageUrl, fit: BoxFit.contain),
                ),
                ReusableText(
                    text: category.title,
                    style: appStyle(12, kDark, FontWeight.normal))
              ],
            ),
          ),
        ));
  }
}
