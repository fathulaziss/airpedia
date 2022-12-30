import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:airpedia/app/models/user_model.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:airpedia/utils/format_date_time.dart';
import 'package:airpedia/widgets/others/show_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EditProfileController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  final cFullName = TextEditingController();
  RxString fullName = ''.obs;
  bool isValidFullName = false;

  final cEmail = TextEditingController();

  final cDateOfBirth = TextEditingController();
  RxString dateOfBirth = ''.obs;
  bool isValidDateOfBirth = false;

  RxBool isValidForm = false.obs;
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  void initData() {
    cFullName.text = cUserInfo.dataUser.value.fullName;
    cEmail.text = cUserInfo.dataUser.value.email;
    cDateOfBirth.text = FormatDateTime.format(
      value: DateTime.parse(cUserInfo.dataUser.value.dateOfBirth),
      format: DateFormat('dd/MM/yyyy'),
    );
    setFullName(cUserInfo.dataUser.value.fullName);
    setDateOfBirth(DateTime.parse(cUserInfo.dataUser.value.dateOfBirth));
  }

  void setFullName(String value) {
    fullName(value);
    if (fullName.value.isNotEmpty) {
      isValidFullName = true;
    } else {
      isValidFullName = false;
    }
    validateForm();
  }

  void setDateOfBirth(DateTime value) {
    dateOfBirth(value.toString());
    if (dateOfBirth.value.isNotEmpty) {
      isValidDateOfBirth = true;
    } else {
      isValidDateOfBirth = false;
    }
    validateForm();
  }

  void validateForm() {
    if (isValidFullName && isValidDateOfBirth) {
      isValidForm(true);
    } else {
      isValidForm(false);
    }
  }

  Future<void> submit() async {
    try {
      AppUtils.dismissKeyboard();

      isLoading(true);

      final dataUser = UserModel(
        balance: cUserInfo.dataUser.value.balance,
        dateOfBirth: dateOfBirth.value,
        email: cUserInfo.dataUser.value.email,
        fullName: fullName.value,
        imageProfile: cUserInfo.dataUser.value.imageProfile,
        pinTransaction: cUserInfo.dataUser.value.pinTransaction,
        userId: cUserInfo.dataUser.value.userId,
      );

      await cUserInfo.updateDataUser(data: dataUser);
      await cUserInfo.getDataUser();

      await Future.delayed(const Duration(seconds: 1));

      isLoading(false);

      await Future.delayed(const Duration(milliseconds: 220));

      showPopUpInfo(
        title: 'success'.tr,
        description: 'updateProfileSuccess'.tr,
        onPress: () {
          Get
            ..back()
            ..back();
        },
      );
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
