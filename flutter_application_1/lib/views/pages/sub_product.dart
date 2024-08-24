import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/views/controller/sub_product_controller.dart';
import 'package:flutter_application_1/views/widget/products_card_widget.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SubProduct extends GetWidget<SubProductController> {
  const SubProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 100,
        title: const Text(
          'Sub products',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 21,
            fontFamily: 'DM san',
            color: Color.fromRGBO(4, 11, 20, 1),
          ),
        ),
      ),
      body: Obx(() => controller.subProductModel.value == null ||
              controller.subProductModel.value?.data == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : controller.subProductModel.value?.data.products == null ||
                  controller.subProductModel.value?.data.products == null ||
                  controller.subProductModel.value?.data.products == [] ||
                  controller.subProductModel.value!.data.products.isEmpty ||
                  controller.subProductModel.value!.status != 200 ||
                  controller.subProductModel.value?.status == 400 ||
                  controller.subModel.value?.status == 400
              ? Center(child: Text('there are no product'))
              : SingleChildScrollView(
                  child: Column(
                  children: [
                    Divider(
                      color: Color.fromRGBO(225, 225, 225, 1),
                    ),
                    GridView.builder(
                      itemCount: controller
                          .subProductModel.value!.data.products.length,
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
                          image: controller.subProductModel.value!.data
                                          .products[index].image !=
                                      "" &&
                                  controller.subProductModel.value!.data
                                      .products[index].image.isNotEmpty &&
                                  controller.subProductModel.value!.data
                                          .products[index].image !=
                                      null
                              ? controller.subProductModel.value!.data
                                  .products[index].image
                              : 'https://static.vecteezy.com/system/resources/previews/004/141/669/original/no-photo-or-blank-image-icon-loading-images-or-missing-image-mark-image-not-available-or-image-coming-soon-sign-simple-nature-silhouette-in-frame-isolated-illustration-vector.jpg',
                          text1: controller.subProductModel.value!.data
                              .products[index].title,
                          text2: controller
                              .subProductModel.value!.data.products[index].body,
                          price: controller.subProductModel.value!.data
                              .products[index].price,
                          pressed: () {
                            String productId = controller.subProductModel.value!
                                .data.products[index].pid;
                            Get.find<CacheUtils>().setPid(productId);
                            print('this product card is pressed');

                            Get.toNamed('/product');
                          },
                        );
                      },
                    ),
                  ],
                ))),
    );
  }
}
