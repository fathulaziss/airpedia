import 'package:airpedia/app/data/airport_departure_data.dart';
import 'package:airpedia/app/models/airport_model.dart';
import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DestinationController extends GetxController {
  Rx<DestinationModel> data = const DestinationModel().obs;

  final cDateDeparture = TextEditingController();
  RxString dateDaparture = ''.obs;
  bool isValidDateDeparture = false;

  final cAirportDeparture = TextEditingController();
  List<AirportModel> listAirportDeparture = <AirportModel>[];
  Rx<AirportModel> aiportDeparture = const AirportModel().obs;
  bool isValidAirportDeparture = false;

  RxBool isValidTicketForm = false.obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args != null) {
      data.value = args['data'];
    }
    getAirportDeparture();
    super.onInit();
  }

  void setDateOfBirth(DateTime value) {
    dateDaparture(value.toString());
    if (dateDaparture.value.isNotEmpty) {
      isValidDateDeparture = true;
    } else {
      isValidDateDeparture = false;
    }
    validateTicketForm();
  }

  void setAirportDeparture(AirportModel value) {
    aiportDeparture(value);
    cAirportDeparture.text = value.name;
    if (aiportDeparture.value.name.isNotEmpty) {
      isValidAirportDeparture = true;
    } else {
      isValidAirportDeparture = false;
    }
    validateTicketForm();
  }

  void validateTicketForm() {
    if (isValidDateDeparture && isValidAirportDeparture) {
      isValidTicketForm(true);
    } else {
      isValidTicketForm(false);
    }
  }

  Future<void> getAirportDeparture() async {
    try {
      listAirportDeparture =
          airportDeparture.map((e) => AirportModel.fromJson(e)).toList();
    } catch (e) {
      logSys(e.toString());
    }
  }

  List<AirportModel> searchAirportDeparture({required String keyword}) {
    final searchList = <AirportModel>[];
    for (var i = 0; i < listAirportDeparture.length; i++) {
      final name = listAirportDeparture[i].name;
      final code = listAirportDeparture[i].code;
      final location = listAirportDeparture[i].location;
      if (name.toLowerCase().contains(keyword.toLowerCase()) ||
          code.toLowerCase().contains(keyword.toLowerCase()) ||
          location.toLowerCase().contains(keyword.toLowerCase())) {
        searchList
          ..add(listAirportDeparture[i])
          ..sort((a, b) => a.name.compareTo(b.name));
      }
    }
    return searchList;
  }
}
