import 'package:get/get.dart';

class CartController extends GetxController {
  void inc(RxInt count) {
    count++;
    update();
  }

  void dec(RxInt count) {
    if (count > 0) {
      count--;
      update();
    }
  }


add(){
  
}
  remove(){

  }

  view(){

  }
}
