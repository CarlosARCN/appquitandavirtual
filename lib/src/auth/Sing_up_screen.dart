import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: Column(
        children: const [
          Expanded(
            child: Center(
              child: Text(
                "cadastro",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 35,
                ),
              ),
            ),
          ),
          //formulario
        ],
      ),
    );
  }
}
