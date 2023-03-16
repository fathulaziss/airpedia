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
    final dataArrival = arrivalSchedule.split(':');

    final diffHour = int.parse(dataArrival[0]) - departureDate.hour;
    final diffMinute = int.parse(dataArrival[1]) - departureDate.minute;

    final arrivalDate = DateFormat('yyyy-MM-dd HH:mm').parse(
      '${departureDate.year}-${departureDate.month}-${departureDate.day} ${departureDate.hour + diffHour}:${departureDate.minute + diffMinute}',
    );
    return arrivalDate;
  }

  static String getDuration(int minutes) {
    final d = Duration(minutes: minutes);
    final parts = d.toString().split(':');
    return '${parts[0]}${Get.locale!.countryCode == 'ID' ? 'j' : 'h'} ${parts[1].padLeft(2, '0')}m';
  }
}
