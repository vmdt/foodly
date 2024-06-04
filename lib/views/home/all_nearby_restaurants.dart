import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/back_ground_container.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/constants/uidata.dart';
import 'package:foodly/views/home/widgets/restaurant_title.dart';

class AllNearbyRestaurants extends StatelessWidget {
  const AllNearbyRestaurants({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: ReusableText(
            text: 'Nearby Restaurants',
            style: appStyle(15, kDark, FontWeight.w600),
          ),
        ),
        body: BackGroundContainer(
            color: kOffWhite,
            child: ListView(
              padding: EdgeInsets.all(12.w),
              children: List.generate(restaurants.length, (index) {
                var restaurant = restaurants[index];
                return RestaurantTitle(restaurant: restaurant);
              }),
            )));
  }
}
