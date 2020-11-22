import 'package:ask_away/components/SimpleAppBar.dart';
import 'package:ask_away/components/SimpleButton.dart';
import 'package:ask_away/screens/main_screen/MainScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/EntryField.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(context),
      body: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 5), // changes position of shadow
                ),
              ],
            ),
            height: 520,
            padding: EdgeInsets.only(
              left: 35,
              right: 35,
            ),
            margin: EdgeInsets.only(
              bottom: 70,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                EntryField(EntryFieldType.USERNAME),
                EntryField(EntryFieldType.PASSWORD),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 40,
              right: 40,
              bottom: 40,
            ),
            child: SimpleButton("Login"),
          ),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 20,
              ),
              children: [
                TextSpan(
                  text: "Don’t have an account? ",
                  style: TextStyle(
                    color: Color(0xFFF979797),
                  ),
                ),
                TextSpan(
                  text: "Register",
                  style: TextStyle(
                    color: Color(0xFFFF5656),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

