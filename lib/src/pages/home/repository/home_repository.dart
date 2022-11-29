import 'package:appquitanda/src/constants/endpoints.dart';
import 'package:appquitanda/src/services/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  getAllCategories() async {
    final result = await _httpManager.restRequest(
      url: Endpoints.getAllCategories,
      method: HttpMethods.post,
    );

    if (result['result'] != null) {
      //lista
    } else {
      //erro
    }
  }
}
