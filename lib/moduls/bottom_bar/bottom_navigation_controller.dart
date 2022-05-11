import 'package:easterntsdemo/moduls/category_page/category_screen.dart';
import 'package:easterntsdemo/moduls/curate_page/curate_screen.dart';
import 'package:easterntsdemo/moduls/home_page/home_screen.dart';
import 'package:easterntsdemo/moduls/more_page/more_screen.dart';
import 'package:easterntsdemo/moduls/sale_page/sale_screen.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class BottomNavigationController extends GetxController {
  int currentIndex = 0;
  final screen = [
    HomeScreen(),
    CategoryScreen(),
    CurateScreen(),
    SaleScreen(),
    MoreScreen(),
  ];

  onNavigationTap(index) {
    currentIndex = index;
    update();
  }
}
