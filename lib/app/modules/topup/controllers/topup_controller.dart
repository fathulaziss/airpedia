import 'package:airpedia/utils/app_utils.dart';
import 'package:airpedia/utils/format_currency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TopupController extends GetxController {
  final cNominal = TextEditingController();
  RxInt nominal = 0.obs;
  RxBool isValidNominal = false.obs;

  RxInt selectedNominal = 0.obs;

  RxBool isLoading = false.obs;

  void setNominal(int value) {
    nominal(value);
    selectedNominal(0);
    validate();
  }

  void chooseNominal(int value) {
    AppUtils.dismissKeyboard();
    if (selectedNominal.value != value) {
      selectedNominal(value);
      cNominal.text = priceFormatWithoutSymbol(value);
      nominal(value);
      validate();
    } else {
      selectedNominal(0);
      cNominal.text = priceFormatWithoutSymbol(0);
      nominal(0);
      validate();
    }
  }

  void validate() {
    if (nominal.value >= 10000) {
      isValidNominal(true);
    } else {
      isValidNominal(false);
    }
  }
}
