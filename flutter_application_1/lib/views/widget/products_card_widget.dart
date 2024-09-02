import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {required this.image,
      required this.text1,
      required this.text2,
      required this.price,
      required this.pressed,
      required this.add});

  final String image;
  final String text1;
  final String text2;
  final String price;
  final Function() pressed;
  final Function() add;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pressed();
      },
      child: Container(
        // width: MediaQuery.of(context).size.width * 0.4,
        // height: MediaQuery.of(context).size.height * 0.42,
        margin: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        padding: EdgeInsets.only(top: 20, left: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(color: Color.fromRGBO(235, 235, 235, 1))),
        child: Column(
          children: [
            Image.network(
              image,
              width: 77,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${text1} \n ${text2}',
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Raleway'),
                ),
              ),
            ),
            Spacer(
              flex: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'JOD ${price}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(18),
                          bottomRight: Radius.circular(18))),
                  child: IconButton(
                    onPressed: () {
                      add();
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    iconSize: 20,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
