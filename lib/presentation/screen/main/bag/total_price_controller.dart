import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class TotalPriceController extends GetxController {

  Rx<int> totalPrice = 0.obs;
  Rx<String> promoCode = "Enter your promo code".obs;
  Rx<bool> isChoose = false.obs;



  void setValue(int price){
    totalPrice.value = price;
  }
  void setPromoCodeDefault(){
    promoCode.value = "Enter your promo code";
  }
}
