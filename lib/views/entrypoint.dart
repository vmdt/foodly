// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:foodly/constants/constants.dart';
import 'package:foodly/controllers/tab_index_controller.dart';
import 'package:foodly/views/cart/cart_page.dart';
import 'package:foodly/views/home/home_page.dart';
import 'package:foodly/views/profile/profile_page.dart';
import 'package:foodly/views/search/search_page.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});
  List<Widget> pageList = const [
    HomePage(),
    SearchPage(),
    CartPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TabIndexController());
    return Obx(() => Scaffold(
          body: Stack(
            children: [
              pageList[controller.tabIndex],
              Align(
                alignment: Alignment.bottomCenter,
                child: Theme(
                    data: Theme.of(context).copyWith(canvasColor: kPrimary),
                    child: BottomNavigationBar(
                      showSelectedLabels: false,
                      showUnselectedLabels: false,
                      unselectedIconTheme:
                          const IconThemeData(color: Colors.black38),
                      selectedIconTheme:
                          const IconThemeData(color: Colors.white),
                      onTap: (index) {
                        controller.setTabIndex = index;
                      },
                      currentIndex: controller.tabIndex,
                      items: const [
                        BottomNavigationBarItem(
                            icon: Icon(AntDesign.appstore1), label: 'Home'),
                        BottomNavigationBarItem(
                            icon: Icon(Icons.search), label: 'Search'),
                        BottomNavigationBarItem(
                          icon: Badge(
                            label: Text('1'),
                            child: Icon(Icons.shopping_cart),
                          ),
                          label: 'Cart',
                        ),
                        BottomNavigationBarItem(
                            icon: Icon(FontAwesome.user_circle_o),
                            label: 'Profile'),
                      ],
                    )),
              )
            ],
          ),
        ));
  }
}
