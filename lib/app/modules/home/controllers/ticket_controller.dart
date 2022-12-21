import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:airpedia/app/models/ticket_model.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class TicketController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  final collectionTicket =
      FirebaseFirestore.instance.collection('ticket_transactions');

  RxList<TicketModel> listTicketActive = <TicketModel>[].obs;

  RxList<TicketModel> listTicketComplete = <TicketModel>[].obs;

  RxBool isLoading = false.obs;

  Future<void> getTicket() async {
    try {
      isLoading(true);

      final result = await collectionTicket.get();

      await Future.delayed(const Duration(seconds: 2));

      if (result.docs.isNotEmpty) {
        final data = result.docs.where(
          (item) => item.data()['user_id'] == cUserInfo.dataUser.value.userId,
        );

        final ticketActive = data.where((item) {
          return DateTime.fromMillisecondsSinceEpoch(
                item.data()['departure_schedule'],
              ).isAfter(DateTime.now()) ==
              true;
        }).toList();

        final ticketComplete = data.where((item) {
          return DateTime.fromMillisecondsSinceEpoch(
                item.data()['departure_schedule'],
              ).isBefore(DateTime.now()) ==
              true;
        }).toList();

        listTicketActive(
          RxList.from(ticketActive.map((e) => TicketModel.fromJson(e.data()))),
        );

        listTicketActive.sort(
          (a, b) => b.transactionDate.compareTo(a.transactionDate),
        );

        listTicketComplete(
          RxList.from(
            ticketComplete.map((e) => TicketModel.fromJson(e.data())),
          ),
        );

        listTicketComplete.sort(
          (a, b) => b.transactionDate.compareTo(a.transactionDate),
        );
      }

      isLoading(false);
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
      rethrow;
    }
  }
}
