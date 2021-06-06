import 'package:architecture/architecture/mvp/login_presenter.dart';
import 'package:architecture/architecture/mvp/login_repository.dart';
import 'package:architecture/page/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPageMVP extends StatefulWidget {
  @override
  _LoginPageMVPState createState() => _LoginPageMVPState();
}

class _LoginPageMVPState extends State<LoginPageMVP>
    implements LoginPageContract {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  LoginPresenter? presenter;

  @override
  void initState() {
    super.initState();
    presenter = LoginPresenter(this, repository: LoginRepository());
  }

  @override
  void dispose() => super.dispose();

  @override
  loginSuccess(String? namelogin) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Logado como $namelogin'),
      backgroundColor: Colors.green,
    ));
    await Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => MyHome("MVP")));
  }

  @override
  loginError() => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: const Text("erro"),
        backgroundColor: Colors.red,
      ));

  @override
  void isLodingManager() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: presenter!.formKey,
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
                      onSaved: presenter!.userEmail,
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
                      onSaved: presenter!.userPassword,
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
                    onPressed: presenter!.isLoading ? null : presenter!.singIn,
                    child: const Text('Entrar'),
                  )
                ],
              ))),
    );
  }
}
