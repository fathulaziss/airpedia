import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:get/get.dart';

class DestinationBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DestinationController>(DestinationController.new);
  }
}
