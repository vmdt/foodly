import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/views/home/widgets/food_widget.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      padding: EdgeInsets.only(top: 10.h, left: 12.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods.length, (index) {
          var food = foods[index];
          return FoodWidget(
            image: food['imageUrl'],
            title: food['title'],
            time: food['time'],
            price: food['price'].toString(),
          );
        }),
      ),
    );
  }
}
