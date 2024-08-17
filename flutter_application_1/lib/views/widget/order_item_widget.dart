import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    required this.img,
    required this.title,
    required this.item,
    required this.orderNum,
    required this.itemNum,
    required this.date,
    required this.price,
    required this.status,
  });

  final String img;
  final String title;
  final String item;
  final String orderNum;
  final String itemNum;
  final String date;
  final String price;
  final String status;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color.fromRGBO(240, 240, 240, 1),
            borderRadius: BorderRadius.circular(10),
          ),
          width: 70,
          child: Image.asset(img),
        ),
        Column(
          children: [
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 14,
                  fontFamily: 'DM san'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'item: ',
                  style: TextStyle(
                      fontFamily: 'DM san',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(174, 91, 91, 91)),
                ),
                Text(
                  item,
                  style: TextStyle(
                    fontFamily: 'DM san',
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 60,
                ),
                Text(
                  'Order Number: ',
                  style: TextStyle(
                      fontFamily: 'DM san',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(174, 91, 91, 91)),
                ),
                Text(
                  orderNum,
                  style: TextStyle(
                    fontFamily: 'DM san',
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Item Number: ',
                  style: TextStyle(
                      fontFamily: 'DM san',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(174, 91, 91, 91)),
                ),
                Text(
                  itemNum,
                  style: TextStyle(
                    fontFamily: 'DM san',
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Date Order: ',
                  style: TextStyle(
                      fontFamily: 'DM san',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(174, 91, 91, 91)),
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontFamily: 'DM san',
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(
                  'Price: ',
                  style: TextStyle(
                      fontFamily: 'DM san',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(174, 91, 91, 91)),
                ),
                Text(
                  price,
                  style: TextStyle(
                    fontFamily: 'DM san',
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(width: 50),
                Text(
                  'Order Status: ',
                  style: TextStyle(
                      fontFamily: 'DM san',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(174, 91, 91, 91)),
                ),
                Text(status,
                    style: TextStyle(
                      fontFamily: 'DM san',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                    ))
              ],
            ),
          ],
        ),
      ],
    );
  }
}
