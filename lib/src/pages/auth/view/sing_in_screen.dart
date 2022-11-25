import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:appquitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:appquitanda/src/pages/common_widgets/app_name_widget.dart';
import 'package:appquitanda/src/pages/common_widgets/customs_text_fields.dart';
import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/pages_Routes/app_Pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingInScreen extends StatelessWidget {
  SingInScreen({super.key});

  final _formkey = GlobalKey<FormState>();

  //controlador de camp text
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                    const AppNameWidget(
                      greenTittleColor: Colors.white,
                      textSize: 40,
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
                child: Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      //email
                      CustomTextFormField(
                        controller: emailController,
                        icon: Icons.email,
                        label: 'Email',
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Digite seu email';
                          }
                          if (!email.isEmail) return "Digite um email valido";
                          return null;
                        },
                      ),
                      //senha
                      CustomTextFormField(
                        controller: passwordController,
                        icon: Icons.lock,
                        label: 'Senha',
                        isSecret: true,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Digite sua senha';
                          }
                          if (password.length < 7) {
                            return "digite uma senha com pelo menos 7 digitos";
                          }
                          return null;
                        },
                      ),
                      //botaoentrar
                      SizedBox(
                        height: 50,
                        child: GetX<AuthController>(
                          builder: (authcontroller) {
                            return ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18),
                                ),
                                backgroundColor: Colors.green,
                              ),
                              onPressed: authcontroller.isLoading.value
                                  ? null
                                  : () {
                                      FocusScope.of(context).unfocus();
                                      if (_formkey.currentState!.validate()) {
                                        String email = emailController.text;
                                        String password =
                                            passwordController.text;

                                        authcontroller.singIn(
                                            email: email, password: password);
                                      } else {
                                        // (print('invalid field'));
                                      }
                                    },
                              child: authcontroller.isLoading.value
                                  ? const CircularProgressIndicator()
                                  : const Text("entrar",
                                      style: TextStyle(fontSize: 18)),
                            );
                          },
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
                            // Navigator.of(context)
                            //     .push(MaterialPageRoute(builder: (c) {
                            //   return SingUpScreen();
                            // }));
                            Get.toNamed(PagesRoutes.singUpRoute);
                          },
                          child: const Text('Criar conta'),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
