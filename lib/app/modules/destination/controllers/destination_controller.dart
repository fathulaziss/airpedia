import 'package:airpedia/app/models/destination_model.dart';
import 'package:get/get.dart';

class DestinationController extends GetxController {
  Rx<DestinationModel> data = const DestinationModel().obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args != null) {
      data.value = args['data'];
    }
    super.onInit();
  }
}
