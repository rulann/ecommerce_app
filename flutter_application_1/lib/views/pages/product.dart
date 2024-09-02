import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/actions/actions.dart';
import 'package:flutter_application_1/constant/app_color.dart';
import 'package:flutter_application_1/views/controller/cart_controller.dart';
import 'package:flutter_application_1/views/controller/product_details_controller.dart';
import 'package:get/get.dart';

class Item extends GetWidget<ProductDetailsController> {
  RxInt itemCount = 1.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Obx(() => controller.productModel.value != null
          ? SingleChildScrollView(
              child: SafeArea(
                  child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Color.fromRGBO(240, 240, 240, 1),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 20),
                      width: 375,
                      height: 300,
                      child: Row(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              margin: EdgeInsets.all(15),
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white,
                              ),
                              child: IconButton(
                                onPressed: () {
                                  Get.back();
                                },
                                color: Colors.black,
                                iconSize: 20,
                                icon: Icon(Icons.arrow_back_ios_new_rounded),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            child: Column(
                              children: [
                                Image(
                                  image: NetworkImage(
                                    controller.productModel.value!.data
                                        .products[0].image,
                                  ),
                                  height: 250,
                                  width: 200,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Text(
                          controller.productModel.value!.data.products[0].title,
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 20),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 34,
                              height: 34,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Color.fromRGBO(240, 240, 240, 1)),
                              child: IconButton(
                                onPressed: () {},
                                icon: Icon(
                                  Icons.favorite_border,
                                  size: 17,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 60,
                            ),
                            Row(
                              children: [
                                Text(
                                  '${controller.productModel.value!.data.products[0].basePrice}',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                    color: Colors.red,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 17,
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  controller.productModel.value!.data
                                      .products[0].calculatedPrice,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 25,
                                  ),
                                )
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          minWidth: 200,
                          height: 45,
                          color: Colors.black,
                          onPressed: () {
                            ContantActions.add(
                                controller
                                    .productModel.value!.data.products[0].vid,
                                itemCount.string);
                          },
                          child: Row(
                            children: [
                              Icon(
                                Icons.shopping_cart,
                                color: Colors.white,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'addC'.tr,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 15),
                              )
                            ],
                          ),
                        ),
                        GetBuilder<CartController>(
                          builder: (controller) => Row(
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color.fromRGBO(234, 234, 234, 1)),
                                ),
                                child: IconButton(
                                  onPressed: () {
                                    controller.dec(
                                        itemCount,
                                        controller.viewCartModel.value!.data
                                            .items[0].orderItemId,
                                        controller
                                            .viewCartModel.value!.data.orderId);
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                '${itemCount}',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Color.fromRGBO(234, 234, 234, 1)),
                                ),
                                child: IconButton(
                                    onPressed: () {
                                      controller.inc(
                                          itemCount,
                                          controller.viewCartModel.value!.data
                                              .items[0].orderItemId,
                                          controller.viewCartModel.value!.data
                                              .orderId);
                                    },
                                    icon: Icon(Icons.add)),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Divider(),
                    ),
                    Container(
                      width: 700,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(247, 247, 247, 1),
                      ),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Product details',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w700),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                            style: TextStyle(
                                color: Color.fromRGBO(78, 78, 78, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 20),
                      height: 40,
                      width: 300,
                      child: FilledButton.tonal(
                          onPressed: () {},
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  AppColor.ButtonsColor)),
                          child: Text(
                            'Add to cart   |   ${controller.productModel.value!.data.products[0].calculatedPrice}',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          )),
                    )
                  ],
                ),
              )),
            )
          : Center(
              child: CircularProgressIndicator(),
            )),
    );
  }
}
