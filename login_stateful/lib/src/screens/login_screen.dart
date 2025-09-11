import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();

  Widget build(context) {
    return Container(
      margin: EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            emailField(),
            passwordField(),
            Container(margin: EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
        validator: (value) {
          if (value != null && !value.contains('@') && value.length < 5) {
            return 'Please enter a valid email';
          }
          return null;
        },
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@domain.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      validator: (value) {
        if (value != null && value.length < 8) {
          return 'Password must be at least 8 characters';
        }
        return null;
      },
      obscureText: true,
      decoration: InputDecoration(labelText: 'Password', hintText: 'Password'),
    );
  }

  Widget submitButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(Colors.deepPurple),
        foregroundColor: WidgetStateProperty.all(Colors.white),
      ),
      child: Text('Submit'),
      onPressed: () {
        print(formKey.currentState?.validate());
      },
    );
  }
}
