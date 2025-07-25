import 'package:flutter/material.dart';
import 'package:urgut_please/core/utils/extensions.dart';
import 'package:urgut_please/core/utils/validators.dart';
import 'package:urgut_please/shared/widgets/authentication_input_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key, required this.formKey, required this.loginController, required this.passwordController});

  final GlobalKey<FormState> formKey;

  final TextEditingController loginController;
  final TextEditingController passwordController;

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          AuthenticationInputField(
            label: "Login",
            validator: LoginValidator.validator,
            controller: widget.loginController,
          ),
          10.h,
          AuthenticationInputField(
            label: "Parol",
            validator: TextValidator.validator,
            controller: widget.passwordController,
            obscure: true,
          ),
        ],
      ),
    );
  }
}
