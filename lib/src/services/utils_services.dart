// ignore_for_file: camel_case_types

import 'package:intl/intl.dart';

class utilServices {
  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(price);
  }
}
