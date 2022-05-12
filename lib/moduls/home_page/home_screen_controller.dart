import 'package:carousel_slider/carousel_controller.dart';
import 'package:dio/dio.dart';
import 'package:easterntsdemo/model/api1.dart';
import 'package:easterntsdemo/model/api2.dart';
import 'package:easterntsdemo/model/api3.dart';
import 'package:get/get.dart';

class Homecontroller extends GetxController {
  List<MainStickyMenu> aaa = [];
  RxInt current = 0.obs;
  final CarouselController controller = CarouselController();
  TopApi? abc;

  @override
  void onInit() {
    getData();
    getData().then((value) {
      abc = value;
      aaa = abc!.mainStickyMenu!;
    });
    update();
    super.onInit();
  }

  final client = Dio();

  Future<TopApi?> getData() async {
    const url = 'https://fabcurate.easternts.in/top.json';
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        return TopApi.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<MilladApi?> getmiddalData() async {
    const url = 'https://fabcurate.easternts.in/middle.json';
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        return MilladApi.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  Future<BottamApi?> getBottamData() async {
    const url = 'https://fabcurate.easternts.in/bottom.json';
    try {
      final response = await client.get(url);

      if (response.statusCode == 200) {
        return BottamApi.fromJson(response.data);
      } else {
        print('${response.statusCode} : ${response.data.toString()}');
      }
    } catch (error) {
      print(error);
    }
    return null;
  }

  onchangPage(index) {
    current = index;
    update();
  }
}
