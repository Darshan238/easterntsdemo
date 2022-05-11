/*
import 'package:dio/dio.dart';
import 'package:easterntsdemo/model/category.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class CategoryController extends GetxController {
  List<Categories> dataList = [];
  late CategoryModel abc;


  @override
  void onInit() {
    getData().then((value) {
      abc = value;
      dataList=abc.categories!;
      update();
    });
    super.onInit();
  }

  final client = Dio();

  Future getData() async {
    const url = "https://fabcurate.easternts.in/category.json";
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        return CategoryModel.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      }
    } catch (error) {
      print(error);
    }
  }
}
*/

import 'package:dio/dio.dart';
import 'package:easterntsdemo/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:palette_generator/palette_generator.dart';



class Controller extends GetxController{
  List<Color> bgColor = [];
  RxDouble hei = 100.0.obs;
  CategoryModel? getCategoryData;

  Future<CategoryModel?> getCategory() async {
    getCategoryData = await getData();

    for(var i=0;i<getCategoryData!.categories![0].child!.length;i++){
      final paletteGenerator = await PaletteGenerator.fromImageProvider(NetworkImage('https://placeimg.com/868/430/${getCategoryData!.categories![0].child![i].categoryName}'));
      bgColor.add(paletteGenerator.dominantColor!.color);
    }

    for(var i=0;i<getCategoryData!.categories![0].child!.length;i++){
      print('hhhh ${bgColor[i].value}');

    }
    return getCategoryData;
  }
  final client = Dio();

  Future getData() async {
    const url = "https://fabcurate.easternts.in/category.json";
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        return CategoryModel.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      }
    } catch (error) {
      print(error);
    }
  }

// @override
// void onInit() {
//  // TODO: implement onInit
// getImagePalette();
//   super.onInit();
// }
}
