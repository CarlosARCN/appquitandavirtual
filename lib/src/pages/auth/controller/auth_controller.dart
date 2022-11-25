import 'package:appquitanda/src/pages/auth/repository/auth_repository.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  RxBool isLoading = false.obs;

  final authrepository = AuthRepository();

  Future<void> singIn({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;

    await authrepository.signIn(email: email, password: password);

    isLoading.value = false;
  }
}
