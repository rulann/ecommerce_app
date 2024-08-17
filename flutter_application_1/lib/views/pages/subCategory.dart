import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SubCategory extends StatelessWidget {
  const SubCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 100,
        title: const Text(
          'Sub Categories',
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
            Divider(
              color: Color.fromRGBO(225, 225, 225, 1),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              padding: EdgeInsets.all(10),
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 3,
                children: List.generate(
                  9,
                  (index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 4),
                          child: SizedBox(
                            height: 100,
                            width: 100,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed('/subCategory');
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: Color.fromRGBO(190, 190, 190, 1),
                                    )),
                                child: ClipOval(
                                  child: Image(
                                    image: NetworkImage(
                                        'https://th.bing.com/th/id/OIP.nT4cPLz4cbWG37e_fx0IfAAAAA?rs=1&pid=ImgDetMain'),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Text(
                          'controller',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 11,
                              fontFamily: 'DM san'),
                        ),
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
