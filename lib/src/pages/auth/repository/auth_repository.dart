import 'package:appquitanda/src/constants/endpoints.dart';
import 'package:appquitanda/src/models/user_modelo.dart';
import 'package:appquitanda/src/services/http_manager.dart';

class AuthRepository {
  final HttpManager _httpManager = HttpManager();

  Future signIn({required String email, required String password}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.signin,
      method: HttpMethods.post,
      body: {
        "email": email,
        "password": password,
      },
    );

    if (result['result'] != null) {
      print('singin funcionol');

      final user = UserModel.fromMap(result['result']);

      print(user);
    } else {
      print('singin nao funcionol');
      print(result['error']);
    }
  }
}
