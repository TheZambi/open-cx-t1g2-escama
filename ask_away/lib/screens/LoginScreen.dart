import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  String _validateEmail(String text) {
    if (text.isEmpty) return "Enter an e-mail.";

    return null;
  }

  String _validatePasword(String text) {
    if (text.isEmpty) return "Enter a password.";

    return null;
  }

  Widget _EntryField(String title, {bool isPassword = false}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: isPassword ? _passwordController : _loginController,
            obscureText: isPassword,
            decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: Color(0xfff3f3f4),
                filled: true),
          )
        ],
      ),
    );
  }

  Widget _EmailPassword() {
    return Column(
      children: <Widget>[
        _EntryField("Email"),
        _EntryField("Password", isPassword: true),
      ],
    );
  }

  Widget _SubmitButton() {
    return InkWell(
      onTap: _Register,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(2, 4),
                  blurRadius: 5,
                  spreadRadius: 2)
            ],
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xfffbb448),
                  Color(0xfff7892b),
                ])),
        child: Text(
          'Register',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  void _Register() {
    final login = _loginController.text;
    final password = _passwordController.text;
    print("Login: $login , Senha: $password ");

    FirebaseFirestore.instance.collection('Users').add(
      {
        "login": login,
        "password": password
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Container(
        child: Column(
          children: [_EmailPassword(), _SubmitButton()],
        ),
      ),
    );
  }
}
