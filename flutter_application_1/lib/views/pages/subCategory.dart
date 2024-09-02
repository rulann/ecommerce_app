import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/constant/actions/actions.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/data/http_repo.dart';
import 'package:flutter_application_1/views/controller/cart_controller.dart';
import 'package:flutter_application_1/views/controller/sub_category_controller.dart';
import 'package:flutter_application_1/views/controller/sub_product_controller.dart';
import 'package:flutter_application_1/views/widget/products_card_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SubCategory extends GetWidget<SubCategoryController> {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 100,
          title: Text(
            'subC'.tr,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 21,
              fontFamily: 'DM san',
              color: Color.fromRGBO(4, 11, 20, 1),
            ),
          ),
        ),
        body: Obx(() => controller.subModel.value == null
            ? Center(child: CircularProgressIndicator())
            : controller.subModel.value?.data == null &&
                    controller.subModel.value?.data.categoryChilds == null
                ? Center(child: Text('noProducts'.tr))
                : SingleChildScrollView(
                    child: Column(
                      children: [
                        Divider(
                          color: Color.fromRGBO(225, 225, 225, 1),
                        ),
                        Container(
                          margin: EdgeInsets.only(bottom: 20),
                          child: GridView.count(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 10,
                            crossAxisCount: 3,
                            children: List.generate(
                              controller
                                  .subModel.value!.data.categoryChilds.length,
                              (index) {
                                final product = controller
                                    .subModel.value!.data.categoryChilds[index];
                                final imageUrl = product.image;
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: GestureDetector(
                                        onTap: () {
                                          Get.find<CacheUtils>().setSubCategory(
                                              controller.subModel.value!.data
                                                  .categoryChilds[index].id);
                                          Get.lazyPut(() =>
                                              SubProductController(
                                                httpRepo: Get.find<HttpRepo>(),
                                                cacheUtils:
                                                    Get.find<CacheUtils>(),
                                              ));
                                          Get.toNamed('/subProducts');
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              border: Border.all(
                                                color: const Color.fromRGBO(
                                                    190, 190, 190, 1),
                                              )),
                                          child: ClipOval(
                                            child: Image(
                                              image: NetworkImage(
                                                imageUrl != "" &&
                                                        imageUrl.isNotEmpty &&
                                                        imageUrl != null
                                                    ? imageUrl
                                                    : 'https://static.vecteezy.com/system/resources/previews/004/141/669/original/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Text(
                                      product.title,
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 11,
                                          fontFamily: 'DM san'),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Text(
                          'products'.tr,
                          style: TextStyle(
                              fontFamily: 'DM san',
                              fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        Obx(() => controller.subModel.value?.data == null
                            ? Center(child: CircularProgressIndicator())
                            : controller.subProductModel.value?.data.products ==
                                    null
                                ? Center(child: Text('noProducts'.tr))
                                : SingleChildScrollView(
                                    child: Column(
                                    children: [
                                      const Divider(
                                        color: Color.fromRGBO(225, 225, 225, 1),
                                      ),
                                      GridView.builder(
                                        itemCount: controller.subModel.value!
                                            .data.products.length,
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent: 200,
                                                childAspectRatio: 3.7 / 6,
                                                crossAxisSpacing: 10,
                                                mainAxisSpacing: 10),
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          final product = controller.subModel
                                              .value!.data.products[index];
                                          final imageUrl = product.image;

                                          return ProductCard(
                                            image: imageUrl != "" &&
                                                    imageUrl.isNotEmpty &&
                                                    imageUrl != null
                                                ? imageUrl
                                                : 'https://static.vecteezy.com/system/resources/previews/004/141/669/original/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                                            text1: product.title,
                                            text2: product.body,
                                            price: product.price,
                                            pressed: () {
                                              String productId = product.pid;
                                              Get.find<CacheUtils>()
                                                  .setPid(productId);
                                              print(
                                                  'this product card is pressed');

                                              Get.toNamed('/product');
                                            },
                                            add: () {
                                              String vid = controller
                                                  .subProductModel
                                                  .value!
                                                  .data
                                                  .products[index]
                                                  .vid;

                                              ContantActions.add(vid, '1');
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ))),
                      ],
                    ),
                  )));
  }
}
