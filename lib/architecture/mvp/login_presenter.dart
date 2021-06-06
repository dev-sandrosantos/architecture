import 'package:flutter/material.dart';

import 'login_repository.dart';
import 'user_model.dart';

abstract class LoginPageContract {
  void loginSuccess(String? email);
  void loginError();
  void isLodingManager();
}

class LoginPresenter {
  final formKey = GlobalKey<FormState>();
  UserModel user = UserModel();
  final LoginRepository? repository;
  final LoginPageContract viewContract;
  bool isLoading = false;

  LoginPresenter(this.viewContract, {this.repository});

  userEmail(String? value) => user.email = value;

  userPassword(String? value) => user.password = value;

  singIn() async {
    bool islogin;
    isLoading = true;
    viewContract.isLodingManager();
    if (!formKey.currentState!.validate()) {
      islogin = false;
    } else {
      formKey.currentState!.save();
      try {
        islogin = await repository!.mathLogin(user);
      } catch (e) {
        islogin = false;
      }
    }
    isLoading = false;
    viewContract.isLodingManager();
    if (islogin) {
      viewContract.loginSuccess(user.email);
    } else {
      viewContract.loginError();
    }
  }
}
