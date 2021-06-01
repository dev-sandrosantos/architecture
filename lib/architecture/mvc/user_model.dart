class UserModel {
  String? email;
  String? password;

  UserModel({this.email, this.password});

  Future<bool> mathLogin() async {
    await Future.delayed(Duration(seconds: 2));
    return email == 'sandro@aj.com' && password == '123456';
  }
}
