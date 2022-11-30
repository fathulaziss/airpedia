import 'package:airpedia/app/models/user_model.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  Rx<UserModel> dataUser = const UserModel().obs;

  void setDataUser(UserModel value) => dataUser(value);
}
