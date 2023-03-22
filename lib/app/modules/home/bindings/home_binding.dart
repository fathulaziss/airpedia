// ignore_for_file: directives_ordering

import 'package:airpedia/app/modules/home/controllers/history_controller.dart';
import 'package:airpedia/app/modules/home/controllers/setting_controller.dart';
import 'package:airpedia/app/modules/home/controllers/ticket_controller.dart';
import 'package:get/get.dart';
import 'package:airpedia/app/modules/home/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get
      ..lazyPut<HomeController>(HomeController.new)
      ..lazyPut<TicketController>(TicketController.new)
      ..lazyPut<HistoryController>(HistoryController.new)
      ..lazyPut<SettingController>(SettingController.new);
  }
}
