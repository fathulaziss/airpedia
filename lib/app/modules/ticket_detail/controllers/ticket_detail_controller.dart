import 'package:airpedia/app/models/ticket_model.dart';
import 'package:get/get.dart';

class TicketDetailController extends GetxController {
  Rx<TicketModel> data = const TicketModel().obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args != null) {
      data.value = args['data'];
    }
    super.onInit();
  }

  String checkBenefit(dynamic value) {
    if (value == 'Baggage 20 Kg' || value == 'Bagasi 20 Kg') {
      return 'benefit1'.tr;
    }
    if (value == 'Food' || value == 'Makanan') {
      return 'benefit2'.tr;
    }
    if (value == 'Entertainment' || value == 'Hiburan') {
      return 'benefit3'.tr;
    }
    if (value == 'USB Port / Power' || value == 'Port USB / Daya') {
      return 'benefit4'.tr;
    }
    return '';
  }
}
