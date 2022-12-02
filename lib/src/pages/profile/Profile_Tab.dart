// ignore_for_file: file_names, library_prefixes, prefer_typing_uninitialized_variables

import 'package:appquitanda/src/pages/auth/controller/auth_controller.dart';
import 'package:appquitanda/src/pages/common_widgets/customs_text_fields.dart';
import 'package:flutter/material.dart';
import 'package:appquitanda/src/config/app_data.dart' as appData;
import 'package:get/get.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('perfil do usuario'),
        actions: [
          IconButton(
              onPressed: () {
                authController.signOut();
              },
              icon: const Icon(
                Icons.logout,
              ))
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 16),
        children: [
          //email
          CustomTextFormField(
            readoline: true,
            icon: Icons.email,
            label: 'Email',
            initialValue: appData.user.email,
          ),

          //nome
          CustomTextFormField(
            readoline: true,
            icon: Icons.person,
            label: 'Nome',
            initialValue: appData.user.name,
          ),

          //celular
          CustomTextFormField(
            readoline: true,
            icon: Icons.phone,
            label: 'Celular',
            initialValue: appData.user.phone,
          ),

          //cpf
          CustomTextFormField(
            readoline: true,
            icon: Icons.file_copy,
            label: 'CPF',
            isSecret: true,
            initialValue: appData.user.phone,
          ),

          //bptaosenha
          SizedBox(
            height: 50,
            child: OutlinedButton(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: const BorderSide(
                    color: Colors.green,
                  ),
                ),
              ),
              onPressed: (() {
                updatepassword();
              }),
              child: const Text('atualizar senha'),
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> updatepassword() {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 12,
                        ),
                        child: Text(
                          'atualizaçao de senha',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),

                      //senha atual
                      const CustomTextFormField(
                        isSecret: true,
                        icon: Icons.lock,
                        label: 'Senha atual',
                      ),

                      //nova senha
                      const CustomTextFormField(
                          isSecret: true,
                          icon: Icons.lock_outline,
                          label: 'Nova Senha'),

                      //confirmar nova senha
                      const CustomTextFormField(
                          isSecret: true,
                          icon: Icons.lock_outline,
                          label: 'confirmar a Nova Senha'),

                      //botao comfirmar
                      SizedBox(
                        height: 45,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          )),
                          onPressed: (() {}),
                          child: const Text('atualizar'),
                        ),
                      )
                    ]),
              ),
              Positioned(
                top: 5,
                right: 5,
                child: IconButton(
                  onPressed: (() {
                    Navigator.of(context).pop();
                  }),
                  icon: const Icon(
                    Icons.close,
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
