import 'package:architecture/architecture/mvc/user_model.dart';
import 'package:architecture/page/home/home_page.dart';
import 'package:flutter/material.dart';

class LoginPageMVC extends StatefulWidget {
  @override
  _LoginPageMVCState createState() => _LoginPageMVCState();
}

class _LoginPageMVCState extends State<LoginPageMVC> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();
  UserModel model = UserModel();

  @override
  void initState() => super.initState();

  @override
  void dispose() => super.dispose();

  _loginSuccess(String? namelogin) async {
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
          key: _formKey,
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
                      onSaved: (value) => model.email = value,
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
                      onSaved: (value) => model.password = value,
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
                    onPressed: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      } else {
                        _formKey.currentState!.save();
                      }
                      if (await model.mathLogin()) {
                        return _loginSuccess(model.email);
                      } else {
                        return _loginError();
                      }
                    },
                    child: const Text('Entrar'),
                  )
                ],
              ))),
    );
  }
}
