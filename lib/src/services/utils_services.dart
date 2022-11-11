// ignore_for_file: camel_case_types

import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class utilServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(price);
  }

  String formaterDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime);
  }
}
