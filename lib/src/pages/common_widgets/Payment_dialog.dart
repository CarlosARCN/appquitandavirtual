// ignore_for_file: file_names, non_constant_identifier_names

import 'package:appquitanda/src/models/order_model.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class PaymentDialog extends StatelessWidget {
  final OrderModel order;
  PaymentDialog({super.key, required this.order});
  final utilServices Utilservices = utilServices();
  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Stack(
          alignment: Alignment.center,
          children: [
            // conteudo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // titulo
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      'pagamento com pix',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                  ),

                  //QR code
                  QrImage(
                    data: "skdjghadfghiash",
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                  //vencimento
                  Text(
                    'vencimento: ${Utilservices.formaterDateTime(order.overdueDatetime)}',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  //total
                  Text(
                    'total: ${Utilservices.priceToCurrency(order.total)}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //botao copia e cola
                  OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          side: BorderSide(
                              width: 2, color: Colors.green.shade400)),
                      onPressed: () {},
                      icon: const Icon(
                        Icons.copy,
                        size: 15,
                      ),
                      label: const Text(
                        'copiar codigo pix',
                        style: TextStyle(fontSize: 13),
                      )),
                ],
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                onPressed: (() {
                  Navigator.of(context).pop();
                }),
                icon: const Icon(Icons.close),
              ),
            ),
          ],
        ));
  }
}
