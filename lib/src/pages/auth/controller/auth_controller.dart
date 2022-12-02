// ignore_for_file: avoid_print, non_constant_identifier_names

import 'package:appquitanda/src/constants/storage_keys.dart';
import 'package:appquitanda/src/models/user_model.dart';
import 'package:appquitanda/src/pages/auth/repository/auth_repository.dart';
import 'package:appquitanda/src/pages/auth/result/auth_result.dart';
import 'package:appquitanda/src/pages_Routes/app_Pages.dart';
import 'package:appquitanda/src/services/utils_services.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authrepository = AuthRepository();
  final UtilServicess UtilsServices = UtilServicess();

  UserModel user = UserModel();
  @override
  void onInit() {
    super.onInit();
    validateToken();
  }

  Future<void> validateToken() async {
    //Recuperar o token que foi salvo localmente
    String? token = await UtilsServices.getLocalData(key: StorageKeys.token);

    if (token == null) {
      Get.offAllNamed(PagesRoutes.signInRoute);
      return;
    }
    AuthResult result = await authrepository.validateToken(token);

    result.when(
      success: (user) {
        this.user = user;

        saveTokenAndProceedToBase();
      },
      error: (menssage) {
        signOut();
      },
    );
  }

  Future<void> resetPsassword(String email) async {
    await authrepository.resetPassword(email);
  }

  Future<void> signOut() async {
    //zerar o user
    user = UserModel();

    //remover o token localmente
    await UtilsServices.removeLocalData(key: StorageKeys.token);

    //ir para login
    Get.offAllNamed(PagesRoutes.signInRoute);
  }

  void saveTokenAndProceedToBase() {
    //salvar token
    UtilsServices.saveLocalData(key: StorageKeys.token, data: user.token!);
    //ir para base
    Get.offAllNamed(PagesRoutes.baseroute);
  }

  Future<void> signUp() async {
    isLoading.value = true;
    AuthResult result = await authrepository.signUp(user);
    isLoading.value = false;
    result.when(
      success: (user) {
        this.user = user;
        saveTokenAndProceedToBase();
      },
      error: (message) {
        UtilsServices.showToast(
          menssage: message,
          isError: true,
        );
      },
    );
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    AuthResult result =
        await authrepository.signIn(email: email, password: password);

    isLoading.value = false;

    result.when(success: (user) {
      this.user = user;
      saveTokenAndProceedToBase();
    }, error: (menssage) {
      UtilsServices.showToast(
        menssage: menssage,
        isError: true,
      );
    });
  }
}
