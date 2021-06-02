import 'package:architecture/architecture/mvc/login_controller.dart';
import 'package:architecture/architecture/mvc/login_repository.dart';
import 'package:architecture/page/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPageMVC extends StatefulWidget {
  @override
  _LoginPageMVCState createState() => _LoginPageMVCState();
}

class _LoginPageMVCState extends State<LoginPageMVC> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LoginController? controller;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    controller = LoginController(LoginRepository());
  }

  @override
  void dispose() => super.dispose();

  loginSuccess(String? namelogin) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Logado como $namelogin'),
      backgroundColor: Colors.green,
    ));
    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHome()));
  }

  _loginError() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("erro"),
        backgroundColor: Colors.red,
      ));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: controller!.formKey,
          child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'e-mail'),
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      onSaved: controller!.userEmail,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'camponão pode ser vazio';
                        if (!value.contains('@')) {
                          return 'e-mail invalido';
                        }
                        return null;
                      }),
                  SizedBox(height: 8),
                  TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(), labelText: 'Senha'),
                      textInputAction: TextInputAction.go,
                      keyboardType: TextInputType.name,
                      obscureText: true,
                      onSaved: controller!.userPassword,
                      validator: (String? value) {
                        if (value!.isEmpty) return 'camponão pode ser vazio';
                        return null;
                      }),
                  SizedBox(height: 30),
                  ElevatedButton(
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 80)),
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green)),
                    onPressed: isLoading
                        ? null
                        : () async {
                            setState(() => isLoading = true);
                            if (await controller!.singIn()) {
                              loginSuccess(controller!.user.email);
                            } else {
                              _loginError();
                            }
                            setState(() => isLoading = false);
                          },
                    child: const Text('Entrar'),
                  )
                ],
              ))),
    );
  }
}
