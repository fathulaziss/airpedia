import 'package:airpedia/app/modules/topup/controllers/topup_controller.dart';
import 'package:get/get.dart';

class TopupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TopupController>(TopupController.new);
  }
}
