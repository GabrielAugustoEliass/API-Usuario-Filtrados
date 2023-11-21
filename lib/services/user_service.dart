import 'package:api_users_filter/model/user_model.dart';
import 'package:dio/dio.dart';

class UserService {
  final Dio _dio = Dio();

  Future<List<UserModel>> fetchUser() async {
    const urlApi = 'https://jsonplaceholder.typicode.com/users';
    final response = await _dio.get(urlApi);

    if (response.statusCode == 200) {
      return (response.data as List).map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao encontrar API');
    }
  }
}
