import 'package:airpedia/app/data/seat_data.dart';
import 'package:airpedia/app/models/seat_model.dart';
import 'package:airpedia/app/modules/destination/controllers/destination_controller.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  final cDestination = Get.find<DestinationController>();

  RxList<String> listSeatType = <String>[].obs;
  RxList<String> listSeatNumber = <String>[].obs;
  RxList<SeatModel> listSeatTypeA = <SeatModel>[].obs;
  RxList<SeatModel> listSeatTypeB = <SeatModel>[].obs;
  RxList<SeatModel> listSeatTypeC = <SeatModel>[].obs;
  RxList<SeatModel> listSeatTypeD = <SeatModel>[].obs;
  RxList<SeatModel> selectedSeat = <SeatModel>[].obs;

  @override
  void onInit() {
    getSeat();
    super.onInit();
  }

  Future<void> getSeat() async {
    try {
      final data = seatData;
      final List seatTypes = data['list_seat_type'];
      final List seatNumbers = data['list_seat_number'];
      final List seatTypesA = data['seat_type_a'];
      final List seatTypesB = data['seat_type_b'];
      final List seatTypesC = data['seat_type_c'];
      final List seatTypesD = data['seat_type_d'];

      listSeatType(RxList.from(seatTypes.map((e) => e as String)));
      listSeatType.insert(2, '');
      listSeatNumber(RxList.from(seatNumbers.map((e) => e as String)));
      listSeatTypeA(RxList.from(seatTypesA.map((e) => SeatModel.fromJson(e))));
      listSeatTypeB(RxList.from(seatTypesB.map((e) => SeatModel.fromJson(e))));
      listSeatTypeC(RxList.from(seatTypesC.map((e) => SeatModel.fromJson(e))));
      listSeatTypeD(RxList.from(seatTypesD.map((e) => SeatModel.fromJson(e))));
    } catch (e) {
      logSys(e.toString());
    }
  }

  void chooseSeat(SeatModel value) {
    if (!selectedSeat.contains(value)) {
      selectedSeat.add(value);
    } else {
      selectedSeat.remove(value);
    }
  }
}
