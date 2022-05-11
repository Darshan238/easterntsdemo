import 'package:dio/dio.dart';
import 'package:easterntsdemo/model/api1.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class Homecontroller extends GetxController {
  List<MainStickyMenu> aaa = [];

  TopApi? getTopData;
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

  Future<TopApi?> getTopApi() async {
    getTopData = await getData();

    return getTopData;
  }

  final client = Dio();

  Future getData() async {
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
  }
}
