import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodly/common/app_style.dart';
import 'package:foodly/common/reusable_text.dart';
import 'package:foodly/constants/constants.dart';

class RestaurantTitle extends StatelessWidget {
  const RestaurantTitle({super.key, this.restaurant});

  final dynamic restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 12.h),
            height: 100.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: kOffWhite, borderRadius: BorderRadius.circular(9.r)),
            child: Container(
              padding: EdgeInsets.all(4.w),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12.r),
                    child: Stack(
                      children: [
                        SizedBox(
                          width: 70.w,
                          height: 70.w,
                          child: Image.network(restaurant['imageUrl'],
                              fit: BoxFit.fill),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            padding: EdgeInsets.only(left: 3.w, bottom: 3.h),
                            color: kGray.withOpacity(0.5),
                            height: 20.h,
                            width: 70.w,
                            child: RatingBarIndicator(
                              rating: 5,
                              itemBuilder: (context, index) => const Icon(
                                Icons.star,
                                color: kPrimary,
                              ),
                              itemSize: 20.h,
                              itemCount: 5,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                          text: restaurant['title'],
                          style: appStyle(11, kDark, FontWeight.w400)),
                      ReusableText(
                          text: 'Delivery time: ${restaurant['time']}',
                          style: appStyle(11, kDark, FontWeight.w400)),
                      SizedBox(
                        width: width * 0.7,
                        child: Text(
                          restaurant['coords']['address'],
                          overflow: TextOverflow.ellipsis,
                          style: appStyle(9, kGray, FontWeight.w400),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: 10.w,
            top: 10.h,
            child: Container(
              height: 20.h,
              width: 50.w,
              decoration: BoxDecoration(
                color: restaurant['isAvailable'] == true ||
                        restaurant['isAvailable'] == null
                    ? kPrimary
                    : kSecondaryLight,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Center(
                child: ReusableText(
                  text: restaurant['isAvailable'] == true ||
                          restaurant['isAvailable'] == null
                      ? "Open"
                      : "Closed",
                  style: appStyle(12, kLightWhite, FontWeight.w600),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
