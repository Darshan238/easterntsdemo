import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onReady() {
    checkLogin();
    super.onReady();
  }

  Future checkLogin() async {
    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        Get.offAllNamed("/BottomNavigationScreen");
      },
    );
  }
}
