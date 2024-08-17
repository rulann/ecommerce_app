import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_color.dart';
import 'package:flutter_application_1/views/controller/cart_controller.dart';
import 'package:flutter_application_1/views/widget/cart_item_widget.dart';
import 'package:get/get.dart';
import 'package:styled_divider/styled_divider.dart';

class Cart extends StatelessWidget {
  final CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 100,
        title: const Text(
          'My Cart',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 21,
            fontFamily: 'DM san',
            color: Color.fromRGBO(4, 11, 20, 1),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(13),
              child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    Product(
                        text: 'ايبوكسي لاصق معدن bison epoxy metal 24ml',
                        img: 'assets/images/product11.png',
                        price: 'JOD 10.0',
                        count: 1.obs),
                    Product(
                        text: 'ايبوكسي لاصق معدن bison epoxy metal 24ml',
                        img: 'assets/images/product11.png',
                        price: 'JOD 10.0',
                        count: 1.obs),
                    Product(
                        text: 'ايبوكسي لاصق معدن bison epoxy metal 24ml',
                        img: 'assets/images/product11.png',
                        price: 'JOD 10.0',
                        count: 1.obs),
                  ]),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                  child: Column(
                    children: [
                      Divider(),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(
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
                            margin: const EdgeInsets.only(top: 10, bottom: 10),
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
                                    borderRadius: BorderRadius.circular(6),
                                  )),
                              onPressed: () {},
                              child: Text(
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
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Subtotal',
                            style: TextStyle(
                                fontFamily: 'DM san',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(112, 123, 129, 1)),
                          ),
                          Text(
                            '\$24.99',
                            style: TextStyle(
                              fontFamily: 'DM san',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Shipping',
                            style: TextStyle(
                                fontFamily: 'DM san',
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(112, 123, 129, 1)),
                          ),
                          Text(
                            '\$4.99',
                            style: TextStyle(
                              fontFamily: 'DM san',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ],
                      ),
                      StyledDivider(
                        lineStyle: DividerLineStyle.dashed,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontFamily: 'DM san',
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            '\$30.99',
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
                            child: Text(
                              'Buy Now   |   JOD10.00',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
                            )),
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
