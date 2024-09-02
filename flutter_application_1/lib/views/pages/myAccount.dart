import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/cache_utils.dart';
import 'package:flutter_application_1/views/widget/my_account_widget.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:iconify_flutter/icons/jam.dart';
import 'package:iconify_flutter/icons/ic.dart';
import 'package:iconify_flutter/icons/entypo_social.dart';

class MyAccount extends StatelessWidget {
  final CacheUtils cacheUtils = CacheUtils(GetStorage());
  MyAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        titleSpacing: 100,
        title: Text(
          'acc'.tr,
          style: const TextStyle(
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
            Column(
              children: [
                MyAccountWidget(
                  leading: Icon(Icons.shopping_bag_outlined),
                  text: Text('order'.tr),
                  tap: () => Get.toNamed('/order'),
                ),
                MyAccountWidget(
                  leading: Icon(Icons.person_outline_rounded),
                  text: Text('info'.tr),
                  tap: () => Get.toNamed('/info'),
                ),
                MyAccountWidget(
                  leading: Icon(Icons.payment),
                  text: Text('payment'.tr),
                ),
                MyAccountWidget(
                  leading: Icon(Icons.miscellaneous_services_rounded),
                  text: (Text('services'.tr)),
                ),
                MyAccountWidget(
                  leading: Icon(Icons.info_outline),
                  text: Text('about'.tr),
                ),
                MyAccountWidget(
                  leading: Icon(Icons.logout),
                  text: Text('logOut'.tr),
                  tap: () => {cacheUtils.SignOut(), Get.offAllNamed('/splash')},
                ),
                Container(
                  padding: EdgeInsets.only(top: 70),
                  child: Column(
                    children: [
                      Text(
                        'follow'.tr,
                        style: TextStyle(
                            fontFamily: 'DM san',
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook,
                              size: 50,
                            ),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: Iconify(
                                Jam.linkedin_circle,
                                size: 50,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Iconify(
                                Ic.baseline_whatsapp,
                                size: 50,
                              )),
                          IconButton(
                              onPressed: () {},
                              icon: Iconify(
                                EntypoSocial.instagram_with_circle,
                                size: 50,
                              )),
                        ],
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
