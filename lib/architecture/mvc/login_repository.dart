import 'package:architecture/architecture/mvc/user_model.dart';

class LoginRepository {
  Future<bool> mathLogin(UserModel model) async {
    await Future.delayed(Duration(seconds: 2));
    return model.email == 'sandro@aj.com' && model.password == '123456';
  }
}
