import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_color.dart';
import 'package:flutter_application_1/views/controller/cart_controller.dart';
import 'package:flutter_application_1/views/widget/cart_item_widget.dart';
import 'package:get/get.dart';
import 'package:styled_divider/styled_divider.dart';

class Cart extends GetWidget<CartController> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          titleSpacing: 100,
          title: Text(
            'cart'.tr,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 21,
              fontFamily: 'DM san',
              color: Color.fromRGBO(4, 11, 20, 1),
            ),
          ),
        ),
        body: Obx(() => controller.viewCartModel.value?.data.items == null
            ? Center(child: Text('noProducts'.tr))
            : SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(13),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount:
                            controller.viewCartModel.value?.data.items.length ??
                                0,
                        itemBuilder: (BuildContext context, int index) {
                          return Product(
                            text: controller
                                .viewCartModel.value!.data.items[index].title,
                            img: controller
                                .viewCartModel.value!.data.items[index].image,
                            price: controller.viewCartModel.value!.data
                                .items[index].totalUnitPrice,
                            count: (RxInt(controller.viewCartModel.value!.data
                                .items[index].quantity)),
                            itemID: controller.viewCartModel.value!.data
                                .items[index].orderItemId,
                            orderID:
                                controller.viewCartModel.value!.data.orderId,
                          );
                        },
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              vertical: 10, horizontal: 20),
                          child: Column(
                            children: [
                              Divider(),
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 20,
                                  ),
                                  child: Text(
                                    'Coupon Code',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        fontFamily: 'DM san'),
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10, bottom: 10),
                                    width: 205,
                                    height: 50,
                                    child: const TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    width: 129,
                                    height: 50,
                                    child: FilledButton(
                                      style: FilledButton.styleFrom(
                                          backgroundColor:
                                              Color.fromRGBO(58, 88, 168, 1),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(6),
                                          )),
                                      onPressed: () {},
                                      child: const Text(
                                        'Apply Coupon',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w800,
                                            fontFamily: 'DM san'),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'subtotal'.tr,
                                    style: TextStyle(
                                        fontFamily: 'DM san',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(112, 123, 129, 1)),
                                  ),
                                  Text(
                                    '\$ ${controller.viewCartModel.value!.data.totalOrderPriceAfter}',
                                    style: const TextStyle(
                                      fontFamily: 'DM san',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    controller.viewCartModel.value!.data.fees[0]
                                        .label,
                                    style: const TextStyle(
                                        fontFamily: 'DM san',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color:
                                            Color.fromARGB(112, 123, 129, 1)),
                                  ),
                                  Text(
                                    ' \$ ${controller.viewCartModel.value!.data.fees[0].amount}',
                                    style: const TextStyle(
                                      fontFamily: 'DM san',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              const StyledDivider(
                                lineStyle: DividerLineStyle.dashed,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'total'.tr,
                                    style: TextStyle(
                                      fontFamily: 'DM san',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '\$ ${controller.viewCartModel.value!.data.totalOrderPrice}',
                                    style: TextStyle(
                                      fontFamily: 'DM san',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  )
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(vertical: 20),
                                height: 40,
                                width: 300,
                                child: FilledButton.tonal(
                                    onPressed: () {},
                                    style: ButtonStyle(
                                        backgroundColor:
                                            MaterialStateProperty.all<Color>(
                                                AppColor.ButtonsColor)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'buy'.tr,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          '|',
                                          style: const TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700,
                                              color: Colors.white),
                                        ),
                                        Text(
                                          'JOD ${controller.viewCartModel.value!.data.totalOrderPrice}',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        )
                                      ],
                                    )),
                              )
                            ],
                          )),
                    )
                  ],
                ),
              )));
  }
}
