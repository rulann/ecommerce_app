import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/controller/cart_controller.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

class Product extends StatelessWidget {
  const Product(
      {required this.text,
      required this.img,
      required this.price,
      required this.count});

  final String img;
  final String text;
  final String price;
  final RxInt count;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        child: Container(
          height: 90,
          padding: EdgeInsets.all(8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                  color: Color.fromRGBO(240, 240, 240, 1),
                  width: 52,
                  child: Image.asset(
                    img,
                  )),
              Column(
                children: [
                  Text(
                    text,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        price,
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        width: 100,
                      ),
                      GetBuilder<CartController>(
                        builder: (controller) => Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                controller.dec(count);
                              },
                              icon: Icon(Icons.remove),
                            ),
                            Text(
                              '${count}',
                              style: TextStyle(
                                  fontWeight: FontWeight.w700, fontSize: 16),
                            ),
                            IconButton(
                                onPressed: () {
                                  controller.inc(count);
                                },
                                icon: Icon(Icons.add))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
