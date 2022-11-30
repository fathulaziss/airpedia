import 'package:airpedia/utils/regex.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
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
}
