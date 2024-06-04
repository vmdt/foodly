import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/controllers/category_controller.dart';
import 'package:foodly/views/home/widgets/category_widget.dart';
import 'package:get/get.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final categoryController = Get.put(CategoryController());

    return Container(
        height: 80.h,
        padding: EdgeInsets.only(left: 12.w, top: 10.h),
        child: Obx(
          () => ListView(
            scrollDirection: Axis.horizontal,
            children:
                List.generate(categoryController.categories.length, (index) {
              var category = categoryController.categories[index];
              return CategoryWidget(category: category);
            }),
          ),
        ));
  }
}
