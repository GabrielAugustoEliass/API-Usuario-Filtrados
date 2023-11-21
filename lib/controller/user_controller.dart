import 'package:api_users_filter/model/user_model.dart';
import 'package:api_users_filter/services/user_service.dart';

class UserController extends UserService {
  final UserService userService = UserService();

  List<UserModel> listUserFilters = [];

  Future<List<UserModel>> getUser() async {
    return await userService.fetchUser();
  }
}
