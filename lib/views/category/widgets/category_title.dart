// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/views/category/category_page.dart';
import 'package:get/get.dart';

class CategoryTitle extends StatelessWidget {
  CategoryTitle({
    super.key,
    required this.category,
  });

  var category;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.to(
          () => const CategoryPage(),
          transition: Transition.fadeIn,
          duration: const Duration(milliseconds: 900),
        );
      },
      leading: CircleAvatar(
        backgroundColor: kGrayLight,
        radius: 25.r,
        child: Image.network(
          category.imageUrl,
          fit: BoxFit.contain,
        ),
      ),
      title: ReusableText(
        text: category.title,
        style: appStyle(
          12,
          kDark,
          FontWeight.normal,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: kGray,
        size: 25.h,
      ),
    );
  }
}
