import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import 'bottom_navigation_controller.dart';

class BottomNavigationScreen extends StatelessWidget {
  BottomNavigationScreen({Key? key}) : super(key: key);
  var ctrl = Get.put(BottomNavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<BottomNavigationController>(
        builder: (_) => ctrl.screen[ctrl.currentIndex],
      ),
      bottomNavigationBar: GetBuilder<BottomNavigationController>(
        builder: (_) => BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.black,
          showSelectedLabels: true,
          currentIndex: ctrl.currentIndex,
          onTap: (index) => ctrl.onNavigationTap(index),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 30,
              ),
              label: 'HOME',
              backgroundColor: Colors.white,
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.list_rounded,
                size: 30,
              ),
              label: 'CATEGORY',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.format_paint_outlined,
                size: 30,
              ),
              backgroundColor: Colors.red,
              label: 'CURATE',
            ),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.flash_on_outlined,
                  size: 30,
                ),
                label: 'SALE',
                backgroundColor: Colors.pink),
            BottomNavigationBarItem(
              icon: ClipOval(
                child: Icon(
                  Icons.more_horiz,
                  size: 30,
                ),
              ),
              label: 'MORE',
            ),
            // AssetImage('asset/images/post4.png',)
          ],
        ),
      ),
    );
  }
}
