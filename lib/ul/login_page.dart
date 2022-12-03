import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Login Page"),
          TextField(
              key: Key('loginForm_usernameInput_textField'),
              decoration: InputDecoration(labelText: 'username')),
          TextField(
              key: Key('loginForm_passwordInput_textField'),
              decoration: InputDecoration(labelText: 'password')),
        ],
      ),
    );
  }
}
