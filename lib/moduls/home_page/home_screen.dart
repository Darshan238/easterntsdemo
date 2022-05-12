// ignore_for_file: must_be_immutable

import 'package:carousel_slider/carousel_slider.dart';
import 'package:easterntsdemo/model/api1.dart';
import 'package:easterntsdemo/model/api2.dart';
import 'package:easterntsdemo/model/api3.dart';
import 'package:easterntsdemo/moduls/home_page/home_screen_controller.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        title: Image(
          image: const AssetImage('assets/images/logo.png'),
          height: 100.h,
        ),
        actions: [
          const Icon(
            Icons.search_rounded,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: 10.w,
          ),
          const Icon(
            Icons.shopping_bag_outlined,
            size: 30,
            color: Colors.black,
          ),
          SizedBox(
            width: 20.w,
          )
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 120.h,
              child: FutureBuilder<TopApi?>(
                  future: ctrl.getData(),
                  builder: (context, snapTop) {
                    if (snapTop.hasData && snapTop.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: snapTop.data!.mainStickyMenu!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            children: [
                              Card(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Center(),
                                    Image(
                                      image: NetworkImage(snapTop.data!.mainStickyMenu![index].image!),
                                      height: 80.h,
                                    ),
                                    Text(snapTop.data!.mainStickyMenu![index].title!),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
            FutureBuilder<TopApi?>(
                future: ctrl.getData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CarouselSlider(
                      items: snapshot.data!.offerCodeBanner!.map(
                        (i) {
                          return Stack(
                            children: [
                              Container(
                                height: 180.h,
                                margin: EdgeInsets.all(6.0.h.w),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.0),
                                  image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: NetworkImage(i.bannerImage!),

                                    // https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg
                                  ),
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.only(bottom: 10.h),
                                  child: Container(
                                    height: 50.h,
                                    width: 150.w,
                                    color: Colors.white,
                                    child: Center(
                                      child: Text(
                                        i.type!,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ).toList(),
                      options: CarouselOptions(
                        height: 180.0.h,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        // aspectRatio: 10 / 9,
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
            SizedBox(
              height: 20.h,
            ),
            FutureBuilder<TopApi?>(
              future: ctrl.getData(),
              builder: (context, sneptap) {
                if (sneptap.hasData && sneptap.connectionState == ConnectionState.done) {
                  return SizedBox(
                    height: 180.h,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: sneptap.data!.offerCodeBanner!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Image(
                          image: NetworkImage(sneptap.data!.offerCodeBanner![index].bannerImage!),
                          height: 160.h,
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return SizedBox(
                          width: 10.w,
                        );
                      },
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.all(8.0.h.w),
              child: const Text(
                'Shop By Category',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 440.h,
              child: FutureBuilder<MilladApi?>(
                  future: ctrl.getmiddalData(),
                  builder: (context, snap) {
                    if (snap.hasData && snap.connectionState == ConnectionState.done) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (snap.data!.category!.length / 2).round(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Card(
                                child: Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                        snap.data!.category![index].image!,
                                      ),
                                      fit: BoxFit.fill,
                                      height: MediaQuery.of(context).size.height * 0.21,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0.h.w),
                                      child: Text(
                                        snap.data!.category![index].name!,
                                        style: const TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                    )
                                  ],
                                ),
                                color: Colors.grey,
                              ),
                              Card(
                                child: Column(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                        snap.data!.category![index * 2].image!,
                                      ),
                                      fit: BoxFit.fill,
                                      height: MediaQuery.of(context).size.height * 0.21,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0.h.w),
                                      child: Text(snap.data!.category![index * 2].name!,
                                          style: const TextStyle(fontWeight: FontWeight.bold)),
                                    )
                                  ],
                                ),
                                color: Colors.grey,
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: const Text(
                'Shop By Fabric Material',
                style: TextStyle(fontSize: 20),
              ),
            ),
            FutureBuilder<BottamApi?>(
                future: ctrl.getBottamData(),
                builder: (context, snepsthotdata) {
                  if (snepsthotdata.hasData && snepsthotdata.connectionState == ConnectionState.done) {
                    return SizedBox(
                      height: 340.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (snepsthotdata.data!.rangeOfPattern!.length / 2).round(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0.h.w),
                                child: SizedBox(
                                  height: 150.h,
                                  width: 150.w,
                                  child: CircleAvatar(
                                    child: ClipOval(
                                      child: Image(
                                        height: 150.0.h,
                                        width: 250.0.w,
                                        image: NetworkImage(snepsthotdata.data!.rangeOfPattern![index].image!),
                                        fit: BoxFit.cover,
                                      ),

                                      // child:
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0.h.w),
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: CircleAvatar(
                                    child: ClipOval(
                                      child: Image(
                                        height: 150.0.h,
                                        width: 250.0.w,
                                        image: NetworkImage(snepsthotdata.data!.rangeOfPattern![index * 2].image!),
                                        fit: BoxFit.cover,
                                      ),
                                      // child:
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: const Text(
                'Shop by Design patterns',
                style: TextStyle(fontSize: 20),
              ),
            ),
            SizedBox(
              height: 420.h,
              child: FutureBuilder<MilladApi?>(
                  future: ctrl.getmiddalData(),
                  builder: (context, snap) {
                    if (snap.hasData && snap.connectionState == ConnectionState.done) {
                      return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: (snap.data!.category!.length / 2).round(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Container(
                                height: 200.h,
                                width: 150.w,
                                child: Stack(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                        snap.data!.category![index].image!,
                                      ),
                                      fit: BoxFit.fill,
                                      height: 200.h,
                                    ),
                                    Text(
                                      snap.data!.category![index].name!,
                                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Container(
                                height: 200.h,
                                width: 150.w,
                                child: Stack(
                                  children: [
                                    Image(
                                      image: NetworkImage(
                                        snap.data!.category![index * 2].image!,
                                      ),
                                      fit: BoxFit.fill,
                                      height: 200.h,
                                    ),
                                    Text(
                                      snap.data!.category![index * 2].name!,
                                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                                color: Colors.grey,
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return SizedBox(
                            width: 10.w,
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
            ),
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: const Text(
                'Unstitched',
                style: TextStyle(fontSize: 20),
              ),
            ),
            FutureBuilder<MilladApi?>(
                future: ctrl.getmiddalData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final CarouselController _controller = CarouselController();
                    return CarouselSlider(
                      carouselController: _controller,
                      items: snapshot.data!.unstitched!.map((i) {
                        return Stack(
                          children: [
                            Container(
                              height: 500.h,
                              width: double.infinity,
                              // margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: NetworkImage(i.image!),

                                  // https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 10.h.w),
                                child: Container(
                                  color: Colors.black54,
                                  height: 50.h,
                                  child: Center(
                                    child: Text(
                                      i.name!,
                                      style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      }).toList(),
                      options: CarouselOptions(
                        height: 500.h,
                        viewportFraction: 0.6,
                        enlargeCenterPage: true,
                        autoPlay: true,
                        aspectRatio: 2.0,
                        // onPageChanged: ctrl.onchangPage(index),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enableInfiniteScroll: true,
                        autoPlayAnimationDuration: const Duration(milliseconds: 800),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: const Text(
                'Boutique collection',
                style: TextStyle(fontSize: 20),
              ),
            ),
            FutureBuilder<MilladApi?>(
                future: ctrl.getmiddalData(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    final CarouselController _controller = CarouselController();
                    return SizedBox(
                      height: 480.h,
                      child: CarouselSlider(
                        carouselController: _controller,
                        items: snapshot.data!.boutiqueCollection!.map((i) {
                          return SizedBox(
                            height: 500.h,
                            child: Column(
                              children: [
                                Container(
                                  height: 400.h,
                                  width: double.infinity,
                                  // margin: const EdgeInsets.all(6.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(i.bannerImage!),

                                      // https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg
                                    ),
                                  ),
                                ),
                                Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: snapshot.data!.boutiqueCollection!.asMap().entries.map((i) {
                                      return GestureDetector(
                                        onTap: () => ctrl.controller.animateToPage(i.key),
                                        child: Container(
                                          width: 12.0.w,
                                          height: 12.0.h,
                                          margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color:
                                                  (Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black)
                                                      .withOpacity(ctrl.current.value == i.key ? 0.9 : 0.4)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                        options: CarouselOptions(
                          height: 500.h,
                          viewportFraction: 1.0,
                          enlargeCenterPage: true,
                          // enlargeCenterPage: true,
                          autoPlay: true,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            ctrl.current.value = index;
                          },

                          // autoPlayCurve: Curves.fastOutSlowIn,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                        ),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: const Text(
                'Print Your Own Design',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: 250.h,
                  width: double.infinity,
                  child: const Image(
                    image: NetworkImage('https://placeimg.com/470/710/fabric'),
                    fit: BoxFit.fill,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.h.w),
                    child: Container(
                      padding: EdgeInsets.only(top: 5.h, left: 2.w, right: 2.w),
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.redAccent),
                      ),
                      child: const Text('+ Upload Your Desing'),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: const Text(
                'Range of pattern',
                style: TextStyle(fontSize: 20),
              ),
            ),
            FutureBuilder<BottamApi?>(
                future: ctrl.getBottamData(),
                builder: (context, snepsthotdata) {
                  if (snepsthotdata.hasData && snepsthotdata.connectionState == ConnectionState.done) {
                    return SizedBox(
                      height: 340.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: (snepsthotdata.data!.rangeOfPattern!.length / 2).round(),
                        itemBuilder: (BuildContext context, int index) {
                          return Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0.h.w),
                                child: SizedBox(
                                  height: 150.h,
                                  width: 150.w,
                                  child: CircleAvatar(
                                    child: ClipOval(
                                      child: Stack(
                                        children: [
                                          Image(
                                            height: 150.0.h,
                                            width: 250.0.w,
                                            image: NetworkImage(snepsthotdata.data!.rangeOfPattern![index].image!),
                                            fit: BoxFit.cover,
                                          ),
                                          Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Padding(
                                                padding: EdgeInsets.only(bottom: 8.0.h.w),
                                                child: Text(
                                                  snepsthotdata.data!.rangeOfPattern![index].name!,
                                                  overflow: TextOverflow.fade,
                                                  maxLines: 1,
                                                  softWrap: false,
                                                ),
                                              ))
                                        ],
                                      ),

                                      // child:
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0.h.w),
                                child: SizedBox(
                                  height: 150.h,
                                  width: 150.w,
                                  child: CircleAvatar(
                                    child: ClipOval(
                                      child: Stack(
                                        children: [
                                          Image(
                                            height: 150.0.h,
                                            width: 250.0.w,
                                            image: NetworkImage(snepsthotdata.data!.rangeOfPattern![index * 2].image!),
                                            fit: BoxFit.cover,
                                          ),
                                          Align(
                                            alignment: Alignment.bottomCenter,
                                            child: Text(
                                              snepsthotdata.data!.rangeOfPattern![index].name!,
                                              overflow: TextOverflow.fade,
                                              maxLines: 1,
                                              softWrap: false,
                                            ),
                                          )
                                        ],
                                      ),
                                      // child:
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
            Padding(
              padding: EdgeInsets.all(10.h.w),
              child: const Text(
                'Design As Per Occasion',
                style: TextStyle(fontSize: 20),
              ),
            ),
            FutureBuilder<BottamApi?>(
              future: ctrl.getBottamData(),
              builder: (context, snepdataoccasion) {
                if (snepdataoccasion.hasData && snepdataoccasion.connectionState == ConnectionState.done) {
                  /*   var size = MediaQuery.of(context).size;
                  final double itemHeight = (size.height - kToolbarHeight - 24) / 2;
                  final double itemWidth = size.width / 2;*/
                  return SizedBox(
                    height: 300.h,
                    child: GridView.count(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                      children: [
                        for (var i = 0; i < snepdataoccasion.data!.designOccasion!.length; i++)
                          Builder(
                            builder: (context) => Padding(
                              padding: const EdgeInsets.all(2.0),
                              child: SizedBox(
                                height: 300.h,
                                child: Stack(
                                  children: [
                                    Image(
                                      image: NetworkImage(snepdataoccasion.data!.designOccasion![i].image!),
                                      fit: BoxFit.fill,
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Container(
                                        height: 35.h,
                                        width: 150.w,
                                        color: Colors.white70,
                                        child: Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                snepdataoccasion.data!.designOccasion![i].name!,
                                                overflow: TextOverflow.fade,
                                                maxLines: 1,
                                                softWrap: false,
                                                style: const TextStyle(fontWeight: FontWeight.bold),
                                              ),
                                              Row(
                                                children: [
                                                  Text(snepdataoccasion.data!.designOccasion![i].subName!,
                                                      style: const TextStyle(fontWeight: FontWeight.bold)),
                                                  const Spacer(),
                                                  Text(snepdataoccasion.data!.designOccasion![i].cta!,
                                                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 10)),
                                                ],
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
