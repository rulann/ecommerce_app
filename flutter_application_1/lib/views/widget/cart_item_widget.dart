import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Product extends StatelessWidget {
  const Product(
      {required this.text,
      required this.img,
      required this.price,
      required this.count,
      required this.itemID,
      required this.orderID});

  final String img;
  final String text;
  final String price;
  final RxInt count;
  final String itemID;
  final String orderID;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
          child: Card(
        color: Colors.white,
        child: Container(
          height: 100,
          padding: EdgeInsets.all(5),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: Colors.white,
                width: 50,
                child: Image.network(
                  img,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          text,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w500),
                          overflow: TextOverflow.visible,
                        ),
                      ),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          '\$ ${price}',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.find<CartController>()
                                    .dec(count, itemID, orderID);
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              '${count.value}',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.find<CartController>()
                                    .inc(count, itemID, orderID);
                                    
                              },
                              icon: Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
