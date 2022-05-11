import 'package:easterntsdemo/moduls/bottom_bar/bottom_navigation_screen.dart';
import 'package:easterntsdemo/moduls/category_page/category_screen.dart';
import 'package:easterntsdemo/moduls/curate_page/curate_screen.dart';
import 'package:easterntsdemo/moduls/home_page/home_screen.dart';
import 'package:easterntsdemo/moduls/more_page/more_screen.dart';
import 'package:easterntsdemo/moduls/sale_page/sale_screen.dart';
import 'package:flutter/cupertino.dart';

import 'package:get/get.dart';

import 'moduls/splash_page/splash_Screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: Themes.light,
      color: context.theme.backgroundColor,
      // darkTheme:Themes .dark,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: '/HomeScreen', page: () => HomeScreen()),
        GetPage(name: '/CategoryScreen', page: () => CategoryScreen()),
        GetPage(name: '/CurateScreen', page: () => CurateScreen()),
        GetPage(name: '/SaleScreen', page: () => SaleScreen()),
        GetPage(name: '/MoreScreen', page: () => MoreScreen()),
        GetPage(name: '/BottomNavigationScreen', page: () => BottomNavigationScreen()),
      ],
      home: const SplashScreen(),
    );
  }
}
