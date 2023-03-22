import 'package:airpedia/app/controllers/user_info_controller.dart';
import 'package:airpedia/app/data/seat_data.dart';
import 'package:airpedia/app/models/seat_model.dart';
import 'package:airpedia/app/models/user_model.dart';
import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:airpedia/app/routes/app_pages.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class OrderController extends GetxController {
  final cDestination = Get.find<DestinationController>();
  final cUserInfo = Get.find<UserInfoController>();

  RxList<String> listSeatType = <String>[].obs;
  RxList<String> listSeatNumber = <String>[].obs;
  RxList<SeatModel> listSeatTypeA = <SeatModel>[].obs;
  RxList<SeatModel> listSeatTypeB = <SeatModel>[].obs;
  RxList<SeatModel> listSeatTypeC = <SeatModel>[].obs;
  RxList<SeatModel> listSeatTypeD = <SeatModel>[].obs;
  RxList<SeatModel> selectedSeat = <SeatModel>[].obs;
  RxInt departureSchedule = 0.obs;

  RxInt totalSeatPrice = 0.obs;
  RxDouble totalVatPrice = 0.0.obs;
  RxInt total = 0.obs;

  RxBool isLoading = false.obs;

  @override
  void onInit() {
    departureSchedule.value = DateFormat('yyyy-MM-dd hh:mm')
        .parse(
          '${cDestination.dateDaparture.year}-${cDestination.dateDaparture.month}-${cDestination.dateDaparture.day} ${cDestination.destinationTicket.value.departureSchedule}',
        )
        .millisecondsSinceEpoch;
    getSeat();
    super.onInit();
  }

  Future<void> getSeat() async {
    try {
      final data = seatData;
      final List seatTypes = data['list_seat_type'];
      final List seatNumbers = data['list_seat_number'];
      final List<Map<String, dynamic>> seatTypesA = data['seat_type_a'];
      final List<Map<String, dynamic>> seatTypesB = data['seat_type_b'];
      final List<Map<String, dynamic>> seatTypesC = data['seat_type_c'];
      final List<Map<String, dynamic>> seatTypesD = data['seat_type_d'];

      listSeatType(RxList.from(seatTypes.map((e) => e as String)));
      listSeatType.insert(2, '');
      listSeatNumber(RxList.from(seatNumbers.map((e) => e as String)));
      listSeatTypeA(RxList.from(seatTypesA.map(SeatModel.fromJson)));
      listSeatTypeB(RxList.from(seatTypesB.map(SeatModel.fromJson)));
      listSeatTypeC(RxList.from(seatTypesC.map(SeatModel.fromJson)));
      listSeatTypeD(RxList.from(seatTypesD.map(SeatModel.fromJson)));
    } catch (e) {
      logSys(e.toString());
    }
  }

  void chooseSeat(SeatModel value) {
    if (!selectedSeat.contains(value)) {
      selectedSeat.add(value);
      totalSeatPrice.value =
          cDestination.destinationTicket.value.price * selectedSeat.length;
      totalVatPrice.value =
          (cDestination.destinationTicket.value.price * selectedSeat.length) *
              cDestination.destinationTicket.value.vat;
      total.value = (totalSeatPrice.value + totalVatPrice.value).truncate();
    } else {
      selectedSeat.remove(value);
      totalSeatPrice.value =
          cDestination.destinationTicket.value.price * selectedSeat.length;
      totalVatPrice.value =
          (cDestination.destinationTicket.value.price * selectedSeat.length) *
              cDestination.destinationTicket.value.vat;
      total.value = (totalSeatPrice.value + totalVatPrice.value).truncate();
    }
  }

  Future<void> submit() async {
    if (cUserInfo.dataUser.value.balance > total.value) {
      final pin = await Get.toNamed(Routes.PIN);
      if (pin != null) {
        await payment();
      }
    } else {
      await Get.toNamed(Routes.TOPUP);
    }
  }

  Future<void> payment() async {
    try {
      isLoading(true);
      final collectionTicketTransaction =
          FirebaseFirestore.instance.collection('ticket_transactions');
      final collectionTransaction =
          FirebaseFirestore.instance.collection('transactions');

      await Future.delayed(const Duration(seconds: 2));

      await collectionTicketTransaction.add({
        'destination': cDestination.data.value.toJson(),
        'ticket': cDestination.destinationTicket.value.toJson(),
        'departure_schedule': departureSchedule.value,
        'transaction_date': DateTime.now().millisecondsSinceEpoch,
        'total_passenger': selectedSeat.length,
        'selected_seat':
            selectedSeat.map((item) => item.name).toList().join(', '),
        'total': total.value,
        'ref_number': 'TRX${DateTime.now().millisecondsSinceEpoch}',
        'user_id': cUserInfo.dataUser.value.userId,
      });

      await collectionTransaction.add({
        'transaction_type': 'Ticket',
        'title':
            'Ticket ${cDestination.destinationTicket.value.airlineName} : ${cDestination.destinationTicket.value.airportDepartureCode.toUpperCase()} - ${cDestination.destinationTicket.value.airportArrivalCode.toUpperCase()}',
        'amount': total.value,
        'transaction_date': DateTime.now().millisecondsSinceEpoch,
        'user_id': cUserInfo.dataUser.value.userId,
      });

      final dataUser = UserModel(
        balance: cUserInfo.dataUser.value.balance - total.value,
        dateOfBirth: cUserInfo.dataUser.value.dateOfBirth,
        email: cUserInfo.dataUser.value.email,
        fullName: cUserInfo.dataUser.value.fullName,
        imageProfile: cUserInfo.dataUser.value.imageProfile,
        pinTransaction: cUserInfo.dataUser.value.pinTransaction,
        userId: cUserInfo.dataUser.value.userId,
      );

      await cUserInfo.updateDataUser(data: dataUser);
      await cUserInfo.getDataUser();

      isLoading(false);

      await Get.offAllNamed(Routes.ORDER_SUCCESS);
    } catch (e) {
      isLoading(false);
      logSys(e.toString());
    }
  }
}
