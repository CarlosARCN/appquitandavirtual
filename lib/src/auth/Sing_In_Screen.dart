// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appquitanda/src/auth/Sing_up_screen.dart';
import 'package:appquitanda/src/auth/components/customs_text_fields.dart';
import 'package:appquitanda/src/base/base_screen.dart';
import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:flutter/material.dart';

class SingInScreen extends StatelessWidget {
  const SingInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //nome app
                    Text.rich(
                      TextSpan(
                        style: const TextStyle(
                          fontSize: 40,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Green',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: 'grocer',
                            style: TextStyle(
                              color: CustomColors.customContrastColor,
                            ),
                          ),
                        ],
                      ),
                    ),

                    //categorias
                    SizedBox(
                      height: 30,
                      child: DefaultTextStyle(
                        style: const TextStyle(fontSize: 25),
                        child: AnimatedTextKit(
                            pause: Duration.zero,
                            repeatForever: true,
                            animatedTexts: [
                              FadeAnimatedText('Frutas'),
                              FadeAnimatedText('Verduras'),
                              FadeAnimatedText('Legumes'),
                              FadeAnimatedText('Carnes'),
                              FadeAnimatedText('Cereais'),
                              FadeAnimatedText('Laticíneos'),
                            ]),
                      ),
                    ),
                  ],
                ),
              ),

              //formulario
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 32, vertical: 40),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(45),
                  ),
                ),
                //email e senha
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //email
                    const CustomTextFormField(
                      icon: Icons.email,
                      label: 'Email',
                    ),
                    //senha
                    const CustomTextFormField(
                      icon: Icons.lock,
                      label: 'Senha',
                      isSecret: true,
                    ),
                    //botaoentrar
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          backgroundColor: Colors.green,
                        ),
                        onPressed: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (c) {
                              return const BaseScreen();
                            }),
                          );
                        },
                        child: const Text(
                          "entrar",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                    ),
                    //esqueceu a senha
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: (null),
                        child: Text(
                          "esqueceu a senha",
                          style: TextStyle(
                            color: CustomColors.customContrastColor,
                          ),
                        ),
                      ),
                    ),
                    //divisor
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Row(
                        children: const [
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(255, 200, 200, 200),
                              thickness: 2,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Text("ou"),
                          ),
                          Expanded(
                            child: Divider(
                              color: Color.fromARGB(255, 200, 200, 200),
                              thickness: 2,
                            ),
                          ),
                        ],
                      ),
                    ),
                    //botao newuser
                    SizedBox(
                      height: 50,
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18)),
                            side: const BorderSide(
                              width: 2,
                              color: Colors.green,
                            )),
                        onPressed: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (c) {
                            return SingUpScreen();
                          }));
                        },
                        child: const Text('Criar conta'),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
