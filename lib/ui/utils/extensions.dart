import 'package:intl/intl.dart';

extension DateStringExtension on String {
  String toSpanishDate({int? overrideYear}) {
    try {
      DateTime fecha = DateTime.parse(this);

      if (overrideYear != null) {
        fecha = DateTime(overrideYear, fecha.month, fecha.day);
      }

      DateFormat formateador = DateFormat('d \'de\' MMMM yyyy', 'es');

      return formateador.format(fecha);
    } catch (e) {
      return this;
    }
  }

  String calculatePrice(String price) {
    try {
      String value = split(' ')[0];
      final pricePerHour = double.parse(price);
      final hours = int.parse(value);
      final total = pricePerHour * hours;
      return '\$ $total';
    } catch (e) {
      return this;
    }
  }

  String timeDifferenceFormatted(String otherTime) {
    final format = DateFormat("h:mm a");

    final time1 = format.parse(this);
    final time2 = format.parse(otherTime);
    final minutes = time2.difference(time1).inMinutes;

    if (minutes < 60) {
      return "$minutes minutos";
    } else {
      final hours = minutes / 60.0;
      final rounded = hours.toStringAsFixed(
        hours.truncateToDouble() == hours ? 0 : 1,
      );
      return "$rounded ${hours == 1 ? 'hora' : 'horas'}";
    }
  }
}
