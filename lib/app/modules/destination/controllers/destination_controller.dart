import 'package:airpedia/app/controllers/utility_controller.dart';
import 'package:airpedia/app/data/airport_departure_data.dart';
import 'package:airpedia/app/data/destination_ticket_data.dart';
import 'package:airpedia/app/models/airport_model.dart';
import 'package:airpedia/app/models/destination_model.dart';
import 'package:airpedia/app/models/destination_ticket_model.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DestinationController extends GetxController {
  final cUtility = Get.find<UtilityController>();
  Rx<DestinationModel> data = const DestinationModel().obs;

  final cDateDeparture = TextEditingController();
  DateTime dateDaparture = DateTime(2022);
  bool isValidDateDeparture = false;

  final cAirportDeparture = TextEditingController();
  RxList<AirportModel> listAirportDeparture = <AirportModel>[].obs;
  Rx<AirportModel> aiportDeparture = const AirportModel().obs;
  bool isValidAirportDeparture = false;

  RxList<DestinationTicketModel> listDestinationTicket =
      <DestinationTicketModel>[].obs;
  Rx<DestinationTicketModel> destinationTicket =
      const DestinationTicketModel().obs;

  RxBool isValidTicketForm = false.obs;
  RxBool isLoadingDestinationTicket = false.obs;

  @override
  void onInit() {
    final args = Get.arguments;
    if (args != null) {
      data.value = args['data'];
    }
    getAirportDeparture();
    super.onInit();
  }

  void setDateDeparture(DateTime value) {
    dateDaparture = value;
    if (cDateDeparture.text.isNotEmpty) {
      isValidDateDeparture = true;
    } else {
      isValidDateDeparture = false;
    }
    validateTicketForm();
  }

  void setAirportDeparture(AirportModel value) {
    aiportDeparture(value);
    cAirportDeparture.text = value.name;
    if (cAirportDeparture.text.isNotEmpty) {
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

  void setDestinationTicket(DestinationTicketModel value) {
    if (value != destinationTicket.value) {
      destinationTicket(value);
    } else {
      destinationTicket(const DestinationTicketModel());
    }
  }

  Future<void> getAirportDeparture() async {
    try {
      listAirportDeparture(
        RxList.from(airportDepartureData.map(AirportModel.fromJson)),
      );
    } catch (e) {
      logSys(e.toString());
    }
  }

  Future<List<AirportModel>> searchAirportDeparture({
    required String keyword,
  }) async {
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

    if (cAirportDeparture.text != aiportDeparture.value.name) {
      isValidAirportDeparture = false;
      aiportDeparture.value = const AirportModel();
      validateTicketForm();
    }

    await Future.delayed(const Duration(milliseconds: 300));

    return searchList;
  }

  Future<void> getDestinationTicket() async {
    try {
      isLoadingDestinationTicket(true);

      destinationTicket.value = const DestinationTicketModel();

      // Get List Ticket
      final List<Map<String, dynamic>> temp =
          destinationTicketData[data.value.airportDestinationCode]
                  [aiportDeparture.value.code] ??
              [];

      // Parsing data List Ticket with Filter by Date Departure
      listDestinationTicket(
        RxList.from(
          temp
              .map(DestinationTicketModel.fromJson)
              .where(
                (element) =>
                    checkTicketSchedule(
                      dateDaparture,
                      element.departureSchedule,
                    ) ==
                    true,
              )
              .toList(),
        ),
      );

      listDestinationTicket.sort((a, b) => b.price.compareTo(a.price));

      Get.back();

      await Future.delayed(const Duration(seconds: 2));

      isLoadingDestinationTicket(false);
    } catch (e) {
      isLoadingDestinationTicket(false);
      logSys(e.toString());
      rethrow;
    }
  }

  bool checkTicketSchedule(DateTime dateDeparture, String departureSchedule) {
    final dateTimeNow = DateTime.now();
    final dateSchedule = DateFormat('yyyy-MM-dd HH:mm').parse(
      '${dateDeparture.year}-${dateDeparture.month}-${dateDeparture.day} $departureSchedule',
    );
    return dateTimeNow.isBefore(dateSchedule);
  }

  void submit() {
    Get
      ..back()
      ..toNamed(Routes.ORDER);
  }
}
