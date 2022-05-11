import 'package:easterntsdemo/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'category_screen_controller.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({Key? key}) : super(key: key);
  var ctrl = Get.put(Controller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: const Text(
          'Category',
          style: TextStyle(color: Colors.grey),
        ),
        actions: const [
          Icon(
            Icons.search_rounded,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: 10,
          ),
          Icon(
            Icons.shopping_bag_outlined,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body:FutureBuilder<CategoryModel?>(
          future: ctrl.getCategory(),
          builder: (context, snapshot) {
            if(snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data!.categories![0].child!.length,
                itemBuilder: (context, index) {
                  return Stack(children: [
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.5,
                        height: ctrl.hei.value,
                        decoration: BoxDecoration(
                          // color: _controller.bgColor[index].withOpacity(0.9),
                          image: DecorationImage(
                            image: NetworkImage(
                                'https://placeimg.com/868/430/${snapshot.data!
                                    .categories![0].child![index]
                                    .categoryName}'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        // child: Image.network('https://placeimg.com/868/430/Pre-Wedding%20Shoot',fit: BoxFit.cover),
                      ),
                    ),
                    //   FutureBuilder<List<Color>>(
                    //       future:_controller.getImagePalette(
                    // 'https://placeimg.com/868/430/${snapshot.data!.categories[0].child![index].categoryName}'),
                    //       builder: (context, snap) {
                    //           return
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        width: MediaQuery
                            .of(context)
                            .size
                            .width * 0.6,
                        decoration: BoxDecoration(
                          color: ctrl.bgColor[index],
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.elliptical(60, 100),
                              bottomRight: Radius.elliptical(60, 100)),
                        ),
                        height: 100,
                        child: Center(
                            child: Text(
                            snapshot.data!.categories![0].child![index].categoryName.toString(),
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),


                    // }),
                  ]);
                },
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    /*  ListView.builder(
        itemCount: ctrl.dataList.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  child: Image(
                    image: NetworkImage(
                      ctrl.abc.bannerImage.toString(),
                    ),
                  ),
                  height: 100,
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(topRight: Radius.circular(60), bottomRight: Radius.circular(60)),
                      color: Colors.green,
                    ),
                    child: Center(child: Text(ctrl.dataList[index].child![index].categoryName.toString())),
                    width: 250,
                    height: 100,
                  ),
                ),
              ],
            ),
          );
        },
      ),*/
    );
  }
}
