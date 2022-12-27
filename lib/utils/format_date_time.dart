import 'package:get/get.dart';
import 'package:intl/intl.dart';

class FormatDateTime {
  static String format({
    required DateTime value,
    DateFormat? format,
  }) {
    format ??= DateFormat(
      'yyyy-MM-dd',
      '${Get.locale!.languageCode}_${Get.locale!.countryCode}',
    );
    try {
      return format.format(value);
    } catch (e) {
      return 'Invalid date';
    }
  }

  static DateTime getArrivalDate({
    required DateTime departureDate,
    required String arrivalSchedule,
  }) {
    final departureSchedule = DateFormat('Hm').format(departureDate);
    final dataDeparture = departureSchedule.split(':');
    final dataArrival = arrivalSchedule.split(':');
    var hour = 0;
    var day = 0;
    if (int.parse(dataDeparture[1]) + int.parse(dataArrival[1]) >= 60) {
      hour = 1;
    }
    if (int.parse(dataDeparture[0]) + int.parse(dataArrival[0]) + hour >= 24) {
      day = 1;
    }
    final arrivalDate = DateFormat('yyyy-MM-dd HH:mm').parse(
      '${departureDate.year}-${departureDate.month}-${departureDate.day + day} $arrivalSchedule',
    );
    return arrivalDate;
  }

  static String getDuration(int minutes) {
    final d = Duration(minutes: minutes);
    final parts = d.toString().split(':');
    return '${parts[0]}${Get.locale!.countryCode == 'ID' ? 'j' : 'h'} ${parts[1].padLeft(2, '0')}m';
  }
}
