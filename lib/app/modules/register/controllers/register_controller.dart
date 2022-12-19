import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:airpedia/app/models/user_model.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:airpedia/utils/regex.dart';
import 'package:airpedia/widgets/others/show_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  final cFullName = TextEditingController();
  RxString fullName = ''.obs;
  bool isValidFullName = false;

  final cEmail = TextEditingController();
  RxString email = ''.obs;
  bool isValidEmail = false;

  final cDateOfBirth = TextEditingController();
  RxString dateOfBirth = ''.obs;
  bool isValidDateOfBirth = false;

  final cPassword = TextEditingController();
  RxString password = ''.obs;
  bool isValidPasswordd = false;

  final cPinTransaction = TextEditingController();
  RxString pinTransaction = ''.obs;
  bool isValidPinTransaction = false;

  RxBool isLoading = false.obs;
  RxBool isValidForm = false.obs;

  void setFullName(String value) {
    fullName(value);
    if (fullName.value.isNotEmpty) {
      isValidFullName = true;
    } else {
      isValidFullName = false;
    }
    validateForm();
  }

  void setEmail(String value) {
    email(value);
    if (GetUtils.isEmail(email.value)) {
      isValidEmail = true;
    } else {
      isValidEmail = false;
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

  void setPassword(String value) {
    password(value);
    if (isValidPassword(password: password.value)) {
      isValidPasswordd = true;
    } else {
      isValidPasswordd = false;
    }
    validateForm();
  }

  void setPinTransaction(String value) {
    pinTransaction(value);
    if (pinTransaction.value.length == 6) {
      isValidPinTransaction = true;
    } else {
      isValidPinTransaction = false;
    }
    validateForm();
  }

  void validateForm() {
    if (isValidFullName &&
        isValidEmail &&
        isValidDateOfBirth &&
        isValidPasswordd &&
        isValidPinTransaction) {
      isValidForm(true);
    } else {
      isValidForm(false);
    }
  }

  Future<void> register() async {
    try {
      AppUtils.dismissKeyboard();
      isLoading(true);

      final firebaseAuth = FirebaseAuth.instance;
      final collectionReference =
          FirebaseFirestore.instance.collection('users');

      final userCredential = await firebaseAuth.createUserWithEmailAndPassword(
        email: email.value,
        password: password.value,
      );

      final dataUser = UserModel(
        userId: userCredential.user!.uid,
        email: email.value,
        fullName: fullName.value,
        pinTransaction: pinTransaction.value,
        dateOfBirth: dateOfBirth.value,
        balance: 1000000,
      );

      await collectionReference.doc(dataUser.userId).set(dataUser.toJson());

      cUserInfo.setDataUser(dataUser);

      await Future.delayed(const Duration(seconds: 1));

      isLoading(false);

      await Get.offAllNamed(Routes.REGISTER_SUCCESS);
    } catch (e) {
      isLoading(false);
      showPopUpInfo(title: 'Error', description: e.toString());
      logSys(e.toString());
    }
  }
}
