import 'package:airpedia/app/modules/home/components/ticket_active.dart';
import 'package:airpedia/app/modules/home/components/ticket_complete.dart';
import 'package:airpedia/app/modules/home/components/ticket_tabbar.dart';
import 'package:airpedia/app/modules/home/components/ticket_tabbar_item.dart';
import 'package:flutter/material.dart';

class TabTicket extends StatelessWidget {
  const TabTicket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TicketTabBar(
      onTapTabBarMenu: (index) {
        if (index == 0) {
        } else {}
      },
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
