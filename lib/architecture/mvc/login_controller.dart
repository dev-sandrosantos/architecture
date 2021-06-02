import 'package:flutter/material.dart';

import 'login_repository.dart';
import 'user_model.dart';

class LoginController {
  final formKey = GlobalKey<FormState>();
  UserModel user = UserModel();
  final LoginRepository repository;

  LoginController(this.repository);

  userEmail(String? value) => user.email = value;

  userPassword(String? value) => user.password = value;

  Future<bool> singIn() async {
    if (!formKey.currentState!.validate()) {
      return false;
    }
    formKey.currentState!.save();
    try {
      return await repository.mathLogin(user);
    } catch (e) {
      return false;
    }
  }
}
