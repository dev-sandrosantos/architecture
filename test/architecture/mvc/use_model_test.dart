import 'package:architecture/architecture/mvc/user_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final model = UserModel(email: 'sandro@aj.com', password: '123456');
  test('must return an email template', () async {
    expect(await model.mathLogin(), true);
  });
}
