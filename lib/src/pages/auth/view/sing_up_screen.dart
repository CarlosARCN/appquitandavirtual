import 'package:appquitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:appquitanda/src/pages/common_widgets/customs_text_fields.dart';
import 'package:appquitanda/src/config/custom_colors.dart';
import 'package:appquitanda/src/services/validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SingUpScreen extends StatelessWidget {
  SingUpScreen({super.key});
  final phonefomartter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );
  final cpfformartter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {
      '#': RegExp(r'[0-9]'),
    },
  );
  final _formKey = GlobalKey<FormState>();
  final authController = Get.find<AuthController>();

  // static get r => null;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: CustomColors.customSwatchColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                children: [
                  const Expanded(
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
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 40,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(45),
                      ),
                    ),
                    //form/formkey
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //email
                          CustomTextFormField(
                            icon: Icons.email,
                            onSaved: (value) {
                              authController.user.email = value;
                            },
                            validator: emailValidator,
                            label: 'Email',
                            textInputType: TextInputType.emailAddress,
                          ),
                          //senha
                          CustomTextFormField(
                            icon: Icons.lock,
                            validator: passwordValidator,
                            onSaved: (value) {
                              authController.user.password = value;
                            },
                            label: 'Senha',
                            isSecret: true,
                            textInputType: TextInputType.visiblePassword,
                          ),
                          //nome
                          CustomTextFormField(
                            icon: Icons.person,
                            label: 'Nome',
                            validator: nameValidator,
                            onSaved: (value) {
                              authController.user.name = value;
                            },
                          ),
                          //celular
                          CustomTextFormField(
                            icon: Icons.phone,
                            label: 'Celular',
                            validator: phoneValidator,
                            textInputType: TextInputType.phone,
                            onSaved: (value) {
                              authController.user.phone = value;
                            },
                            inputFormatters: [phonefomartter],
                          ),
                          //cpf
                          CustomTextFormField(
                            icon: Icons.document_scanner,
                            label: 'CPF',
                            validator: cpfValidator,
                            onSaved: (value) {
                              authController.user.cpf = value;
                            },
                            textInputType: TextInputType.number,
                            inputFormatters: [cpfformartter],
                          ),
                          SizedBox(
                              height: 50,
                              child: Obx(() {
                                return ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                  ),
                                  onPressed: authController.isLoading.value
                                      ? null
                                      : () {
                                          FocusScope.of(context).unfocus();
                                          if (_formKey.currentState!
                                              .validate()) {
                                            _formKey.currentState!.save();

                                            authController.signUp();
                                          }
                                        },
                                  child: authController.isLoading.value
                                      ? const CircularProgressIndicator()
                                      : const Text(
                                          "cadastrar usuario",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                );
                              }))
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Positioned(
                left: 10,
                top: 10,
                child: SafeArea(
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios,
                        color: Colors.white,
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
