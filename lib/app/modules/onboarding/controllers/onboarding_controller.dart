import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/constants/constant.dart';
import 'package:airpedia/utils/app_storage.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  Future<void> getStarted() async {
    await AppStorage.write(key: APP_FIRST_TIME_OPEN, value: 'true');
    await Get.offNamed(Routes.LOGIN);
  }
}
