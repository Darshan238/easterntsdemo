import 'package:carousel_slider/carousel_slider.dart';
import 'package:easterntsdemo/model/api1.dart';
import 'package:easterntsdemo/moduls/home_page/home_screen_controller.dart';
import 'package:easterntsdemo/moduls/sale_page/sale_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../category_page/category_screen_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var ctrl = Get.put(Homecontroller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Image(
          image: AssetImage('assets/images/logo.png'),
          height: 100,
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
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Row(
                    children: [
                      Card(
                        child: Column(
                          children: [
                            Image(
                              image: NetworkImage(ctrl.abc!.offerCodeBanner![index].bannerImage.toString()),
                              height: 80,
                            ),
                            const Text('fabrics'),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            FutureBuilder<TopApi?>(
                future: ctrl.getTopApi(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CarouselSlider(
                      items: snapshot.data!.mainStickyMenu![0].sliderImages!.map((e) {
                        return Container(
                          margin: const EdgeInsets.all(6.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            image: DecorationImage(
                              image: NetworkImage(e.image!),
                              // https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg
                            ),
                          ),
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 180.0,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 16 / 9,
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        viewportFraction: 0.8,
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            const SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/302743/pexels-photo-302743.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    height: 160,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/302743/pexels-photo-302743.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    height: 160,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Shop By Category',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 202,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ctrl.aaa.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Card(
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    ctrl.abc!.mainStickyMenu![index].image.toString(),
                                  ),
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: MediaQuery.of(context).size.height * 0.21,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Banarasi'),
                                )
                              ],
                            ),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 202,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ctrl.aaa.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          Card(
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    ctrl.abc!.mainStickyMenu![index].sliderImages![index].image.toString(),
                                  ),
                                  fit: BoxFit.fill,
                                  width: MediaQuery.of(context).size.width * 0.3,
                                  height: MediaQuery.of(context).size.height * 0.21,
                                ),
                                const Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text('Banarasi'),
                                )
                              ],
                            ),
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ],
                  );
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Shop By Fabric Material',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ctrl.aaa.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 150,
                    height: 250.0,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          height: 150.0,
                          width: 250.0,
                          image: NetworkImage(ctrl.abc!.offerCodeBanner![index].bannerImage.toString()),
                          fit: BoxFit.cover,
                        ),
                        // child:
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: ctrl.aaa.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 150,
                    height: 250.0,
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          height: 150.0,
                          width: 250.0,
                          image: NetworkImage(ctrl.abc!.mainStickyMenu![index].image.toString()),
                          fit: BoxFit.cover,
                        ),
                        // child:
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
