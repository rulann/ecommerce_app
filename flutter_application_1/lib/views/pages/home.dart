import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/actions/actions.dart';
import 'package:flutter_application_1/constant/app_color.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/views/controller/home_controller.dart';
import 'package:flutter_application_1/views/widget/products_card_widget.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:restart_app/restart_app.dart';

class Home extends GetWidget<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(21, 21, 21, 1),
          leading: IconButton(
              onPressed: () {
                Get.toNamed('/acc');
              },
              icon: Icon(
                Icons.menu,
                color: Colors.white,
              )),
          actions: [
            IconButton(
                onPressed: () {
                  Get.defaultDialog(
                      confirm: MaterialButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Home()));
                        },
                        child: Text(
                          'OK',
                          style: TextStyle(color: Colors.white),
                        ),
                        color: Colors.black,
                      ),
                      title: 'app language',
                      content: Column(
                        children: [
                          RadioListTile(
                            value: 1,
                            groupValue: controller.selectedLang.value,
                            onChanged: (val) {
                              controller.changeLanguage(val as int);
                              Get.find<CacheUtils>().setLang('en');
                              Get.updateLocale(Locale('en'));
                            },
                            title: Text('English'),
                          ),
                          RadioListTile(
                            value: 2,
                            groupValue: controller.selectedLang.value,
                            onChanged: (val) {
                              controller.changeLanguage(val as int);
                              Get.find<CacheUtils>().setLang('ar');
                              Get.updateLocale(Locale('ar'));
                            },
                            title: Text('Arabic'),
                          )
                        ],
                      ));
                },
                icon: Icon(
                  Icons.language,
                  color: Colors.white,
                )),
            IconButton(
                onPressed: () {
                  Get.toNamed('/cart');
                },
                icon: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                )),
          ],
        ),
        body: Obx(() => controller.shopByModel.value != null &&
                controller.bestDealsModel.value != null &&
                controller.sliderModel.value != null
            ? SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 120,
                        child: Stack(
                          children: [
                            (Obx(() => CarouselSlider(
                                  items: controller.sliderModel.value!.data
                                      .map((i) {
                                    return Container(
                                      child: Image(
                                        width: double.infinity,
                                        fit: BoxFit.fitWidth,
                                        image: NetworkImage(i.image),
                                      ),
                                    );
                                  }).toList(),
                                  options: CarouselOptions(
                                    height: 120,
                                    autoPlay: true,
                                    viewportFraction: 1,
                                    onPageChanged: (i, reason) {
                                      controller.updateSliderIndex(i);
                                    },
                                  ),
                                ))),
                            Positioned(
                              bottom: 10,
                              left: 150,
                              child: SmoothPageIndicator(
                                controller: PageController(
                                    initialPage: controller.currentIndex.value),
                                count:
                                    controller.sliderModel.value!.data.length,
                                effect: ExpandingDotsEffect(
                                  dotHeight: 2.5,
                                  dotWidth: 20,
                                  activeDotColor: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      ),
                      Text(
                        'ShopBy'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: 'DM san'),
                      ),
                      Obx(() => Container(
                            margin: EdgeInsets.only(bottom: 30),
                            padding: EdgeInsets.all(10),
                            child: GridView.count(
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10,
                              crossAxisCount: 3,
                              children: List.generate(
                                12,
                                (index) {
                                  return Column(
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 4),
                                        child: SizedBox(
                                          height: 100,
                                          width: 100,
                                          child: GestureDetector(
                                            onTap: () {
                                              Get.find<CacheUtils>()
                                                  .setCategory(controller
                                                      .shopByModel
                                                      .value!
                                                      .data[index]
                                                      .id);

                                              Get.toNamed('/subCategory');
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Color.fromRGBO(
                                                        190, 190, 190, 1),
                                                  )),
                                              child: ClipOval(
                                                child: Image(
                                                  image: NetworkImage(
                                                    controller
                                                        .shopByModel
                                                        .value!
                                                        .data[index]
                                                        .image,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        controller.shopByModel.value!
                                            .data[index].title,
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 11,
                                            fontFamily: 'DM san'),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          )),
                      Text(
                        'deals'.tr,
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                            fontFamily: 'DM san'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          child: Obx(() => GridView.builder(
                                itemCount: controller
                                    .bestDealsModel.value!.data.products.length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent: 200,
                                        childAspectRatio: 3.7 / 6,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemBuilder: (BuildContext context, int index) {
                                  return ProductCard(
                                    image: controller.bestDealsModel.value!.data
                                        .products[index].image,
                                    text1: controller.bestDealsModel.value!.data
                                        .products[index].title,
                                    text2: controller.bestDealsModel.value!.data
                                        .products[index].body,
                                    price: controller.bestDealsModel.value!.data
                                        .products[index].price,
                                    pressed: () {
                                      String productId = controller
                                          .bestDealsModel
                                          .value!
                                          .data
                                          .products[index]
                                          .pid;
                                      Get.find<CacheUtils>().setPid(productId);

                                      print('this product card is pressed');

                                      Get.toNamed('/product');
                                    },
                                    add: () {
                                      String vid = controller.bestDealsModel
                                          .value!.data.products[index].vid;

                                      ContantActions.add(vid, '1');
                                      // print(
                                      //     'uid: ${Get.find<CacheUtils>().getUid()}');
                                      // print(
                                      //     'token: ${Get.find<CacheUtils>().getToken()}');
                                      // print(
                                      //     'vid: ${controller.bestDealsModel.value!.data.products[index].vid}');
                                    },
                                  );
                                },
                              )),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: MaterialButton(
                          color: AppColor.ButtonsColor,
                          child: Text(
                            'viewAll'.tr,
                            style: TextStyle(color: Colors.white),
                          ),
                          onPressed: () {
                            controller.viewAll();
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              )));
  }
}
