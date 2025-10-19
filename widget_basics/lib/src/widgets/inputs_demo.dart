import 'package:flutter/material.dart';

class InputsDemo extends StatefulWidget {
  const InputsDemo({super.key});

  @override
  State<InputsDemo> createState() => _InputsDemoState();
}

enum Gender { male, female }

class _InputsDemoState extends State<InputsDemo> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String? country;
  bool stayLoggedIn = false;
  Gender gender = Gender.male;

  List<String> countries = ['America', 'France', 'UK'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Inputs')),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(10),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Enter email'),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Enter password'),
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
              ),
              Row(
                children: [
                  Checkbox(
                    value: stayLoggedIn,
                    onChanged: (value) {
                      setState(() {
                        stayLoggedIn = value!;
                      });
                    },
                  ),
                  Text('Stay logged in'),
                ],
              ),
              Row(
                children: [
                  Radio<Gender>(
                    value: Gender.male,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  Text('Male'),
                  Radio<Gender>(
                    value: Gender.female,
                    groupValue: gender,
                    onChanged: (value) {
                      setState(() {
                        gender = value!;
                      });
                    },
                  ),
                  Text('Female'),
                ],
              ),
              DropdownButton<String>(
                hint: Text('Select your country'),
                items: countries.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                value: country,
                onChanged: (String? newValue) {
                  setState(() {
                    country = newValue;
                  });
                },
              ),
              ElevatedButton(
                onPressed: () {
                  print(emailController.text);
                  print(passwordController.text);
                  print(gender.name);
                  print(country);
                },
                child: Text('Enter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
