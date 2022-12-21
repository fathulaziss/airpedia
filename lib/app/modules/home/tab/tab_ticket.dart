import 'package:airpedia/app/modules/home/components/ticket_active.dart';
import 'package:airpedia/app/modules/home/components/ticket_complete.dart';
import 'package:airpedia/app/modules/home/components/ticket_tabbar.dart';
import 'package:airpedia/app/modules/home/components/ticket_tabbar_item.dart';
import 'package:airpedia/app/modules/home/controllers/ticket_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabTicket extends GetView<TicketController> {
  const TabTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TicketTabBar(
      onTapTabBarMenu: (index) {},
      listTabBarMenu: const [
        TicketTabBarItem(label: 'Active'),
        TicketTabBarItem(label: 'Complete'),
      ],
      listTabBarView: const [
        TicketActive(),
        TicketComplete(),
      ],
    );
  }
}
