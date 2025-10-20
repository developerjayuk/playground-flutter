import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String? email;
  String? password;

  @override
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
      validator: (value) => validateEmail(value ?? ''),
      onSaved: (value) {
        email = value;
      },
      decoration: InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@domain.com',
      ),
    );
  }

  Widget passwordField() {
    return TextFormField(
      validator: (value) => validatePassword(value ?? ''),
      onSaved: (value) {
        password = value;
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
        if (formKey.currentState?.validate() ?? false) {
          formKey.currentState?.save();
          print('Time to send using $email and $password');
        }
      },
    );
  }
}
