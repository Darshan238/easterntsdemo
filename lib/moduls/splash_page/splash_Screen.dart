import 'package:easterntsdemo/moduls/splash_page/splash_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashScreenController>(
      init: SplashScreenController(),
      builder: (_) => Container(color: Colors.white, child: FlutterLogo(size: MediaQuery.of(context).size.height)),
    );
  }
}
