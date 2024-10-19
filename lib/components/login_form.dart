import 'package:flutter/material.dart';
import 'package:practice/components/Button.dart';
import 'package:practice/utils/config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  bool _obscurePass = true; // Fixed spelling

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            cursorColor: Config.primaryColor,
            decoration: const InputDecoration(
              hintText: "Email address",
              labelText: "Email",
              alignLabelWithHint: true,
              prefixIcon: Icon(Icons.email_outlined),
              prefixIconColor: Config.primaryColor,
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              return null;
            },
          ),
          TextFormField(
            controller: _passController, // Use _passController for password
            keyboardType: TextInputType.visiblePassword,
            cursorColor: Config.primaryColor,
            obscureText: _obscurePass, // Toggle password visibility
            decoration: InputDecoration(
              hintText: "Password",
              labelText: "Password",
              alignLabelWithHint: true,
              prefixIcon: const Icon(Icons.lock_outline), // Changed to lock icon
              prefixIconColor: Config.primaryColor,
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    _obscurePass = !_obscurePass; // Toggle password visibility
                  });
                },
                icon: _obscurePass
                    ? const Icon(Icons.visibility_off_outlined, color: Colors.black)
                    : const Icon(Icons.visibility_outlined, color: Config.primaryColor),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your password';
              }
              return null;
            },
          ),
          Config.spaceSmall,
          Button(width: double.infinity,
              title: "Sign In",
              onPressed: (){
            Navigator.of(context).pushNamed('main');
              },
              disable: false)
        ],
       
      ),
    );
  }
}
