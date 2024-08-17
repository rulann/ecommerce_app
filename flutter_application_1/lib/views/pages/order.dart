import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/widget/order_item_widget.dart';

class MyOrder extends StatelessWidget {
  const MyOrder({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 100,
        title: const Row(
          children: [
            Icon(Icons.shopping_bag_outlined),
            SizedBox(
              width: 10,
            ),
            Text(
              'My Order',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 21,
                fontFamily: 'DM san',
                color: Color.fromRGBO(4, 11, 20, 1),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: const Column(
            children: [
              CartItem(
                img: 'assets/images/product11.png',
                title: 'ايبوكسي لاصق معدن bison epoxy metal 24ml',
                item: '3',
                orderNum: '#123456789',
                itemNum: '114666',
                date: '2/2/2024',
                price: '\$24.99',
                status: 'Complete',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(),
              ),
              CartItem(
                img: 'assets/images/product11.png',
                title: 'ايبوكسي لاصق معدن bison epoxy metal 24ml',
                item: '3',
                orderNum: '#123456789',
                itemNum: '114666',
                date: '2/2/2024',
                price: '\$24.99',
                status: 'Complete',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(),
              ),
              CartItem(
                img: 'assets/images/product11.png',
                title: 'ايبوكسي لاصق معدن bison epoxy metal 24ml',
                item: '3',
                orderNum: '#123456789',
                itemNum: '114666',
                date: '2/2/2024',
                price: '\$24.99',
                status: 'Complete',
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
