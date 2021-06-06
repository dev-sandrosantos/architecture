import 'package:architecture/architecture/mvp/login_repository.dart';
import 'package:architecture/architecture/mvp/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final model = UserModel(email: 'sandro@aj.com', password: '123456');
  final respository = LoginRepository();

  test('description', () async {
    expect(await respository.mathLogin(model), true);
  });
}
