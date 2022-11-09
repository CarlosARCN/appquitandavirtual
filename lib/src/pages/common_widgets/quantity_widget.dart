// ignore_for_file: camel_case_types

import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class Quantitywidget extends StatelessWidget {
  final int value1;
  final String suffixtext2;
  final Function(int quantity) result;

  const Quantitywidget({
    super.key,
    required this.value1,
    required this.suffixtext2,
    required this.result,
    //required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.shade300,
            spreadRadius: 1,
            blurRadius: 2,
          ),
        ],
      ),
      child: Row(
        children: [
          _quantitybutton(
            color: Colors.grey,
            icon: Icons.remove,
            onpresed: () {},
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              '$value1 $suffixtext2',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          _quantitybutton(
            color: CustomColors.customSwatchColor,
            icon: Icons.add,
            onpresed: () {
              int resultcount = value1 + 1;

              result(resultcount);
            },
          )
        ],
      ),
    );
  }
}

class _quantitybutton extends StatelessWidget {
  final Color color;
  final IconData icon;
  final VoidCallback onpresed;

  const _quantitybutton(
      {Key? key,
      required this.color,
      required this.icon,
      required this.onpresed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(50),
      child: InkWell(
        onTap: onpresed,
        child: Ink(
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }
}
