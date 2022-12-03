// ignore_for_file: camel_case_types
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';

class UtilServicess {
  final storage = const FlutterSecureStorage();

  //salvar dado localmente em seguranca
  Future<void> saveLocalData(
      {required String key, required String data}) async {
    await storage.write(key: key, value: data);
  }

  //recupera dado salvo localmente em seguranca
  Future<String?> getLocalData({required String key}) async {
    return await storage.read(key: key);
  }

  //remove dado salvo localmente

  Future<void> removeLocalData({required String key}) async {
    await storage.delete(key: key);
  }

  String priceToCurrency(double price) {
    NumberFormat numberFormat = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return numberFormat.format(price);
  }

  String formaterDateTime(DateTime dateTime) {
    initializeDateFormatting();

    DateFormat dateFormat = DateFormat.yMd('pt_BR').add_Hm();
    return dateFormat.format(dateTime.toLocal());
  }

  Uint8List decodeQrCodeImage(String value) {
    String base64String = value.split(',').last;

    return base64.decode(base64String);
  }

  void showToast({required String menssage, bool isError = false}) {
    Fluttertoast.showToast(
        msg: menssage,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: isError ? Colors.red : Colors.white,
        textColor: isError ? Colors.white : Colors.black,
        fontSize: 16.0);
  }
}
