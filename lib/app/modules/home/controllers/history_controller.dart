import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:airpedia/app/models/history_model.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HistoryController extends GetxController {
  final cUserInfo = Get.find<UserInfoController>();

  RxList<HistoryModel> listHistoryTransaction = <HistoryModel>[].obs;

  RxBool isLoading = false.obs;

  Future<void> getHistoryTransaction() async {
    try {
      isLoading(true);

      final collectionTransaction =
          FirebaseFirestore.instance.collection('transactions');

      final result = await collectionTransaction.get();

      await Future.delayed(const Duration(seconds: 2));

      if (result.docs.isNotEmpty) {
        final document = result.docs.where(
          (element) =>
              element.data()['user_id'] == cUserInfo.dataUser.value.userId,
        );

        listHistoryTransaction(
          RxList.from(document.map((e) => HistoryModel.fromJson(e.data()))),
        );

        listHistoryTransaction.sort(
          (a, b) => b.transactionDate.compareTo(a.transactionDate),
        );
      }
      isLoading(false);
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
